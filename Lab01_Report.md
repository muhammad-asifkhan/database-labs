# Lab 01: Database Ecosystems & Modern Development Environment

**Course:** Database Systems Lab (Data Science Program)  
**Student Name:** [Your Full Name]  
**Roll Number:** [Your Roll Number]  
**Date:** [Date of Submission]  

**How to complete:** Replace each **[INSERT SCREENSHOT HERE]** with your actual screenshot. Fill in [bracketed] details. Then export to PDF: open this file in Cursor/VS Code → Print (Ctrl+P) → "Save as PDF", or use a Markdown-to-PDF tool. Submit as **Lab01_FirstNameLastName_RollNumber.pdf** to Google Classroom.

---

# Section 1: Environment Setup Evidence (20 points)

## 1.1 Linux Terminal Setup

**What was done:** Used the native Linux (Ubuntu) terminal for the lab.

**Evidence:** Screenshot showing terminal with system version and username.

| Command run | Purpose |
|-------------|---------|
| `uname -a` | Shows Linux kernel and system info |
| `whoami` | Shows current username |

**[INSERT SCREENSHOT HERE]**  
*Screenshot: Terminal window with output of `uname -a` and `whoami`*

---

## 1.2 PostgreSQL Downloaded and Installed

**What was done:** PostgreSQL was downloaded and installed using the package manager.

**Commands used:**
```bash
sudo apt update
sudo apt install -y postgresql postgresql-contrib
```

**Evidence:** Screenshot showing PostgreSQL is installed and the service is running.

| Command run | Purpose |
|-------------|---------|
| `psql --version` | Shows installed PostgreSQL client version |
| `sudo systemctl status postgresql` | Shows PostgreSQL service is active (running) |

**[INSERT SCREENSHOT HERE]**  
*Screenshot: Terminal with `psql --version` and `sudo systemctl status postgresql` output*

---

## 1.3 DBeaver Downloaded and Installed

**What was done:** DBeaver Community Edition was downloaded and installed.

**Method used:** Downloaded the `.deb` package from https://dbeaver.io/download/ and installed with:
```bash
sudo dpkg -i dbeaver-ce_*_amd64.deb
sudo apt install -f -y
```

**Evidence:** Screenshot showing DBeaver is installed (e.g. About dialog or application window).

**[INSERT SCREENSHOT HERE]**  
*Screenshot: DBeaver application open (e.g. welcome screen or Help → About showing version)*

---

## 1.4 Database and User Created (muhammad-asif-khan)

**What was done:** A PostgreSQL user `muhammad-asif-khan` and database `lab1_db` were created.

**Method:** Ran the setup script as postgres superuser:
```bash
sudo -u postgres psql -f create_user_and_db.sql
```

**SQL executed:**
- `CREATE USER "muhammad-asif-khan" WITH PASSWORD 'asif.khan';`
- `ALTER USER "muhammad-asif-khan" WITH SUPERUSER;`
- `CREATE DATABASE lab1_db OWNER "muhammad-asif-khan";`

**Evidence:** Screenshot showing connection to PostgreSQL and that the database exists.

| Command / action | Purpose |
|------------------|---------|
| `psql -U muhammad-asif-khan -d lab1_db` | Connect to lab1_db |
| `SELECT version();` | Show PostgreSQL version |
| `\l` | List all databases (lab1_db should appear) |

**[INSERT SCREENSHOT HERE]**  
*Screenshot: Terminal (psql) showing `SELECT version();` and `\l` with lab1_db in the list*

---

## 1.5 DBeaver Connection to PostgreSQL

**What was done:** A connection was created in DBeaver to the `lab1_db` database using user `muhammad-asif-khan`.

**Connection details:**
- **Host:** localhost  
- **Port:** 5432  
- **Database:** lab1_db  
- **Username:** muhammad-asif-khan  
- **Password:** [saved in DBeaver]

**Evidence:** Screenshot showing DBeaver connected successfully with lab1_db visible.

**[INSERT SCREENSHOT HERE]**  
*Screenshot: DBeaver Database Navigator showing connection "lab1_db" or similar, with Databases → lab1_db expanded (and optionally Schemas → public → Tables)*

---

## 1.6 Table Created and Data Inserted

**What was done:** The `books_read` table was created and sample data (5 books) was inserted using `lab1/create_books_table.sql`.

**Method:** Ran the SQL script in DBeaver (or via `psql -U muhammad-asif-khan -d lab1_db -f lab1/create_books_table.sql`).

**Evidence:** Screenshot showing the table exists and contains data.

**[INSERT SCREENSHOT HERE]**  
*Screenshot: DBeaver showing lab1_db → Schemas → public → Tables → books_read, and/or result of `SELECT * FROM books_read;` with 5 rows*

---

## 1.7 Git Configuration

**What was done:** Git was verified and configured with name and email.

| Command run | Purpose |
|-------------|---------|
| `git --version` | Verify Git is installed |
| `git config --list` | Show Git user.name and user.email |

**[INSERT SCREENSHOT HERE]**  
*Screenshot: Terminal with `git --version` and `git config --list` output*

---

# Section 2: Database Work (30 points)

## 2.1 Table Structure (books_read)

**Evidence:** Screenshot of the `books_read` table structure in DBeaver (columns, data types, constraints).

**How to capture:** In DBeaver, expand lab1_db → Schemas → public → Tables → right-click **books_read** → **View Table** or **Properties** to show columns, types, and constraints.

**[INSERT SCREENSHOT HERE]**  
*Screenshot: books_read table structure (column names, types, primary key, checks)*

---

## 2.2 Sample Data (at least 5 books)

**Query used:**
```sql
SELECT * FROM books_read ORDER BY date_finished;
```

**Evidence:** Screenshot of the query result showing all 5 books.

**[INSERT SCREENSHOT HERE]**  
*Screenshot: Result grid with 5 rows (book_id, title, author, category, pages, date_finished, rating, notes)*

---

## 2.3 Analytical Queries (5 required types)

For each query below: add a screenshot of the SQL and the result, plus a short explanation.

---

### Query 1: Filtering with WHERE

**SQL:**
```sql
SELECT title, author, rating, category
FROM books_read
WHERE rating >= 4.5
ORDER BY rating DESC;
```

**Result:** [INSERT SCREENSHOT HERE]

**Explanation:** This query returns books with rating 4.5 or higher, sorted by rating descending.

---

### Query 2: Aggregation with GROUP BY

**SQL:**
```sql
SELECT category, AVG(pages) AS avg_pages, COUNT(*) AS book_count
FROM books_read
GROUP BY category
ORDER BY avg_pages DESC;
```

**Result:** [INSERT SCREENSHOT HERE]

**Explanation:** This query shows average page count and number of books per category.

---

### Query 3: Sorting with ORDER BY

**SQL:**
```sql
SELECT * FROM books_read ORDER BY date_finished DESC;
```

**Result:** [INSERT SCREENSHOT HERE]

**Explanation:** This query lists all books with the most recently finished first.

---

### Query 4: Date manipulation function

**SQL:**
```sql
SELECT
    TO_CHAR(date_finished, 'YYYY-MM') AS month,
    COUNT(*) AS books_finished,
    SUM(pages) AS pages_read
FROM books_read
GROUP BY TO_CHAR(date_finished, 'YYYY-MM')
ORDER BY month;
```

**Result:** [INSERT SCREENSHOT HERE]

**Explanation:** This query groups reading by month and shows books finished and pages read per month.

---

### Query 5: Multi-condition (AND/OR)

**SQL:**
```sql
SELECT title, author, category, rating, pages
FROM books_read
WHERE (category = 'Machine Learning' OR category = 'Data Science')
  AND rating > 4.0
ORDER BY rating DESC;
```

**Result:** [INSERT SCREENSHOT HERE]

**Explanation:** This query returns books in Machine Learning or Data Science with rating greater than 4.0.

---

## 2.4 Schema Export

**Command run:**
```bash
pg_dump -U muhammad-asif-khan -d lab1_db -s > lab1_schema.sql
```

**Evidence:** First 20 lines of `lab1_schema.sql` (paste below or insert screenshot).

**[INSERT SCREENSHOT OR PASTE FIRST 20 LINES HERE]**

```
-- Paste here the output of: head -20 lab1_schema.sql
```

---

# Section 3: AI Learning Log (25 points)

*Minimum 5 high-quality AI interactions. Use the format below for each entry. Draft in `lab1/AI_LEARNING_LOG_TEMPLATE.md` then copy here.*

---

## AI INTERACTION #1

**Date:**  
**AI Tool:** Claude / ChatGPT / Other  

**Task:**  
**Prompt used:**  
**Response quality:** ⭐⭐⭐⭐⭐  

**Key learnings:**  
**How I verified:**  
**What I modified:**  

---

## AI INTERACTION #2

[Same structure as above]

---

## AI INTERACTION #3

[Same structure as above]

---

## AI INTERACTION #4

[Same structure as above]

---

## AI INTERACTION #5

[Same structure as above]

---

# Section 4: Version Control (15 points)

## 4.1 GitHub Repository

**Repository URL:** https://github.com/[YOUR_USERNAME]/database-labs  

**[INSERT SCREENSHOT HERE]**  
*Screenshot: GitHub repo page showing folder structure, README, and commit history*

---

## 4.2 Commit History

**Command:** `git log --oneline --graph --all`

**[INSERT SCREENSHOT HERE]**  
*Screenshot: Terminal output showing commits with messages like "Initial commit", "Lab 1: Created books_read table", etc.*

---

## 4.3 File Organization

**Expected structure:**
```
database-labs/
├── README.md
└── lab1/
    ├── create_books_table.sql
    ├── queries.sql
    └── NOTES.md
```

**Command:** `tree` or `find . -type f`

**[INSERT SCREENSHOT HERE]**  
*Screenshot: Terminal or file explorer showing the above structure*

---

# End of Report

**Submission reminder:** Save this document as a PDF named  
**Lab01_[FirstName][LastName]_[RollNumber].pdf**  
and submit to Google Classroom before the deadline.
