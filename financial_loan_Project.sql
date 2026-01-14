create database financial_loan_Project ;

select * from financial_loanCSV_ ;
 
exec sp_help financial_loanCSV_



--   KPI's

-- 1 Total Loan Applications: We need to calculate the total number of 
 --loan applications received during a specified period. Additionally, 
--it  essential to monitor the Month-to-Date (MTD) Loan Applications.

with Total_Loan_Application as (
select Count(id) as Total_Applications
from financial_loanCSV_
)
select * from Total_Loan_Application


-- 2 Total Funded Amount: Understanding the total amount
--of funds disbursed as loans is crucial. We also want
--to keep an eye on the MTD Total Funded Amount metric.

with Total_Funded_Amount as ( 
select  concat(cast(sum(loan_amount) as decimal(10,1)),'$') as Total_Funded_Amount
from financial_loanCSV_
)
select * from Total_Funded_Amount

-- 3 Total Amount Received: Tracking the total amount received from borrowers is essential for assessing the bank's
--cash flow and loan repayment. We should analyse the Month-to-Date (MTD) Total Amount Receive.

with Total_Amount_Received as ( 

select max(issue_date) as lettest_Date 
from financial_loanCSV_
),
Mtd_loan as (

select sum(total_payment) as Total_payment_recieved
from financial_loanCSV_ 
cross join Total_Amount_Received 
where issue_date >= DATEFROMPARTS(year(lettest_Date),MONTH(lettest_Date),1)
   
)
select * from Mtd_loan


 --Average Interest Rate: Calculating the average interest rate across 
 --all loans which will provide insights into our lending portfolio's overall cost.

with Average_Interest_Rate as ( 

select round(AVG(int_rate)*100,2) as Average_intrest_rate 
from financial_loanCSV_
)
select* from Average_Interest_Rate


--Average Debt-to-Income Ratio (DTI): Evaluating the average DTI
--for our borrowers helps us gauge their financial health. We need to compute the average DTI for all loans.

with Average_Dti_ as ( 
select max(issue_date) as lettest_date 
from financial_loanCSV_
) , 
dti_ as ( 
select round(avg(dti)*100,2)  as  average_dti
from financial_loanCSV_
cross join Average_Dti_
where issue_date>= DATEFROMPARTS(year(lettest_date),MONTH(lettest_date),1)
 
)
select* from dti_

---------------------------------------------------------------

 with average_DTI as ( 

 select round(AVG(dti)*100,2) as Average_Dti
 from financial_loanCSV_

 )
 select * from average_DTI
 

 --  Good loan vs Bad loan 

 -- Good Loan Application Percentage
 
 select round(count(id)*100,2) as good_loanTotal_applcation  
 from financial_loanCSV_ 
 where loan_status in (' Fully Paid ' , 'Current')



 select 
   round( 
      count(
        case
          when loan_status in('Fully Paid', 'Current')
           then 1 
           end
           )*100.0 /count(id),2) as Total_good_application 
from financial_loanCSV_

-----------------------------------------------
 

------------------------
 
with Application_percentage as ( 

SELECT 
    CAST(
        CAST(
            COUNT(
                CASE 
                    WHEN loan_status IN ('Fully Paid', 'Current') 
                    THEN 1 
                END
            ) * 100.0 / COUNT(id)
        AS DECIMAL(10,1)
        ) AS VARCHAR(10)
    ) + '%' AS Total_good_application
FROM financial_loanCSV_) 
select * from Application_percentage



 -- Good Loan Applications

with Good_loan_appliocation as ( 

select count(id) as   total_application
from financial_loanCSV_
where  loan_status IN ('Fully Paid', 'Current') )

select * from Good_loan_appliocation






select * from Good_loan_appliocation
 

 

 --  Good Loan Funded Amount
 
with Good_Loan_Funded_Amount as ( 

select sum(loan_amount) as total_funded_amount 
from  financial_loanCSV_ 
where loan_status in ('Fully Paid', 'Current') 
)
select *from Good_Loan_Funded_Amount
 


 --    Good Loan Total Received Amount
 
with  Good_Loan_Total_Recived_Amount  as ( 

select sum(total_payment) as total_recived_amount 
from financial_loanCSV_ 
where loan_status in ('Fully Paid', 'Current') 
)
select * from Good_Loan_Total_Recived_Amount


------ ------ ------ ------ ------ ------ -
-- BAD LOAN 

-- Bad Loan Application Percentage

with Bad_loan_Applications_percentage as ( 

select cast(cast(count(
case 
when loan_status in ('Charged Off') then 1 end ) *100/count(id)
 AS DECIMAL(10,1)
        ) AS VARCHAR(10)
    ) + '%' AS Total_Bas_application
FROM financial_loanCSV_) 
select * from Bad_loan_Applications_percentage

-- Bad Loan Applications
with Total_BAd_loan_Application as ( 
select count(id) as Total_Bad_Application 
from financial_loanCSV_ 
where loan_status in ('Charged Off') ) 

select * from Total_BAd_loan_Application
 

with total_Bad_Funded_Amout as ( 
select sum(loan_amount) as Total_Bad_funded_amount 
from financial_loanCSV_ 
where loan_status in ('Charged Off')
)
select * from total_Bad_Funded_Amout


-- Bad Loan Total Received Amount

with total_bad_recived_Amount as ( 

select sum(total_payment) as Total_Bad_Recived_amount 
from financial_loanCSV_ 
where loan_status in ('Charged Off')
)
select * from total_bad_recived_Amount



-----------
select * from financial_loanCSV_  