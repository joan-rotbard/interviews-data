-- Data Engineer Mini Data Hub Exercise
-- Write your SQL queries below
-- 
-- IMPORTANT: Handle edge cases appropriately:
-- - Missing or null values
-- - Orphaned bookings (search_id doesn't exist)
-- - Missing currency rates
-- - Division by zero
-- - Invalid timestamps

-- Query 1: Conversion by day + channel
-- Output: day, channel, searches, confirmed_bookings, conversion_rate
-- Note: Consider how to handle days/channels with zero searches


-- Query 2: Revenue in USD by day + origin + destination
-- Output: day, origin, destination, revenue_usd
-- Note: What should happen if currency rate is missing or booking has null price?


-- Query 3: (Optional) Average time-to-book
-- Average minutes between search_ts → booking_ts for confirmed bookings
-- Note: How do you handle cases where booking_ts < search_ts or timestamps are null?


