--  SELECT *
--  FROM hacker_news

 -- find the 5 most popular Hacker News stories
SELECT title, score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;

-- Hacker News Moderating

SELECT SUM(score)
FROM hacker_news;

SELECT user, SUM(score)
FROM hacker_news
GROUP BY 1
HAVING SUM(score) > 200
ORDER BY 2 DESC;

SELECT (517 + 309 + 304 + 282) / 6366.0 * 100;
-- top 4 users contributed to 22%

-- While we are looking at the power users, some users are rickrolling — tricking readers into clicking on a link to a funny video and claiming that it links to information about coding.

-- The url of the video is:

-- https://www.youtube.com/watch?v=dQw4w9WgXcQ

-- How many times has each offending user posted this link?

SELECT user, COUNT(*)
FROM hacker_news
WHERE url LIKE '%watch?v=dQw4w9WgXcQ'
GROUP BY 1
ORDER BY 2 DESC;

-- Which sites feed Hacker News?
-- Hacker News stories are essentially links that take users to other websites.

-- Which of these sites feed Hacker News the most:

-- GitHub, Medium, or New York Times?
SELECT CASE 
    WHEN url LIKE '%github%' THEN 'Github'
    WHEN url LIKE '%medium%' THEN 'Medium'
    WHEN url LIKE '%nytimes%' THEN 'New York Times'
    ELSE 'Other'
  END AS 'Source',
  COUNT(*)
FROM hacker_news
GROUP BY 1;

-- What's the best time to post a story?
SELECT strftime('%H', timestamp) AS 'Hour', ROUND(AVG(score),2) AS 'Average score', COUNT(*) AS 'Count of stories'
FROM hacker_news
WHERE Hour IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;

-- Best hours to post a story is 7am and afternoon 6-8pm 

