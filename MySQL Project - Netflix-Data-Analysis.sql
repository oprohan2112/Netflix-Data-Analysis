
--         -----------------  MySQL PROJECT - NETFLIX TV Shows and Movies -DATA-ANALYSIS ----------------------


CREATE SCHEMA Netflix ;
USE Netflix;

-- Read Data -- 
SELECT * FROM Netflix.titles ;
                    -- OR -- 
SELECT * FROM  titles ; 


-- Q1)What were the top 10 movies according to IMDB score?
SELECT title , type , imdb_score FROM titles 
WHERE type = "MOVIE" 
ORDER BY imdb_score DESC 
LIMIT 10 ; 


-- Q2) What were the top 10 shows according to IMDB score?
SELECT title , type , imdb_score FROM titles 
WHERE type = "SHOW" 
ORDER BY imdb_score DESC 
LIMIT 10 ;


-- Q3)What were the bottom 10 movies according to IMDB score? 
SELECT title , type , imdb_score FROM titles 
WHERE type = "MOVIE" 
ORDER BY imdb_score  ASC 
limit 10 ;


-- Q4) What were the bottom 10 shows according to IMDB score?
SELECT title , type , imdb_score FROM titles 
WHERE type = "SHOW" 
ORDER BY imdb_score 
LIMIT 10 ; 


-- Q5) What were the average IMDB and TMDB scores for shows and movies?
SELECT DISTINCT type, 
ROUND(AVG(imdb_score),2) AS avg_imdb_score,
ROUND(AVG(tmdb_score),2) as avg_tmdb_score
FROM titles
GROUP BY type ;

-- Q6)What were the 5 most common age certifications for movies?
SELECT age_certification , COUNT(*) FROM titles 
WHERE type = "MOVIE" AND age_certification != "N/A"
GROUP BY age_certification 
ORDER BY age_certification DESC
LIMIT 5 ;


-- Q8)Calculating the average runtime of movies and TV shows separately
SELECT type , AVG(runtime) AS avg_runtime_min FROM titles 
GROUP BY type ;


-- Q9)Which shows on Netflix have the most seasons?
SELECT title, 
SUM(seasons) AS total_seasons
FROM titles 
WHERE type = 'Show'
GROUP BY title
ORDER BY total_seasons DESC
LIMIT 10;


-- Q10) What are the top 3 genres?
SELECT genres , COUNT(*) AS Total_count FROM titles
WHERE type = "MOVIE" OR type = "SHOW" 
GROUP BY genres 
ORDER BY Total_count 
LIMIT 3 ; 


-- Q11) Production countries with the most movies and shows?
SELECT production_countries ,COUNT(*) AS total
FROM titles
GROUP BY production_countries
ORDER BY total DESC
LIMIT 3;





