

# Xhulia Turkaj SQL Bridge Course  MSDS 2023 Week 2 Assignment

# Question 1.  Videos table. Create one table to keep track of the videos. 
# This table should include a unique ID, the title of the video, the length in minutes, and the URL. 
# Populate the table with at least three related videos from YouTube 
# or other publicly available resources.


CREATE TABLE videos 
(
unique_ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
title VARCHAR(200) NOT NULL, 
duration INT NULL,
url VARCHAR(300) NULL
);

INSERT INTO videos (title, duration, url)
       VALUES 
('SQL Tutorial - Full Database Course for Beginners', 260 , 'https://www.youtube.com/watch?v=HXV3zeQKqGY'),
('SQL Joins Explained |¦| Joins in SQL |¦| SQL Tutorial', 10, 'https://www.youtube.com/watch?v=9yeOJ0ZMUYw'),
( 'Learn Basic SQL in 15 Minutes | Business Intelligence For Beginners | SQL Tutorial For Beginners 1/3',17 ,'https://www.youtube.com/watch?v=kbKty5ZVKMY');
       

       

SELECT * FROM Videos;


# Question 2 Create and populate Reviewers table. 
# Create a second table that provides at least two user reviews for each of at least two of the videos.
#  These should be imaginary reviews that include columns for the user’s name (“Asher”, “Cyd”, etc.), 
# the rating (which could be NULL, or a number between 0 and 5), and a short text review (“Loved it!”). 
# There should be a column that links back to the ID column in the table of videos.       



CREATE TABLE Reviewers 
(
    rating_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    video_id INT NOT NULL,
    user_name VARCHAR(50) NOT NULL, 
    rating INT CHECK (rating >= 0 AND rating <= 5) NULL,
    review VARCHAR(500) NOT NULL
);



INSERT INTO Reviewers (video_id, user_name, rating, review)
VALUES
(1, 'xhulia', 2, 'Thorough explanation but the speaker talks too fast'),
(2, 'rogg@', 5, 'I owe this video the start of my new career'),
(1, 'moon', NULL, 'Better than those coding camps for sure!'),
(7, 'speaktomedata', 4,  '');


SELECT * FROM Reviewers;




# Question 3 Report on Video Reviews.
#  Write a JOIN statement that shows information from both tables.

SELECT
R.rating_id AS 'Rating ID',
R.user_name AS 'User Name',
R.video_id AS 'Video ID',
V.title AS 'Title',
R.rating AS 'Rating',
R.review AS 'Review',
V.url AS 'Video URL'
FROM Reviewers as R
INNER JOIN videos as V
ON R.video_iD = V.unique_ID;

