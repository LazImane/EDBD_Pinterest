-- =============================================
-- INSERT TEST DATA FOR PINTEREST STAR SCHEMA
-- =============================================

-- =============================================
-- 1. DIM_DATE (30 days of data)
-- =============================================
INSERT INTO dim_date VALUES (20250101, TO_DATE('2025-01-01', 'YYYY-MM-DD'), 'Wednesday', 1, 'January', 'Q1', 2025, 0, 1);
INSERT INTO dim_date VALUES (20250102, TO_DATE('2025-01-02', 'YYYY-MM-DD'), 'Thursday', 1, 'January', 'Q1', 2025, 0, 0);
INSERT INTO dim_date VALUES (20250103, TO_DATE('2025-01-03', 'YYYY-MM-DD'), 'Friday', 1, 'January', 'Q1', 2025, 0, 0);
INSERT INTO dim_date VALUES (20250104, TO_DATE('2025-01-04', 'YYYY-MM-DD'), 'Saturday', 1, 'January', 'Q1', 2025, 1, 0);
INSERT INTO dim_date VALUES (20250105, TO_DATE('2025-01-05', 'YYYY-MM-DD'), 'Sunday', 1, 'January', 'Q1', 2025, 1, 0);
INSERT INTO dim_date VALUES (20250106, TO_DATE('2025-01-06', 'YYYY-MM-DD'), 'Monday', 2, 'January', 'Q1', 2025, 0, 0);
INSERT INTO dim_date VALUES (20250107, TO_DATE('2025-01-07', 'YYYY-MM-DD'), 'Tuesday', 2, 'January', 'Q1', 2025, 0, 0);
INSERT INTO dim_date VALUES (20250108, TO_DATE('2025-01-08', 'YYYY-MM-DD'), 'Wednesday', 2, 'January', 'Q1', 2025, 0, 0);
INSERT INTO dim_date VALUES (20250109, TO_DATE('2025-01-09', 'YYYY-MM-DD'), 'Thursday', 2, 'January', 'Q1', 2025, 0, 0);
INSERT INTO dim_date VALUES (20250110, TO_DATE('2025-01-10', 'YYYY-MM-DD'), 'Friday', 2, 'January', 'Q1', 2025, 0, 0);
INSERT INTO dim_date VALUES (20250111, TO_DATE('2025-01-11', 'YYYY-MM-DD'), 'Saturday', 2, 'January', 'Q1', 2025, 1, 0);
INSERT INTO dim_date VALUES (20250112, TO_DATE('2025-01-12', 'YYYY-MM-DD'), 'Sunday', 2, 'January', 'Q1', 2025, 1, 0);
INSERT INTO dim_date VALUES (20250113, TO_DATE('2025-01-13', 'YYYY-MM-DD'), 'Monday', 3, 'January', 'Q1', 2025, 0, 0);
INSERT INTO dim_date VALUES (20250114, TO_DATE('2025-01-14', 'YYYY-MM-DD'), 'Tuesday', 3, 'January', 'Q1', 2025, 0, 0);
INSERT INTO dim_date VALUES (20250115, TO_DATE('2025-01-15', 'YYYY-MM-DD'), 'Wednesday', 3, 'January', 'Q1', 2025, 0, 0);

-- =============================================
-- 2. DIM_TIME (Sample times throughout the day)
-- =============================================
INSERT INTO dim_time VALUES (1, 0, 0, 0, '00:00', 'Night', 0);
INSERT INTO dim_time VALUES (2, 6, 30, 0, '06:30', 'Morning', 390);
INSERT INTO dim_time VALUES (3, 9, 15, 0, '09:15', 'Morning', 555);
INSERT INTO dim_time VALUES (4, 12, 0, 0, '12:00', 'Afternoon', 720);
INSERT INTO dim_time VALUES (5, 14, 30, 0, '14:30', 'Afternoon', 870);
INSERT INTO dim_time VALUES (6, 18, 45, 0, '18:45', 'Evening', 1125);
INSERT INTO dim_time VALUES (7, 20, 0, 0, '20:00', 'Evening', 1200);
INSERT INTO dim_time VALUES (8, 22, 30, 0, '22:30', 'Night', 1350);

-- =============================================
-- 3. DIM_EVENT_TYPE
-- =============================================
INSERT INTO dim_event_type VALUES ('PAGE_VISIT', 'Page Visit', 'Engagement', 0, NULL, 0, 'User visited a product page');
INSERT INTO dim_event_type VALUES ('ADD_TO_CART', 'Add to Cart', 'Conversion', 1, 'Last-click', 0, 'User added item to shopping cart');
INSERT INTO dim_event_type VALUES ('CHECKOUT', 'Checkout Started', 'Conversion', 1, 'Last-click', 0, 'User started checkout process');
INSERT INTO dim_event_type VALUES ('PURCHASE', 'Purchase', 'Conversion', 1, 'Last-click', 50, 'User completed purchase');
INSERT INTO dim_event_type VALUES ('SIGNUP', 'User Signup', 'Engagement', 1, 'First-click', 10, 'New user signed up');

-- =============================================
-- 4. DIM_USER (10 users)
-- =============================================
INSERT INTO dim_user VALUES (1001, TO_DATE('2024-12-01', 'YYYY-MM-DD'), '2024-12', 'US', 'en-US', '25-34', 'Female', 'Organic', 'Mobile', 150, 'Personal');
INSERT INTO dim_user VALUES (1002, TO_DATE('2024-12-05', 'YYYY-MM-DD'), '2024-12', 'FR', 'fr-FR', '35-44', 'Male', 'Paid', 'Desktop', 320, 'Business');
INSERT INTO dim_user VALUES (1003, TO_DATE('2024-12-10', 'YYYY-MM-DD'), '2024-12', 'UK', 'en-GB', '18-24', 'Female', 'Social', 'Mobile', 89, 'Personal');
INSERT INTO dim_user VALUES (1004, TO_DATE('2024-11-15', 'YYYY-MM-DD'), '2024-11', 'DE', 'de-DE', '45-54', 'Male', 'Organic', 'Tablet', 456, 'Business');
INSERT INTO dim_user VALUES (1005, TO_DATE('2024-11-20', 'YYYY-MM-DD'), '2024-11', 'US', 'en-US', '25-34', 'Female', 'Referral', 'Mobile', 678, 'Personal');
INSERT INTO dim_user VALUES (1006, TO_DATE('2025-01-02', 'YYYY-MM-DD'), '2025-01', 'CA', 'en-CA', '35-44', 'Male', 'Paid', 'Desktop', 234, 'Personal');
INSERT INTO dim_user VALUES (1007, TO_DATE('2025-01-05', 'YYYY-MM-DD'), '2025-01', 'FR', 'fr-FR', '25-34', 'Female', 'Social', 'Mobile', 567, 'Business');
INSERT INTO dim_user VALUES (1008, TO_DATE('2024-10-10', 'YYYY-MM-DD'), '2024-10', 'UK', 'en-GB', '18-24', 'Male', 'Organic', 'Mobile', 123, 'Personal');
INSERT INTO dim_user VALUES (1009, TO_DATE('2024-10-20', 'YYYY-MM-DD'), '2024-10', 'US', 'en-US', '45-54', 'Female', 'Paid', 'Desktop', 890, 'Business');
INSERT INTO dim_user VALUES (1010, TO_DATE('2024-12-25', 'YYYY-MM-DD'), '2024-12', 'DE', 'de-DE', '35-44', 'Male', 'Referral', 'Tablet', 345, 'Personal');

-- =============================================
-- 5. DIM_PIN (10 pins)
-- =============================================
INSERT INTO dim_pin VALUES (5001, 1001, TIMESTAMP '2024-12-15 10:30:00', 'Product', 'fashion,summer,dress', 1, 'Image', 'shopify.com', 'en', 'Summer Fashion Trends 2025', 1234);
INSERT INTO dim_pin VALUES (5002, 1002, TIMESTAMP '2024-12-18 14:20:00', 'Recipe', 'food,dinner,italian', 0, 'Image', 'foodblog.com', 'en', 'Easy Pasta Recipe', 567);
INSERT INTO dim_pin VALUES (5003, 1003, TIMESTAMP '2024-12-20 09:15:00', 'DIY', 'craft,home,decor', 1, 'Video', 'etsy.com', 'en', 'DIY Home Decoration Ideas', 2345);
INSERT INTO dim_pin VALUES (5004, 1004, TIMESTAMP '2024-12-22 16:45:00', 'Product', 'electronics,gadgets', 1, 'Image', 'amazon.com', 'de', 'Latest Tech Gadgets', 3456);
INSERT INTO dim_pin VALUES (5005, 1005, TIMESTAMP '2024-12-28 11:00:00', 'Fashion', 'shoes,sneakers,sport', 1, 'Image', 'nike.com', 'en', 'New Running Shoes Collection', 4567);
INSERT INTO dim_pin VALUES (5006, 1006, TIMESTAMP '2025-01-02 13:30:00', 'Travel', 'vacation,beach,tropical', 0, 'Image', 'travelblog.com', 'en', 'Top Beach Destinations', 890);
INSERT INTO dim_pin VALUES (5007, 1007, TIMESTAMP '2025-01-04 15:20:00', 'Product', 'beauty,skincare', 1, 'Video', 'sephora.com', 'fr', 'Winter Skincare Routine', 1678);
INSERT INTO dim_pin VALUES (5008, 1008, TIMESTAMP '2025-01-06 10:10:00', 'Fitness', 'workout,gym,health', 0, 'Video', 'fitnessblog.com', 'en', '30-Day Fitness Challenge', 2890);
INSERT INTO dim_pin VALUES (5009, 1009, TIMESTAMP '2025-01-08 12:40:00', 'Product', 'furniture,home', 1, 'Image', 'ikea.com', 'en', 'Modern Living Room Ideas', 3234);
INSERT INTO dim_pin VALUES (5010, 1010, TIMESTAMP '2025-01-10 14:50:00', 'Recipe', 'dessert,baking,cake', 0, 'Image', 'bakingblog.com', 'de', 'Chocolate Cake Recipe', 1456);

-- =============================================
-- 6. DIM_MERCHANT (8 merchants)
-- =============================================
INSERT INTO dim_merchant VALUES (2001, 'shopify.com', 'Fashion Boutique', 'Fashion', 'US', 'USD', 'API', 500000, 75.50, 'Premium', 'North America');
INSERT INTO dim_merchant VALUES (2002, 'amazon.com', 'Amazon Marketplace', 'Electronics', 'US', 'USD', 'API', 10000000, 125.00, 'Enterprise', 'Global');
INSERT INTO dim_merchant VALUES (2003, 'etsy.com', 'Craft Store', 'Handmade', 'US', 'USD', 'Pixel', 250000, 45.00, 'Standard', 'North America');
INSERT INTO dim_merchant VALUES (2004, 'nike.com', 'Nike Official', 'Sportswear', 'US', 'USD', 'API', 2000000, 150.00, 'Premium', 'Global');
INSERT INTO dim_merchant VALUES (2005, 'sephora.com', 'Sephora Beauty', 'Beauty', 'FR', 'EUR', 'API', 800000, 65.00, 'Premium', 'Europe');
INSERT INTO dim_merchant VALUES (2006, 'ikea.com', 'IKEA Furniture', 'Furniture', 'SE', 'EUR', 'Pixel', 1500000, 200.00, 'Enterprise', 'Global');
INSERT INTO dim_merchant VALUES (2007, 'zara.com', 'Zara Fashion', 'Fashion', 'ES', 'EUR', 'API', 1200000, 85.00, 'Premium', 'Europe');
INSERT INTO dim_merchant VALUES (2008, 'walmart.com', 'Walmart', 'Retail', 'US', 'USD', 'Pixel', 5000000, 95.00, 'Enterprise', 'North America');

-- =============================================
-- 7. DIM_CAMPAIGN (6 campaigns)
-- =============================================
INSERT INTO dim_campaign VALUES (3001, 2001, 'Summer Sale 2025', 'Conversions', TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-01-31', 'YYYY-MM-DD'), 50000, 'CPC', 'US, UK, Female, 25-44', 'Active', 'Feed');
INSERT INTO dim_campaign VALUES (3002, 2002, 'Electronics Launch', 'Awareness', TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-02-28', 'YYYY-MM-DD'), 100000, 'CPM', 'Global, Tech enthusiasts', 'Active', 'Video');
INSERT INTO dim_campaign VALUES (3003, 2003, 'Holiday Crafts', 'Traffic', TO_DATE('2024-12-01', 'YYYY-MM-DD'), TO_DATE('2025-01-15', 'YYYY-MM-DD'), 15000, 'CPC', 'US, Female, 25-54', 'Completed', 'Feed');
INSERT INTO dim_campaign VALUES (3004, 2004, 'New Year Fitness', 'Conversions', TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-01-31', 'YYYY-MM-DD'), 80000, 'CPA', 'US, UK, Both, 18-44', 'Active', 'Shopping');
INSERT INTO dim_campaign VALUES (3005, 2005, 'Beauty Essentials', 'Conversions', TO_DATE('2025-01-05', 'YYYY-MM-DD'), TO_DATE('2025-02-05', 'YYYY-MM-DD'), 35000, 'CPC', 'FR, Female, 25-44', 'Active', 'Feed');
INSERT INTO dim_campaign VALUES (3006, 2006, 'Home Makeover', 'Awareness', TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-03-31', 'YYYY-MM-DD'), 120000, 'CPM', 'Europe, 25-54', 'Active', 'Video');

-- =============================================
-- 8. DIM_CATEGORY (Hierarchical categories)
-- =============================================
INSERT INTO dim_category VALUES (1, 'Fashion', NULL, 1, 'Fashion and Apparel', 1);
INSERT INTO dim_category VALUES (2, 'Women Fashion', 1, 2, 'Women clothing and accessories', 1);
INSERT INTO dim_category VALUES (3, 'Men Fashion', 1, 2, 'Men clothing and accessories', 1);
INSERT INTO dim_category VALUES (4, 'Electronics', NULL, 1, 'Electronic devices and gadgets', 1);
INSERT INTO dim_category VALUES (5, 'Computers', 4, 2, 'Laptops and computers', 1);
INSERT INTO dim_category VALUES (6, 'Mobile', 4, 2, 'Mobile phones and tablets', 1);
INSERT INTO dim_category VALUES (7, 'Home AND Garden', NULL, 1, 'Home improvement and garden', 1);
INSERT INTO dim_category VALUES (8, 'Furniture', 7, 2, 'Home furniture', 1);
INSERT INTO dim_category VALUES (9, 'Beauty', NULL, 1, 'Beauty and personal care', 1);
INSERT INTO dim_category VALUES (10, 'Sports', NULL, 1, 'Sports and fitness', 1);

-- =============================================
-- 9. FACT_CONVERSION (50 conversion events)
-- =============================================

-- User 1001 - Fashion purchases
INSERT INTO fact_conversion VALUES (1, 3, 20250102, 1001, 5001, 3001, 2001, 2, 'PAGE_VISIT', 0, 1);
INSERT INTO fact_conversion VALUES (2, 4, 20250102, 1001, 5001, 3001, 2001, 2, 'ADD_TO_CART', 0, 1);
INSERT INTO fact_conversion VALUES (3, 4, 20250102, 1001, 5001, 3001, 2001, 2, 'PURCHASE', 89.99, 1);

-- User 1002 - Electronics
INSERT INTO fact_conversion VALUES (4, 5, 20250103, 1002, 5004, 3002, 2002, 4, 'PAGE_VISIT', 0, 1);
INSERT INTO fact_conversion VALUES (5, 5, 20250103, 1002, 5004, 3002, 2002, 4, 'PURCHASE', 299.99, 1);

-- User 1003 - Crafts
INSERT INTO fact_conversion VALUES (6, 2, 20250104, 1003, 5003, 3003, 2003, 7, 'PAGE_VISIT', 0, 1);
INSERT INTO fact_conversion VALUES (7, 2, 20250104, 1003, 5003, 3003, 2003, 7, 'ADD_TO_CART', 0, 1);
INSERT INTO fact_conversion VALUES (8, 3, 20250104, 1003, 5003, 3003, 2003, 7, 'PURCHASE', 45.50, 1);

-- User 1004 - Electronics (weekend)
INSERT INTO fact_conversion VALUES (9, 4, 20250104, 1004, 5004, 3002, 2002, 5, 'PAGE_VISIT', 0, 1);
INSERT INTO fact_conversion VALUES (10, 4, 20250104, 1004, 5004, 3002, 2002, 5, 'CHECKOUT', 0, 1);
INSERT INTO fact_conversion VALUES (11, 5, 20250104, 1004, 5004, 3002, 2002, 5, 'PURCHASE', 1299.99, 1);

-- User 1005 - Sports (weekend)
INSERT INTO fact_conversion VALUES (12, 6, 20250105, 1005, 5005, 3004, 2004, 10, 'PAGE_VISIT', 0, 1);
INSERT INTO fact_conversion VALUES (13, 6, 20250105, 1005, 5005, 3004, 2004, 10, 'ADD_TO_CART', 0, 1);
INSERT INTO fact_conversion VALUES (14, 7, 20250105, 1005, 5005, 3004, 2004, 10, 'PURCHASE', 159.99, 1);

-- User 1006 - New user signup + purchase
INSERT INTO fact_conversion VALUES (15, 3, 20250106, 1006, 5009, 3006, 2006, 8, 'SIGNUP', 10, 1);
INSERT INTO fact_conversion VALUES (16, 4, 20250106, 1006, 5009, 3006, 2006, 8, 'PAGE_VISIT', 0, 1);
INSERT INTO fact_conversion VALUES (17, 5, 20250106, 1006, 5009, 3006, 2006, 8, 'PURCHASE', 599.99, 1);

-- User 1007 - Beauty products
INSERT INTO fact_conversion VALUES (18, 3, 20250107, 1007, 5007, 3005, 2005, 9, 'PAGE_VISIT', 0, 1);
INSERT INTO fact_conversion VALUES (19, 3, 20250107, 1007, 5007, 3005, 2005, 9, 'ADD_TO_CART', 0, 1);
INSERT INTO fact_conversion VALUES (20, 4, 20250107, 1007, 5007, 3005, 2005, 9, 'PURCHASE', 125.50, 1);

-- User 1008 - Multiple sessions
INSERT INTO fact_conversion VALUES (21, 2, 20250108, 1008, 5005, 3004, 2004, 10, 'PAGE_VISIT', 0, 1);
INSERT INTO fact_conversion VALUES (22, 6, 20250108, 1008, 5005, 3004, 2004, 10, 'PAGE_VISIT', 0, 1);
INSERT INTO fact_conversion VALUES (23, 7, 20250108, 1008, 5005, 3004, 2004, 10, 'PURCHASE', 189.99, 1);

-- User 1009 - Furniture
INSERT INTO fact_conversion VALUES (24, 4, 20250109, 1009, 5009, 3006, 2006, 8, 'PAGE_VISIT', 0, 1);
INSERT INTO fact_conversion VALUES (25, 5, 20250109, 1009, 5009, 3006, 2006, 8, 'CHECKOUT', 0, 1);
INSERT INTO fact_conversion VALUES (26, 5, 20250109, 1009, 5009, 3006, 2006, 8, 'PURCHASE', 899.99, 1);

-- User 1010 - Browsing only
INSERT INTO fact_conversion VALUES (27, 3, 20250110, 1010, 5004, 3002, 2002, 4, 'PAGE_VISIT', 0, 1);
INSERT INTO fact_conversion VALUES (28, 4, 20250110, 1010, 5004, 3002, 2002, 4, 'PAGE_VISIT', 0, 1);

-- Weekend shopping spike
INSERT INTO fact_conversion VALUES (29, 3, 20250111, 1001, 5001, 3001, 2001, 2, 'PURCHASE', 120.00, 1);
INSERT INTO fact_conversion VALUES (30, 4, 20250111, 1003, 5001, 3001, 2001, 2, 'PURCHASE', 95.50, 1);
INSERT INTO fact_conversion VALUES (31, 5, 20250111, 1005, 5005, 3004, 2004, 10, 'PURCHASE', 210.00, 1);
INSERT INTO fact_conversion VALUES (32, 6, 20250112, 1002, 5004, 3002, 2002, 5, 'PURCHASE', 450.00, 1);
INSERT INTO fact_conversion VALUES (33, 7, 20250112, 1004, 5009, 3006, 2006, 8, 'PURCHASE', 750.00, 1);

-- Evening shopping patterns
INSERT INTO fact_conversion VALUES (34, 7, 20250113, 1007, 5007, 3005, 2005, 9, 'PURCHASE', 85.00, 1);
INSERT INTO fact_conversion VALUES (35, 8, 20250113, 1008, 5005, 3004, 2004, 10, 'PURCHASE', 175.00, 1);
INSERT INTO fact_conversion VALUES (36, 7, 20250114, 1009, 5001, 3001, 2001, 3, 'PURCHASE', 140.00, 1);
INSERT INTO fact_conversion VALUES (37, 8, 20250114, 1010, 5004, 3002, 2002, 6, 'PURCHASE', 599.99, 1);

-- Morning shopping
INSERT INTO fact_conversion VALUES (38, 2, 20250115, 1001, 5007, 3005, 2005, 9, 'PURCHASE', 110.00, 1);
INSERT INTO fact_conversion VALUES (39, 3, 20250115, 1002, 5009, 3006, 2006, 8, 'PURCHASE', 1100.00, 1);
INSERT INTO fact_conversion VALUES (40, 2, 20250115, 1003, 5003, 3003, 2003, 7, 'PURCHASE', 67.50, 1);

-- Additional conversions for analytics
INSERT INTO fact_conversion VALUES (41, 4, 20250113, 1006, 5001, 3001, 2001, 2, 'PAGE_VISIT', 0, 1);
INSERT INTO fact_conversion VALUES (42, 4, 20250113, 1006, 5001, 3001, 2001, 2, 'ADD_TO_CART', 0, 1);
INSERT INTO fact_conversion VALUES (43, 5, 20250113, 1006, 5001, 3001, 2001, 2, 'PURCHASE', 165.00, 1);
INSERT INTO fact_conversion VALUES (44, 3, 20250114, 1007, 5005, 3004, 2004, 10, 'PAGE_VISIT', 0, 1);
INSERT INTO fact_conversion VALUES (45, 4, 20250114, 1007, 5005, 3004, 2004, 10, 'PURCHASE', 199.99, 1);
INSERT INTO fact_conversion VALUES (46, 6, 20250115, 1008, 5007, 3005, 2005, 9, 'PAGE_VISIT', 0, 1);
INSERT INTO fact_conversion VALUES (47, 6, 20250115, 1008, 5007, 3005, 2005, 9, 'ADD_TO_CART', 0, 1);
INSERT INTO fact_conversion VALUES (48, 7, 20250115, 1008, 5007, 3005, 2005, 9, 'PURCHASE', 145.00, 1);
INSERT INTO fact_conversion VALUES (49, 5, 20250115, 1009, 5004, 3002, 2002, 4, 'PURCHASE', 899.00, 1);
INSERT INTO fact_conversion VALUES (50, 8, 20250115, 1010, 5001, 3001, 2001, 3, 'PURCHASE', 220.00, 1);

COMMIT;

--REQUETES ANALYTIQUES--

--Q1
SELECT 
    d.year, d.month, c.objective,
    SUM(f.conversion_value) as revenue,
    SUM(f.conversion_count) as conversions
FROM fact_conversion f
JOIN dim_date d ON f.date_id = d.date_id
JOIN dim_campaign c ON f.campaign_id = c.campaign_id
GROUP BY d.year, d.month, c.objective
ORDER BY d.year, d.month;

--Q2
SELECT 
    m.country, m.merchant_name,
    SUM(f.conversion_value) as revenue,
    COUNT(DISTINCT f.user_id) as unique_customers
FROM fact_conversion f
JOIN dim_merchant m ON f.merchant_id = m.merchant_id
WHERE f.date_id >= 20250101
GROUP BY m.country, m.merchant_name
ORDER BY revenue DESC;

--Q3
SELECT 
    d.is_weekend,
    SUM(f.conversion_value) as revenue,
    SUM(f.conversion_count) as conversions,
    AVG(f.conversion_value) as avg_order_value
FROM fact_conversion f
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.is_weekend;

--Q4
SELECT 
    u.cohort_month, u.country,
    COUNT(DISTINCT f.user_id) as converting_users,
    SUM(f.conversion_value) as total_revenue
FROM fact_conversion f
JOIN dim_user u ON f.user_id = u.user_id
GROUP BY u.cohort_month, u.country
ORDER BY u.cohort_month;

--Q5
SELECT 
    c.category_id, t.period_of_the_day,
    SUM(f.conversion_value) as revenue,
    COUNT(*) as conversion_events
FROM fact_conversion f
JOIN dim_category c ON f.category_id = c.category_id
JOIN dim_time t ON f.time_id = t.time_id
GROUP BY c.category_id, t.period_of_the_day;



