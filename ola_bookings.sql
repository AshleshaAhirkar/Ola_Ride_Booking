create database Ola;
use Ola;

select * from bookings
limit 10;

-- 1. Retrieve all successful bookings:
create view Successful_Bookings as
select *
from bookings 
where Booking_Status='Success'

select * from Successful_Bookings;

-- 2. Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle as
select vehicle_type,round(avg(ride_distance),2) as avg_dist
from bookings
group by vehicle_type
order by vehicle_type;

select * from ride_distance_for_each_vehicle;

-- 3. Get the total number of cancelled rides by customers:
create view cancelled_rides_by_customers as
select count(*) as total
from bookings
where Booking_Status='Canceled by Customer';

Select * from cancelled_rides_by_customers;

-- 4. List the top 5 customers who booked the highest number of rides:
create view Top_5_Customers as
select customer_id,count(booking_id) as total_rides
from bookings
group by customer_id
order by total_rides desc
limit 5

Select * from Top_5_Customers;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Rides_cancelled_by_Drivers_P_C_Issues as
select count(*) as cnt
from bookings
where canceled_rides_by_Driver='Personal & Car related issue'

Select * from Rides_cancelled_by_Drivers_P_C_Issues;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view Max_Min_Driver_Rating as
select max(driver_ratings) as maximum_ratings,min(driver_ratings) as minimum_ratings
from bookings
where vehicle_type='Prime Sedan'

Select * from Max_Min_Driver_Rating;

-- 7. Retrieve all rides where payment was made using UPI:
create view UPI_Payment as
select *
from bookings
where payment_method='UPI'

Select * from UPI_Payment;

-- 8. Find the average customer rating per vehicle type:
create view AVG_Cust_Rating as
select vehicle_type,round(avg(customer_rating),2) as average
from bookings
group by vehicle_type
order by vehicle_type

Select * from AVG_Cust_Rating;

-- 9. Calculate the total booking value of rides completed successfully:
create view total_successful_ride_value as
select sum(booking_value) as total
from bookings
where booking_status='Success'

Select * from total_successful_ride_value

-- 10. List all incomplete rides along with the reason:
create view Incomplete_Ride_Reason as
select booking_id,incomplete_rides_reason
from bookings
where incomplete_rides='Yes' 

Select * from Incomplete_Ride_Reason;