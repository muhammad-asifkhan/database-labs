# Step-by-Step: Complete Your Lab 01 Report

Do these in order. After each step, take a screenshot and save it in the `database-labs` folder with the filename given. Then add it to the report (or paste into the PDF when you export).

---

## Before You Start

- Create a folder for screenshots: `database-labs/screenshots` (optional but tidy).
- Suggested filenames are below; use them so you know which image goes where in the report.

---

## SECTION 1: Environment Setup

### Step 1.1 — Linux Terminal
1. Open **Terminal**.
2. Run: `uname -a` then press Enter.
3. Run: `whoami` then press Enter.
4. **Screenshot:** Capture the terminal showing both outputs.  
   **Save as:** `01_terminal_uname_whoami.png`

### Step 1.2 — PostgreSQL installed and running
1. In terminal run: `psql --version`
2. Then run: `sudo systemctl status postgresql`
3. **Screenshot:** Terminal showing both (version + “active (running)”).  
   **Save as:** `02_postgresql_version_status.png`

### Step 1.3 — DBeaver installed
1. Open **DBeaver**.
2. **Screenshot:** Main window, or Help → About (to show version).  
   **Save as:** `03_dbeaver_installed.png`

### Step 1.4 — Database and user (muhammad-asif-khan, lab1_db)
1. In terminal run: `psql -U muhammad-asif-khan -d lab1_db` (password: asif.khan).
2. In psql run: `SELECT version();`
3. Then run: `\l` (list databases — lab1_db should appear).
4. **Screenshot:** psql window with version output and database list.  
   **Save as:** `04_psql_version_list_databases.png`

### Step 1.5 — DBeaver connected to PostgreSQL
1. In **DBeaver**, make sure your **lab1_db** connection is connected.
2. Expand: **Databases** → **lab1_db** (and optionally Schemas → public → Tables).
3. **Screenshot:** Database Navigator showing lab1_db and structure.  
   **Save as:** `05_dbeaver_connection_lab1_db.png`

### Step 1.6 — Table created and data inserted
1. In DBeaver, expand **lab1_db** → Schemas → public → **Tables** → **books_read**.
2. Right-click **books_read** → **View Data** (or open SQL and run `SELECT * FROM books_read;`).
3. **Screenshot:** Either the table in the tree + data grid with 5 rows.  
   **Save as:** `06_books_read_table_and_data.png`

### Step 1.7 — Git configuration
1. In terminal run: `git --version`
2. Then run: `git config --list`
3. **Screenshot:** Terminal with both outputs.  
   **Save as:** `07_git_version_config.png`

---

## SECTION 2: Database Work

### Step 2.1 — Table structure
1. In DBeaver: right-click **books_read** → **View Table** (or Properties).
2. **Screenshot:** Columns, types, primary key, constraints.  
   **Save as:** `08_books_read_structure.png`

### Step 2.2 — Sample data (5 books)
1. In DBeaver SQL Editor run: `SELECT * FROM books_read ORDER BY date_finished;`
2. **Screenshot:** Result grid with 5 rows.  
   **Save as:** `09_sample_data_5_books.png`

### Step 2.3 — Five analytical queries
For each query, run it in DBeaver and screenshot the **SQL + result** (one screenshot per query is enough if both are visible).

1. **Query 1 (WHERE):** Run the rating ≥ 4.5 query. **Screenshot:** `10_query1_where.png`
2. **Query 2 (GROUP BY):** Run the category/avg pages query. **Screenshot:** `11_query2_groupby.png`
3. **Query 3 (ORDER BY):** Run the ORDER BY date_finished query. **Screenshot:** `12_query3_orderby.png`
4. **Query 4 (Date function):** Run the TO_CHAR/monthly query. **Screenshot:** `13_query4_date.png`
5. **Query 5 (AND/OR):** Run the ML or Data Science + rating > 4.0 query. **Screenshot:** `14_query5_and_or.png`

### Step 2.4 — Schema export
1. In terminal run:  
   `cd ~/asif/database-labs`  
   `pg_dump -U muhammad-asif-khan -d lab1_db -s > lab1_schema.sql`  
   (password if prompted: asif.khan)
2. Run: `head -20 lab1_schema.sql`
3. **Screenshot:** Terminal showing first 20 lines of schema.  
   **Save as:** `15_schema_export.png`

---

## SECTION 3: AI Learning Log — DONE

- **Done for you:** All 5 entries are in Lab01_Report.html (Section 3) with dates 6 & 7 Feb 2026, AI Tool: Cursor. Add screenshots and export to PDF.
- Optional: Open **`lab1/AI_LEARNING_LOG_DRAFT.md`** to edit or copy text.
- Copy each of the 5 entries into your report (Lab01_Report.html or the Word/PDF).
- Adjust dates, “Key learnings”, and “What I modified” to match what you actually did.
- You used AI (Cursor/ChatGPT/Claude) for: system check, PostgreSQL/DBeaver setup, user/database creation, lab1_db not showing, and report/PDF help — these are used as the basis for the 5 entries.

---

## SECTION 4: Version Control

**Full instructions:** See **SECTION4_VERSION_CONTROL_DO_THIS.md** in this folder.

### Step 4.1 — GitHub repo
1. Create repo **database-labs** on GitHub (https://github.com/new). 2. Push: `git init`, `git add .`, `git commit -m "Initial commit: Lab 01"`, `git remote add origin https://github.com/YOUR_USERNAME/database-labs.git`, `git push -u origin main`.
3. **Screenshot:** GitHub repo page. Save as: `16_github_repo.png`

### Step 4.2 — Commit history
1. Run: `cd ~/asif/database-labs` then `git log --oneline --graph --all`
2. **Screenshot:** Terminal. Save as: `17_git_log.png`

### Step 4.3 — File structure
1. Run: `cd ~/asif/database-labs && find . -type f | grep -v .git` (or `tree`)
2. **Screenshot:** Output. Save as: `18_repo_structure.png`

---

## Final Steps

1. Fill in **name, roll number, date** at the top of Lab01_Report.html (or in Word/PDF).
2. Replace each “[INSERT SCREENSHOT HERE]” in the report with the matching image (or paste screenshots into the PDF when you export).
3. Paste the 5 **AI Learning Log** entries from `lab1/AI_LEARNING_LOG_DRAFT.md` into Section 3.
4. Open **Lab01_Report.html** in Chrome/Firefox → **Ctrl+P** → **Save as PDF**.
5. Name the PDF: **Lab01_FirstNameLastName_RollNumber.pdf** and submit to Google Classroom.
