CREATE DATABASE task_1;
USE task_1;

CREATE TABLE books_raw (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    publication_year INT,
    price_eur DECIMAL(10, 2)
);

SELECT COUNT(*) FROM books_raw;
SELECT * FROM books_raw LIMIT 5;



CREATE TABLE books_summary AS
SELECT 
    publication_year,
    COUNT(*) AS book_count,
    ROUND(AVG(price_eur * 1.2), 2) AS average_price_usd
FROM books_raw
WHERE price_eur IS NOT NULL AND publication_year IS NOT NULL
GROUP BY publication_year;

SELECT * FROM books_summary;
SELECT COUNT(*) FROM books_summary;




DROP TABLE IF EXISTS books_summary;
