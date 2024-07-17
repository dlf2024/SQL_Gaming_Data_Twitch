/* Getting started */
-- Task 1
/* inspect chat table */
SELECT * FROM chat LIMIT 20;
/* inspect stream table */
SELECT * FROM stream LIMIT 20;

-- Task 2
/* unique games in stream table */
SELECT DISTINCT(game) FROM stream;
/* 42 unique games including missing value */

-- Task 3
/* unique channels in stream table */
SELECT DISTINCT(channel) FROM stream;
/* 10 unique channels */

/* Aggregate Functions */
-- Task 4
/* most popular game in stream table */
SELECT game, COUNT(*) AS user_count FROM stream GROUP BY game ORDER BY user_count DESC;
/* the most popular game is League of Legends with 193533 users */

-- Task 5
/* countries and user_count of League of Legends game in stream table */
SELECT game, country, COUNT(*) AS user_count FROM stream WHERE game = 'League of Legends' GROUP BY country ORDER BY user_count DESC;

-- Task 6
/* list of players and their numeber of streamers */
SELECT player, COUNT(*) AS user_count FROM stream GROUP BY player ORDER BY user_count DESC;

-- Task 7
/* add new column genre for each game */
SELECT game,
 CASE
  WHEN game = 'League of Legends' then 'MOBA' 
  WHEN game = 'Dota 2' then 'MOBA' 
  WHEN game = 'Heroes of the Storm' then 'MOBA' 
  WHEN game = 'Counter-Strike: Global Offensive' then 'FPS' 
  WHEN game = 'DayZ' then 'Survival' 
  WHEN game = 'ARK: Survival Evolved' then 'Survival' 
  else 'Other'
  END AS 'genre'
FROM stream
GROUP BY game ORDER BY genre ASC;

/* Daily change in vew count */
-- Task 8
/* inspect time column from stream table */
SELECT time FROM stream LIMIT 10;
/* timestamp is as follows: yyyy-mm-dd hh:mm:ss */

-- Task 9
/* Daily change in vew count */
SELECT time, strftime('%S', time) AS 'seconds' FROM stream GROUP BY 1 LIMIT 20;
/* this command extracts the seconds from the time column and copy the value into the column 'seconds'

-- Task 10
/* Add hours and view_Count to stream table */
SELECT strftime('%H', time) AS 'hours', COUNT(*) AS view_count FROM stream GROUP BY 1 ORDER BY 1 ASC;
/* Filter for French users */
SELECT country, strftime('%H', time) AS 'hours', COUNT(*) AS view_count FROM stream WHERE country = 'FR' GROUP BY hours ORDER BY hours ASC;
/* There are much less users for the following hourly periods 5-10 and 20-01 */

-- Task 11
/* joining stream and chat tables using device_id */
SELECT * FROM stream JOIN chat ON stream.device_id = chat.device_id;

-- Task 12
/* list of games */
SELECT DISTINCT game from stream;
/* investigate 'Duck Game' game popularity per country*/
SELECT game, COUNT(*) AS user_count, country FROM stream JOIN chat ON stream.device_id = chat.device_id 
 WHERE stream.game = 'Duck Game' GROUP BY chat.country ORDER BY user_count DESC;


 