-- Lab 1: Analytical Queries
-- Author: [Your Name]
-- Required: 5 query types — WHERE, GROUP BY, ORDER BY, date function, AND/OR

-- ============================================================
-- Query 1: Filtering with WHERE clause
-- Books rated 4.5 or higher
-- ============================================================
SELECT title, author, rating, category
FROM books_read
WHERE rating >= 4.5
ORDER BY rating DESC;

-- ============================================================
-- Query 2: Aggregation with GROUP BY
-- Average pages and book count per category
-- ============================================================
SELECT category, AVG(pages) AS avg_pages, COUNT(*) AS book_count
FROM books_read
GROUP BY category
ORDER BY avg_pages DESC;

-- ============================================================
-- Query 3: Sorting with ORDER BY
-- All books by date finished (most recent first)
-- ============================================================
SELECT * FROM books_read
ORDER BY date_finished DESC;

-- ============================================================
-- Query 4: Date manipulation function
-- Monthly reading progress (TO_CHAR groups by year-month)
-- ============================================================
SELECT
    TO_CHAR(date_finished, 'YYYY-MM') AS month,
    COUNT(*) AS books_finished,
    SUM(pages) AS pages_read
FROM books_read
GROUP BY TO_CHAR(date_finished, 'YYYY-MM')
ORDER BY month;

-- ============================================================
-- Query 5: Multi-condition query (AND/OR)
-- Machine Learning OR Data Science books with rating > 4.0
-- ============================================================
SELECT title, author, category, rating, pages
FROM books_read
WHERE (category = 'Machine Learning' OR category = 'Data Science')
  AND rating > 4.0
ORDER BY rating DESC;

-- ============================================================
-- Extra: Total pages read
-- ============================================================
SELECT SUM(pages) AS total_pages_read FROM books_read;

-- Extra: Books by rating (for PDF screenshot: SELECT * ORDER BY date_finished)
-- SELECT * FROM books_read ORDER BY date_finished;
