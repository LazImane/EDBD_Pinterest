-- PARTITIONS -- 
drop table if exists dim_pin_static; 
drop table if exists dim_pin_dynamic; 
CREATE TABLE dim_pin_static (
    pin_id NUMBER PRIMARY KEY,
    creator_user_id NUMBER,
    created_at TIMESTAMP NOT NULL,
    pin_type VARCHAR2(30),
    media_format VARCHAR2(30),
    content_language VARCHAR2(5)
)
-- partition by row -- 
PARTITION BY RANGE (created_at) (
    PARTITION p_2024_q1 VALUES LESS THAN (TO_TIMESTAMP('2024-04-01', 'YYYY-MM-DD')),
    PARTITION p_2024_q2 VALUES LESS THAN (TO_TIMESTAMP('2024-07-01', 'YYYY-MM-DD')),
    PARTITION p_2024_q3 VALUES LESS THAN (TO_TIMESTAMP('2024-10-01', 'YYYY-MM-DD')),
    PARTITION p_2024_q4 VALUES LESS THAN (TO_TIMESTAMP('2025-01-01', 'YYYY-MM-DD')),
    PARTITION p_2025_q1 VALUES LESS THAN (TO_TIMESTAMP('2025-04-01', 'YYYY-MM-DD')),
    PARTITION p_2025_q2 VALUES LESS THAN (TO_TIMESTAMP('2025-07-01', 'YYYY-MM-DD')),
    PARTITION p_future VALUES LESS THAN (MAXVALUE)
);

CREATE TABLE dim_pin_dynamic (
    pin_id NUMBER PRIMARY KEY,
    tags_list VARCHAR2(50),
    is_promoted NUMBER(1),
    external_url_domain VARCHAR2(255),
    nb_saves NUMBER,
    pin_title VARCHAR2(500)
    )
    PARTITION BY HASH (pin_id) PARTITIONS 8;


-- ajout des exemples pour essayer la requête -- 
INSERT INTO dim_pin_static VALUES (5013, 1003, TIMESTAMP '2025-01-05 11:15:00', 'Product', 'Video', 'en');
INSERT INTO dim_pin_static VALUES (5014, 1004, TIMESTAMP '2025-01-15 14:25:00', 'Beauty', 'Image', 'fr');
INSERT INTO dim_pin_static VALUES (5015, 1005, TIMESTAMP '2025-02-10 10:45:00', 'Fashion', 'Image', 'en');
INSERT INTO dim_pin_static VALUES (5016, 1006, TIMESTAMP '2025-02-20 13:50:00', 'Food', 'Video', 'en');
INSERT INTO dim_pin_static VALUES (5017, 1007, TIMESTAMP '2025-03-05 09:30:00', 'Travel', 'Image', 'es');
INSERT INTO dim_pin_static VALUES (5018, 1008, TIMESTAMP '2025-03-15 15:40:00', 'Fitness', 'Video', 'en');
INSERT INTO dim_pin_dynamic VALUES (5013, 'electronics,smartphone,latest', 1, 'samsung.com', 8900, 'Latest Smartphone Features');
INSERT INTO dim_pin_dynamic VALUES (5014, 'beauty,makeup,tutorial,spring', 1, 'sephora.com', 6543, 'Spring Makeup Tutorial 2025');
INSERT INTO dim_pin_dynamic VALUES (5015, 'fashion,spring,collection,new', 1, 'hm.com', 7890, 'Spring Fashion Collection');
INSERT INTO dim_pin_dynamic VALUES (5016, 'food,healthy,recipe,vegan', 0, 'healthyblog.com', 4321, 'Healthy Vegan Recipes');
INSERT INTO dim_pin_dynamic VALUES (5017, 'travel,europe,destinations,2025', 1, 'booking.com', 5432, 'Top Europe Destinations 2025');
INSERT INTO dim_pin_dynamic VALUES (5018, 'fitness,workout,home,equipment', 1, 'peloton.com', 9876, 'Home Workout Equipment Guide');
-- requête sur le tableau statique -- 
    SELECT 
    COUNT(*) as promoted_pins
    FROM dim_pin_dynamic d
    JOIN dim_pin_static s ON d.pin_id = s.pin_id
    WHERE s.created_at BETWEEN TIMESTAMP '2025-01-01 00:00:00' AND TIMESTAMP '2025-03-31 23:59:59';
