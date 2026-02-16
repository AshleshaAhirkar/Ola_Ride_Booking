# 🚖 OLA Ride Booking Analysis | SQL + Power BI

## 📌 Project Overview

This project analyzes OLA ride booking data to identify revenue trends, booking patterns, cancellation insights, customer behavior, and rating analysis.

The goal of this project is to perform SQL-based data analysis and build an interactive Power BI dashboard for business decision-making.

---

## 🛠 Tools & Technologies Used

- SQL (MySQL)
- Power BI
- Data Modeling
- DAX (Basic Measures)
- Data Visualization

---

## 🗄 Database Setup

```sql
create database Ola;
use Ola;

select * from bookings;
```

---

## 📊 SQL Analysis Performed

### 1️⃣ Retrieve all successful bookings
```sql
create view Successful_Bookings as
select *
from bookings 
where Booking_Status='Success';
```

### 2️⃣ Average ride distance per vehicle type
```sql
create view ride_distance_for_each_vehicle as
select vehicle_type,
round(avg(ride_distance),2) as avg_dist
from bookings
group by vehicle_type;
```

### 3️⃣ Total cancelled rides by customers
```sql
create view cancelled_rides_by_customers as
select count(*) as total
from bookings
where Booking_Status='Canceled by Customer';
```

### 4️⃣ Top 5 customers by total rides
```sql
create view Top_5_Customers as
select customer_id,
count(booking_id) as total_rides
from bookings
group by customer_id
order by total_rides desc
limit 5;
```

### 5️⃣ Driver cancellations (Personal & Car issues)
```sql
create view Rides_cancelled_by_Drivers_P_C_Issues as
select count(*) as cnt
from bookings
where canceled_rides_by_Driver='Personal & Car related issue';
```

### 6️⃣ Max & Min Driver Rating (Prime Sedan)
```sql
create view Max_Min_Driver_Rating as
select max(driver_ratings) as maximum_ratings,
min(driver_ratings) as minimum_ratings
from bookings
where vehicle_type='Prime Sedan';
```

### 7️⃣ UPI Payments
```sql
create view UPI_Payment as
select *
from bookings
where payment_method='UPI';
```

### 8️⃣ Average Customer Rating per Vehicle Type
```sql
create view AVG_Cust_Rating as
select vehicle_type,
round(avg(customer_rating),2) as average
from bookings
group by vehicle_type;
```

### 9️⃣ Total Successful Ride Revenue
```sql
create view total_successful_ride_value as
select sum(booking_value) as total
from bookings
where booking_status='Success';
```

### 🔟 Incomplete Rides with Reason
```sql
create view Incomplete_Ride_Reason as
select booking_id,
incomplete_rides_reason
from bookings
where incomplete_rides='Yes';
```

---

# 📈 Power BI Dashboard

The dashboard is divided into 5 sections:

## 1️⃣ Overall
- Ride Volume Over Time
- Booking Status Breakdown
- KPI Cards (Total Bookings, Total Booking Value)

  ![Overall Dashboard](https://github.com/AshleshaAhirkar/Ola_Ride_Booking/blob/main/dashboard1.png)

## 2️⃣ Vehicle Type
- Top Vehicle Types by Ride Distance
- Avg Distance Travelled
- Success Booking Value

  ![Overall Dashboard](https://github.com/AshleshaAhirkar/Ola_Ride_Booking/blob/main/dashboard2.png)

## 3️⃣ Revenue
- Revenue by Payment Method
- Top 5 Customers by Booking Value
- Ride Distance Distribution per Day

  ![Overall Dashboard](https://github.com/AshleshaAhirkar/Ola_Ride_Booking/blob/main/dashboard3.png)

## 4️⃣ Cancellation
- Cancelled Rides by Customers
- Cancelled Rides by Drivers
- Cancellation Rate (28.08%)

  ![Overall Dashboard](https://github.com/AshleshaAhirkar/Ola_Ride_Booking/blob/main/dashboard4.png)

## 5️⃣ Ratings
- Driver Ratings by Vehicle Type
- Customer Ratings by Vehicle Type
- Customer vs Driver Rating Comparison

  ![Overall Dashboard](https://github.com/AshleshaAhirkar/Ola_Ride_Booking/blob/main/dashboard5.png)

---

# 📊 Key Insights

- Total Bookings: 103,024
- Total Revenue: 35M+
- Cancellation Rate: 28.08%
- Success Rate: 62%
- Cash & UPI are the dominant payment methods.
- Driver-side cancellations are mostly due to personal & car-related issues.

---

# 🎯 Business Impact

- Identified operational inefficiencies through cancellation analysis.
- Highlighted top revenue-generating customers.
- Compared vehicle-type performance for strategic optimization.
- Enabled interactive decision-making using dashboard filtering & KPIs.

---

# 🚀 Conclusion

This project analyzes OLA ride booking data using SQL and Power BI to generate actionable business insights.
By evaluating booking trends, cancellations, revenue (35M+), and ratings, the dashboard enables data-driven decision-making and performance monitoring across vehicle types and customers.

---

