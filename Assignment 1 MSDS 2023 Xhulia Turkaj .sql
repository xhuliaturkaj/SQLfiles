# Xhulia Turkaj 
# SQL Assignment Week 1 for MSDS 2023 CUNY SPS Bridge Program 




# question 1 : which destination in the flights database is the furthest distance away, based on information in the flights table? 

SELECT origin, dest,  distance FROM flights ORDER BY distance DESC LIMIT 1;

# answer 1 : The destination with the furthest distance away is hnl that stands for Honolulu 

# question  2 : What are the different numbers of engines in the planes table ?
# For each nr of engines, which aircraft has the most nr of seats? 
# Show how the sql statement support your result. 



SELECT engines, max(seats)FROM planes GROUP BY engines;


# Answer 2: There are 4 types of nr of engines in planes, from 1 to 4 engines in one plane, and there is a positive correlation
# between the nr of engines and the nr of seats in an aircraft. 
# The bigger the nr of engines the bigger the nr of seats


#Question 3 : Show the total nr of flights 


SELECT count(*) FROM flights;




#Answer 3 : The total nr of flights is 857

#Question # 4 : Show the total nr of flights by airline(carrier) 

SELECT carrier, count(*) AS flightcount  FROM flights  GROUP BY carrier ORDER BY flightcount DESC;

#the query above will show the total nr of flights by carrier for the airlines listed in the flights table 

# the one below below will show total nr of flights by carrier including the two airlines that aren't included in the flights table because
# they have zero flights , however they are listed in the carrier column of the airlines table. 

SELECT a.carrier, COUNT(f.carrier) AS flight_count
FROM airlines AS a
LEFT JOIN flights AS f ON a.carrier = f.carrier
GROUP BY a.carrier 
ORDER BY flight_count DESC;





# Question 5 : Show all the airlines ordered by nr of flights in descending order. 

SELECT a.carrier, COUNT(f.carrier) AS flight_count
FROM airlines AS a
LEFT JOIN flights AS f ON a.carrier = f.carrier
GROUP BY a.carrier
ORDER BY flight_count DESC;

#Question 6 : show only the top 5 airlines, ordered by nr of flights in descending order

#For this question I don't need to use the left join since the carriers added from the airlines table have a flight count of 0 and
# wouldn't possibly make it to the top 5 

SELECT carrier, count(*) AS flightcount  FROM flights  GROUP BY carrier ORDER BY flightcount DESC LIMIT 5;




# Question 7 : Ahow only the top 5 airlines, by nr of flights of distance 1,000 miles or greater, ordered by nr of flights in descendign order
# Same goes for this since 


SELECT carrier, count(*) AS flightcount  FROM flights  WHERE distance >= 1000 GROUP BY carrier ORDER BY flightcount DESC LIMIT 5;


# Question 8 : Create a question that uses data from the flights database, and requires aggregation to answer it

# The question i created  is -- Find the top 10 airlines with the largest total of air time. 

SELECT carrier, sum(air_time) AS total_air_time FROM flights GROUP BY  carrier ORDER BY total_air_time DESC LIMIT 10;



