-- =============================================
-- DIMENSIONS
-- =============================================
drop table dim_date; 
drop table dim_event_type; 
drop table dim_user; 
drop table dim_pin; 
drop table dim_campaign; 
drop table dim_merchant; 
drop table fact_conversion; 
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

CREATE TABLE dim_time(
    time_id NUMBER PRIMARY KEY, 
    hour NUMBER, 
    minute NUMBER, 
    second NUMBER, 
    time_bucket VARCHAR(10), 
    period_of_the_day VARCHAR(10), 
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
    event_type_id VARCHAR2(20),
    conversion_value NUMBER(15,2),
    conversion_count NUMBER,
    
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
CREATE TABLE categorie(
    
); 
-- =============================================
-- VUES VIRTUELLES POUR DIMENSIONS PARTAGÉES
-- =============================================

-- Vue pour l'analyse des performances des campagnes
CREATE OR REPLACE VIEW v_campaign_performance AS
SELECT 
    c.campaign_id,
    c.campaign_name,
    c.objective,
    c.budget,
    COUNT(f.conversion_id) as total_conversions,
    SUM(f.conversion_value) as total_revenue,
    CASE WHEN c.budget > 0 THEN SUM(f.conversion_value) / c.budget ELSE 0 END as roas
FROM dim_campaign c
LEFT JOIN fact_conversion f ON c.campaign_id = f.campaign_id
GROUP BY c.campaign_id, c.campaign_name, c.objective, c.budget;

-- Vue pour l'analyse utilisateur avec conversions
CREATE OR REPLACE VIEW v_user_conversion_analysis AS
SELECT 
    u.user_id,
    u.country,
    u.age_bucket,
    u.account_type,
    COUNT(f.conversion_id) as conversion_count,
    SUM(f.conversion_value) as total_value,
    et.event_category
FROM dim_user u
JOIN fact_conversion f ON u.user_id = f.user_id
JOIN dim_event_type et ON f.event_type_id = et.event_type_id
GROUP BY u.user_id, u.country, u.age_bucket, u.account_type, et.event_category;

-- =============================================
-- INDEX POUR LES PERFORMANCES
-- =============================================

-- Index sur les clés étrangères de la table de fait
CREATE INDEX idx_fact_conv_time ON fact_conversion(time_id);
CREATE INDEX idx_fact_conv_user ON fact_conversion(user_id);
CREATE INDEX idx_fact_conv_pin ON fact_conversion(pin_id);
CREATE INDEX idx_fact_conv_campaign ON fact_conversion(campaign_id);
CREATE INDEX idx_fact_conv_merchant ON fact_conversion(merchant_id);
CREATE INDEX idx_fact_conv_event_type ON fact_conversion(event_type_id);

-- Index sur les colonnes fréquemment interrogées
CREATE INDEX idx_user_country ON dim_user(country);
CREATE INDEX idx_user_age ON dim_user(age_bucket);
CREATE INDEX idx_pin_promoted ON dim_pin(is_promoted);
CREATE INDEX idx_pin_category ON dim_pin(category_id);
CREATE INDEX idx_campaign_status ON dim_campaign(status);
CREATE INDEX idx_merchant_industry ON dim_merchant(industry);


CREATE OR REPLACE VIEW DATEDIM
AS SELECT * FROM DIM_DATE ; 

CREATE OR REPLACE VIEW PINDIM
AS SELECT * FROM DIM_PIN; 

CREATE OR REPLACE VIEW USERDIM
AS SELECT * FROM DIM_USER; 
