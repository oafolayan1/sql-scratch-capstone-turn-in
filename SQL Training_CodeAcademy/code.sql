SELECT *
FROM survey
LIMIT 10;
----
SELECT user_id, question, COUNT(response)
FROM survey
GROUP BY question
ORDER BY question;
----
SELECT *
FROM quiz
LIMIT 5;

SELECT *
FROM home_try_on
LIMIT 5;

SELECT *
FROM purchase
LIMIT 5;
----
SELECT DISTINCT a.user_id, 
	b.user_id IS NOT NULL AS 'is_home-try-on',
  b.number_of_pairs,
  c.user_id IS NOT NULL AS 'is_purchase'
FROM quiz a
LEFT JOIN home_try_on b
  ON a.user_id = b.user_id
LEFT JOIN purchase c
	ON c.user_id = a.user_id
LIMIT 10;
---
SELECT DISTINCT a.user_id, 
	b.user_id IS NOT NULL AS 'is_home_try_on',
  b.number_of_pairs,
  COUNT(c.user_id IS NOT NULL) AS 'is_purchase'
FROM quiz a
LEFT JOIN home_try_on b
  ON a.user_id = b.user_id
LEFT JOIN purchase c
	ON c.user_id = a.user_id
  GROUP BY is_home_try_on
ORDER BY number_of_pairs;
---
SELECT DISTINCT a.user_id, 
	b.user_id IS NOT NULL AS 'is_home_try_on',
  b.number_of_pairs,
  COUNT(c.user_id IS NOT NULL) AS 'is_purchase'
FROM quiz a
LEFT JOIN home_try_on b
  ON a.user_id = b.user_id
LEFT JOIN purchase c
	ON c.user_id = a.user_id
WHERE number_of_pairs = '5 pairs';