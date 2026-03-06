create database assignment2
use assignment2

select * from Jomato

--1. Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick Chicken Bites’.
create function stuffi ()
RETURNS table
as 
return(
    with stufff
    as
    (select stuff('Quick Bites ',7,0,'Chicken ') as ModifiedText from Jomato where restaurantType='Quick Bites')
    select * from stufff
    );

select * from stuffi()

alter function stuffi ()
RETURNS table
as 
return(
    with stufff
    as
    (select stuff('Quick Bites ',7,0,'Chicken ') as ModifiedText from Jomato where restaurantType='Quick Bites')
    select * from stufff
    );


--2. Use the function to display the restaurant name and cuisine type which has the maximum number of rating.
create function toprated()
returns table
as
return (
    with odetails
    as(
        select Restaurantname,CuisinesType,row_number() over (order by rating desc) AS TopRate from Jomato
        )
        select * from odetails where Toprate=1
        )

select * from toprated()


--3. Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4
--start rating, ‘Good’ if it has above 3.5 and below 4 star rating, ‘Average’ if it is above 3 and below 3.5 and ‘Bad’ if it is below 3 star rating.

select RestaurantName,RestaurantType,CuisinesType,case
    when rating>4 then 'Excellent'
    when rating>3.5 and rating<=4 then 'Good'
    when rating>3 and rating<=3.5 then 'Average'
    when rating<3 then 'Bad'

END as RateCheck
from jomato

--4. Find the Ceil, floor and absolute values of the rating column and display the current 
--date and separately display the year, month_name and day.
select CEILING(rating) Ceil, FLOOR(rating) Floor ,ABS(rating) as absolute,GETDATE() as Currentdate,datename(Year,GETDATE()) Y,
datename(Month,GETDATE()) M,datename(Day,GETDATE()) D from jomato

--5. Display the restaurant type and total average cost using rollup.
select restauranttype,sum(AverageCost) AS TotalAvgCost from jomato group by rollup(restauranttype)


