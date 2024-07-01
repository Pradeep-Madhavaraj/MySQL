CREATE SCHEMA MiniProject;

USE MiniProject;

CREATE TABLE sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);

SELECT * FROM sales;

-- renaming column from tax_pct to VAT
ALTER TABLE sales CHANGE tax_pct VAT FLOAT(6,4) NOT NULL;


-- Generic Questions

-- How many unique cities does the data have?
SELECT COUNT(DISTINCT city) AS DIistinct_cities FROM sales;

-- In which city is each branch?
SELECT DISTINCT(branch) AS Branch, City FROM sales;

-- Questions related to Products

-- How many unique product lines does the data have?
SELECT DISTINCT(product_line) AS unique_product_line FROM sales;
SELECT COUNT(DISTINCT(product_line)) AS No_of_Unique_Product_line FROM sales;

-- What is the most common payment method?
SELECT COUNT(*) AS customers, payment FROM sales GROUP BY payment ORDER BY customers DESC LIMIT 1;
SELECT COUNT(*) AS customers, payment FROM sales GROUP BY payment;

-- What is the most selling product line?
SELECT product_line , SUM(quantity) AS quantities_sold FROM sales GROUP BY product_line ORDER BY quantities_sold DESC LIMIT 1;
SELECT product_line , SUM(quantity) AS quantities_sold FROM sales GROUP BY product_line ORDER BY quantities_sold DESC;

-- adding a new column month ---- 
ALTER TABLE sales
ADD COLUMN month_name varchar(10) NOT NULL;

SELECT date, monthname(date) FROM sales;

-- INSERTING VALUES INTO THE NEWLY ADDED COLUMN
UPDATE sales
SET month_name= MONTHNAME(Date);

-- What is the total revenue by month?
SELECT month_name, SUM(total) as totalRevenue FROM sales GROUP BY month_name ORDER BY totalRevenue DESC;
SELECT DISTINCT month_name FROM sales;

-- What month had the largest COGS?
SELECT month_name, SUM(cogs) as TotalCOGS FROM sales GROUP BY month_name ORDER BY TotalCOGS DESC;


-- What product line had the largest revenue?
SELECT product_line, SUM(total)as Total_revenue FROM sales GROUP BY product_line;
SELECT product_line, SUM(total)as Total_revenue FROM sales GROUP BY product_line ORDER BY Total_revenue DESC LIMIT 1;

-- What is the city with the largest revenue?
SELECT city, SUM(total)as Total_revenue FROM sales GROUP BY city;
SELECT city, SUM(total)as Total_revenue FROM sales GROUP BY city ORDER BY Total_revenue DESC LIMIT 1;

-- What product line had the largest VAT?
SELECT product_line, AVG(VAT) as HighestVAT FROM sales GROUP BY product_line ORDER BY HighestVAT DESC;
SELECT product_line, AVG(VAT) as HighestVAT FROM sales GROUP BY product_line ORDER BY HighestVAT DESC LIMIT 1;

-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
SELECT 
product_line, 
CASE
	WHEN AVG(quantity) > (SELECT AVG(quantity) FROM sales) THEN 'Good'
    ELSE 'Bad'
END AS product_performance FROM sales
GROUP BY Product_line;

-- Which branch sold more products ?
SELECT branch , SUM(quantity) AS quantities_sold FROM sales 
GROUP BY branch DESC; 

-- Which branch's AVERAGE product sold is more than average product sold?
SELECT branch , AVG(quantity) AS quantities_sold FROM sales 
GROUP BY branch ORDER BY quantities_sold DESC;

SELECT AVG(quantity) FROM sales;

-- What is the most common product line by gender?
SELECT gender, product_line, COUNT(gender) AS total_count FROM sales GROUP BY gender, product_line ORDER BY total_count DESC;

-- What is the average rating of each product line?
SELECT product_line, ROUND(AVG(rating),2) AS Average_rating FROM sales GROUP BY product_line ORDER BY Average_rating;

------ SALES questions ------

-- ADDING A NEW COLUMN time_of_day
ALTER TABLE sales 
ADD time_of_day varchar(10) NOT NULL;

-- adding values 
UPDATE sales
SET time_of_day = (
	CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END
);


-- Number of sales made in each time of the day per weekday
SELECT time_of_day,  COUNT(quantity) AS salesMade FROM sales 
WHERE day_name NOT IN ('Sunday','Saturday')
GROUP BY time_of_day
ORDER BY salesMade;

-- Which of the customer types brings the most revenue?
SELECT customer_type, SUM(total)as Total_revenue FROM sales GROUP BY customer_type ORDER BY Total_revenue DESC LIMIT 1;
SELECT customer_type, SUM(total)as Total_revenue FROM sales GROUP BY customer_type;

-- Which city has the largest tax percent/ VAT (Value Added Tax)?
SELECT City, SUM(VAT) as totalVAT FROM sales GROUP BY city ORDER BY totalVAT DESC LIMIT 1;
SELECT City, SUM(VAT) as totalVAT FROM sales GROUP BY city;

-- Which customer type pays the most in VAT?
SELECT customer_type, SUM(VAT)as totalVAT FROM sales GROUP BY customer_type ORDER BY totalVAT DESC LIMIT 1;
SELECT customer_type, SUM(total)as totalVAT FROM sales GROUP BY customer_type;

-- CUSTOMER QUESTIONS -----

-- How many unique customer types does the data have?
SELECT COUNT(DISTINCT customer_type) AS CustomerTypes FROM sales;

-- How many unique payment methods does the data have?
SELECT COUNT(DISTINCT payment) AS paymentTypes FROM sales;

-- What is the most common customer type?
-- Which customer type buys the most?
SELECT customer_type, COUNT(*) AS count FROM sales GROUP BY customer_type ORDER BY count DESC LIMIT 1;

-- What is the gender of most of the customers?
SELECT gender, count(*) as count FROM sales GROUP BY gender ORDER BY count DESC;

-- What is the gender distribution per branch?
SELECT gender, branch, COUNT(gender) AS count FROM sales GROUP BY branch,gender ORDER BY branch;

-- ADDING A NEW COLUMN DAY
ALTER TABLE sales ADD COLUMN day_name varchar(10) NOT NULL;
SELECT dayname(date) FROM sales;

-- INSERTING values to day_name
UPDATE sales 
SET day_name = DAYNAME(DATE);

-- Which time of the day do customers give most ratings?
SELECT time_of_day, AVG(rating) AS AVGratings FROM sales GROUP BY time_of_day ORDER BY AVGratings DESC LIMIT 1;

-- Which time of the day do customers give most ratings per branch?
SELECT time_of_day, branch, AVG(rating) AS AVGratings FROM sales GROUP BY time_of_day, branch ORDER BY AVGratings DESC LIMIT 1;
SELECT time_of_day, branch, AVG(rating) AS AVGratings FROM sales WHERE branch= 'A' GROUP BY time_of_day ORDER BY AVGratings DESC;
SELECT time_of_day, branch, AVG(rating) AS AVGratings FROM sales GROUP BY time_of_day,branch ORDER BY branch ASC, AVGratings DESC;

-- Which day fo the week has the best avg ratings?
SELECT day_name, AVG(rating) FROM sales GROUP BY day_name ORDER BY AVG(rating) DESC;

-- Which day of the week has the best average ratings per branch?
SELECT day_name, branch, AVG(rating) FROM sales GROUP BY day_name,branch ORDER BY branch ASC, AVG(rating) DESC;

