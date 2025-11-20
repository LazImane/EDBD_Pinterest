-- =============================================
-- DIMENSIONS
-- =============================================
drop table fact_conversion; 
drop table dim_category;
drop table dim_date; 
drop table dim_event_type; 
drop table dim_user; 
drop table dim_pin; 
drop table dim_campaign; 
drop table dim_merchant; 
drop table dim_time; 
-- Dimension Date
CREATE TABLE dim_date (
    date_id NUMBER PRIMARY KEY,
    full_date DATE NOT NULL,
    day_of_week VARCHAR2(10),
    week_of_year NUMBER,
    month VARCHAR2(10),
    quarter VARCHAR2(2),
    year NUMBER,
    is_weekend NUMBER(1),
    is_holiday NUMBER(1)
);

CREATE TABLE dim_time (
    time_id NUMBER PRIMARY KEY, 
    hour NUMBER, 
    minute NUMBER, 
    second NUMBER, 
    time_bucket VARCHAR2(10), 
    period_of_the_day VARCHAR2(10), 
    minute_of_the_day NUMBER
);


-- Dimension Event Type
CREATE TABLE dim_event_type (
    event_type_id VARCHAR2(20) PRIMARY KEY,
    event_type_name VARCHAR2(100) NOT NULL,
    event_category VARCHAR2(50),
    is_monetisable NUMBER(1),
    conversion_credit VARCHAR2(20),
    default_value NUMBER(10,2),
    description VARCHAR2(500)
);

-- Dimension User
CREATE TABLE dim_user (
    user_id NUMBER PRIMARY KEY,
    signup_date DATE,
    cohort_month VARCHAR2(7),
    country VARCHAR2(2),
    language VARCHAR2(5),
    age_bucket VARCHAR2(20),
    gender VARCHAR2(20),
    signup_channel VARCHAR2(50),
    device_preference VARCHAR2(20),
    follower_count NUMBER,
    account_type VARCHAR2(30)
);

-- Dimension Pin
CREATE TABLE dim_pin (
    pin_id NUMBER PRIMARY KEY,
    creator_user_id NUMBER,
    created_at TIMESTAMP,
    pin_type VARCHAR2(30),
    tags_list CLOB,
    is_promoted NUMBER(1),
    media_format VARCHAR2(30),
    external_url_domain VARCHAR2(255),
    content_language VARCHAR2(5),
    pin_title VARCHAR2(500),
    nb_saves NUMBER
);

-- Dimension Merchant
CREATE TABLE dim_merchant (
    merchant_id NUMBER PRIMARY KEY,
    domain VARCHAR2(255),
    merchant_name VARCHAR2(255),
    industry VARCHAR2(100),
    country VARCHAR2(2),
    store_currency VARCHAR2(3),
    integration_method VARCHAR2(50),
    lifetime_spend_est NUMBER(15,2),
    avg_order_value_est NUMBER(10,2),
    merchant_tier VARCHAR2(20),
    contact_region VARCHAR2(50)
);

-- Dimension Campaign
CREATE TABLE dim_campaign (
    campaign_id NUMBER PRIMARY KEY,
    advertiser_id NUMBER,
    campaign_name VARCHAR2(255),
    objective VARCHAR2(50),
    start_date DATE,
    end_date DATE,
    budget NUMBER(15,2),
    bid_strategy VARCHAR2(50),
    targeting_summary CLOB,
    status VARCHAR2(20),
    placement_type VARCHAR2(50)
);
-- TABLE AJOUTEE A LA PARTIE 4 
CREATE TABLE dim_category(
   category_id NUMBER PRIMARY KEY, 
   category_name VARCHAR2(50), 
   parent_category_id NUMBER, 
   category_level NUMBER, 
   description VARCHAR2(60), 
    is_active NUMBER(1) CHECK (is_active IN (0, 1))
    ); 

-- =============================================
-- TABLE DE FAIT PRINCIPALE
-- =============================================

CREATE TABLE fact_conversion (
    conversion_id NUMBER PRIMARY KEY,
    time_id NUMBER,
    date_id NUMBER,
    user_id NUMBER,
    pin_id NUMBER,
    campaign_id NUMBER,
    merchant_id NUMBER,
    category_id NUMBER,
    event_type_id VARCHAR2(20),
    conversion_value NUMBER(15,2),
    conversion_count NUMBER
    );
ALTER TABLE fact_conversion ADD CONSTRAINT fk_time 
    FOREIGN KEY (time_id) REFERENCES dim_time(time_id);

ALTER TABLE fact_conversion ADD CONSTRAINT fk_date 
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id);

ALTER TABLE fact_conversion ADD CONSTRAINT fk_user 
    FOREIGN KEY (user_id) REFERENCES dim_user(user_id);
ALTER TABLE fact_conversion ADD CONSTRAINT fk_pin 
    FOREIGN KEY (pin_id) REFERENCES dim_pin(pin_id);

ALTER TABLE fact_conversion ADD CONSTRAINT fk_campaign 
    FOREIGN KEY (campaign_id) REFERENCES dim_campaign(campaign_id);

ALTER TABLE fact_conversion ADD CONSTRAINT fk_merchant 
    FOREIGN KEY (merchant_id) REFERENCES dim_merchant(merchant_id);

ALTER TABLE fact_conversion ADD CONSTRAINT fk_event_type 
    FOREIGN KEY (event_type_id) REFERENCES dim_event_type(event_type_id);

ALTER TABLE fact_conversion ADD CONSTRAINT fk_category
    FOREIGN KEY (category_id) REFERENCES dim_category(category_id); 

-- =============================================
-- VUES VIRTUELLES POUR DIMENSIONS PARTAGÉES
-- =============================================
CREATE OR REPLACE VIEW DATEDIM
AS SELECT * FROM DIM_DATE ; 

CREATE OR REPLACE VIEW PINDIM
AS SELECT * FROM DIM_PIN; 

CREATE OR REPLACE VIEW USERDIM
AS SELECT * FROM DIM_USER; 

-- ==============================================
-- REQUETES ANALYTIQUES 
-- ==============================================

-- CREATING MATERIALIZED VIEWS -- 
CREATE MATERIALIZED VIEW mv_daily_campaign_merchant AS
    SELECT 
    f.date_id, f.campaign_id, f.merchant_id,
   SUM(f.conversion_value) as total_revenue,
   SUM(f.conversion_count) as total_conversions
FROM fact_conversion f
GROUP BY f.date_id, f.campaign_id, f.merchant_id;


CREATE MATERIALIZED VIEW mv_user_cohort AS
SELECT 
    u.cohort_month, u.country, u.device_preference,
    COUNT(DISTINCT f.user_id) as user_count,
    SUM(f.conversion_value) as total_revenue
FROM fact_conversion f
JOIN dim_user u ON f.user_id = u.user_id
GROUP BY u.cohort_month, u.country, u.device_preference;

CREATE MATERIALIZED VIEW mv_category_time AS
SELECT 
    c.category_id, t.period_of_the_day, d.is_weekend,
    SUM(f.conversion_value) as total_revenue,
    COUNT(*) as conversion_count
FROM fact_conversion f
JOIN dim_category c ON f.category_id = c.category_id
JOIN dim_time t ON f.time_id = t.time_id
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY c.category_id, t.period_of_the_day, d.is_weekend;

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX bji_is_weekend';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX bji_campaign_objective';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/
 
-- BITMAP --
CREATE BITMAP INDEX bji_campaign_objective
ON fact_conversion(event_type_id)



CREATE BITMAP INDEX bji_is_weekend
ON fact_conversion(is_weekend)

