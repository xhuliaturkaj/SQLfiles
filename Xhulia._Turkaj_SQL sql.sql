# Final Assignment for SQL Bridge Course MSDS 2023 - Xhulia Turkaj 

/*
 An organization grants key-card access to rooms based on groups that key-card holders belong to. 
 You may assume that users below to only one group.
 Your job is to design the database that supports the key-card system.
 */
 



/*
The relationships are as following 

Groups Table and Users Table -- One to Many
Groups Tab]e and Rooms Table -- Many to Many 
Users  Table and Rooms Table -- Many to Many 

*/

# Creating the tables



CREATE TABLE groups_table (
    group_id INT PRIMARY KEY,
    group_name VARCHAR(50)
);

INSERT INTO groups_table (group_id, group_name)
VALUES
    (1, 'I.T.'),
    (2, 'Sales'),
    (3, 'Administration'),
    (4, 'Operations');
    
    
SELECT * FROM groups_table;

    
CREATE TABLE users_table (
user_id INT PRIMARY KEY,
user_name VARCHAR(50), 
group_id INT 
);

INSERT INTO users_table (user_id, user_name, group_id)
VALUES
    (1, 'Modesto',1 ),
    (2, 'Ayine', 1),
    (3, 'Christopher',2 ),
    (4, 'Cheong woo',2 ),
    (5, 'Saulat', 3),
    (6, 'Heidy', NULL);

SELECT * FROM users_table;

CREATE TABLE rooms_table (
    room_id INT PRIMARY KEY,
    room_name VARCHAR(50)
);

INSERT INTO rooms_table (room_id, room_name)
VALUES
    (101, 'Room 101'),
    (102, 'Room 102'),
    (103, 'Auditorium A'),
    (104, 'Auditorium B');

SELECT * FROM rooms_table;




CREATE TABLE access_table (
group_id INT NOT NULL, 
room_id INT , FOREIGN KEY (room_id) REFERENCES  rooms_table(room_id),
 FOREIGN KEY (group_id) REFERENCES groups_table(group_id) );



INSERT INTO access_table (group_id, room_id)
VALUES
    (1, '101'),
    (1, '102'),
	(2, '102'),
    (2, '103'),
    (3, NULL);

SELECT * FROM access_table;

/*
Write a  SELECT statements that provide the following information:
All groups, and the users in each group.  A group should appear even if there are no users assigned to the group.
*/


SELECT
G.group_name,
U.user_name 
FROM 
groups_table G 
LEFT JOIN 
users_table U
ON 
G.group_id = U.group_id;



/*
Write a  SELECT statements that provide the following information:
All rooms, and the groups assigned to each room. The rooms should appear even if no groups have been
assigned to them.
*/


SELECT
R.room_name,
G.group_name AS group_name
FROM
rooms_table R
LEFT JOIN
access_table A ON R.room_id = A.room_id
LEFT JOIN
groups_table G ON A.group_id = G.group_id;


/*
Write a  SELECT statements that provide the following information:
A list of users, the groups that they belong to, and the rooms to which they are assigned. This should be sorted
alphabetically by user, then by group, then by room.
*/




SELECT
U.user_name,
G.group_name AS group_name,
R.room_name AS room_name
FROM
users_table U
LEFT JOIN
groups_table G ON U.group_id = G.group_id
LEFT JOIN
access_table A ON U.group_id = A.group_id
LEFT JOIN
rooms_table R ON A.room_id = R.room_id
ORDER BY
U.user_name, G.group_name, R.room_name;
 