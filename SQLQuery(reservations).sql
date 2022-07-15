
select * from reservations..rides$

--average of daily rides per day 

select startdate,count(reservationId) as totaltrips  from reservations..rides$
group by startdate
order by totaltrips asc

--showing total trips vs date , vs city 

select startCity,startdate,count(reservationId) as totaltrips  from reservations..rides$
group by startCity,startdate
order by startCity asc


-----------------------
--showing average of milage  of each trip 
 

 select startCity,count(reservationId) as totalnumber ,avg(endMileage-startMileage) as milageavg    from rides$
 group by startCity
 order by milageavg desc 


---------------------------------------
--showing date vs milage average , total count of rides , average cost , total earning 

select startdate, avg(endMileage-startMileage) as milageavg,avg(DATEDIFF(minute,cast(startTime as datetime),cast(endTime as datetime))) as averagetimepertrip  , count(reservationId)as totalnumber,avg(cost) as avgcost ,sum(cost) as totalprofits
from reservations..rides$
group by startdate
order by startdate asc
--------------------------------------------------
--scooters vs milage average , total count of rides , average cost , total earning  

select carId, avg(endMileage-startMileage) as milageavg , count(reservationId)as totalnumber,avg(cost) as avgcost ,sum(cost) as totalprofits,avg(DATEDIFF(minute,cast(startTime as datetime),cast(endTime as datetime))) as totaltimeused
from reservations..rides$
group by carId
order by totaltimeused desc
--------------------------------------------------------
--check the duplicates on reservations ids

select distinct  reservationId , count(reservationId)  as repeatedtimes    from reservations..rides$

group by reservationId
order by repeatedtimes desc

----------------------------------
--showing average time of each ride 
select reservationId,startCity,startTime,endTime,carId,avg(DATEDIFF(minute,cast(startTime as datetime),cast(endTime as datetime))) as averagetimepertrip
from reservations..rides$
where averagetimepertrip > 200
group by reservationId,startCity,startTime,endTime,carId
order by averagetimepertrip desc 
-----------------------------------------

--showing average time of each ride  for all cities plus total profits 


select  startCity,count(reservationId) as totaltrips,avg(DATEDIFF(minute,cast(startTime as datetime),cast(endTime as datetime))) as averagetimepertrip,sum(cost) as sumofprofits
from reservations..rides$
group by startCity
order by averagetimepertrip desc
































--showing average of rides time on each city 


 
