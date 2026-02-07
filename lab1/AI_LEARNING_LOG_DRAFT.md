# AI Learning Log — Draft for Lab 01 Report (Section 3)

Copy each entry below into your report. Edit dates, details, and "What I modified" to match what you actually did. Use **Cursor** or **ChatGPT/Claude** as the AI tool depending on what you used.

---

## AI INTERACTION #1

**Date:** [e.g. 6 February 2026]  
**AI Tool:** Cursor / ChatGPT / Claude  

**Task:** I needed to set up the full environment for Database Systems Lab 01: install PostgreSQL and DBeaver, create a database user and database, and know the exact steps for Ubuntu.

**Prompt used:** Something like: "We need to download the required things like PostgreSQL and DBeaver and other things" and "create a report having all the setups we have done."

**Response quality:** ⭐⭐⭐⭐⭐  

**Key learnings:**  
- On Ubuntu, PostgreSQL is installed with `sudo apt install postgresql postgresql-contrib` and started with `sudo systemctl start postgresql`.  
- DBeaver can be installed from a .deb from dbeaver.io or via snap.  
- A PostgreSQL user and database are created by running SQL as the `postgres` superuser (e.g. `sudo -u postgres psql -f create_user_and_db.sql`).  
- I need to create the user, then the database with an owner, then connect DBeaver to that database.

**How I verified:** I ran the commands in the terminal, ran `psql --version` and `sudo systemctl status postgresql`, and connected with `psql -U muhammad-asif-khan -d lab1_db`. I also connected DBeaver to lab1_db and saw the database in the navigator.

**What I modified:** I used my own username `muhammad-asif-khan` and password in the SQL script. I followed the SETUP_INSTALL_GUIDE and created the database and user, then tested the connection in both terminal and DBeaver.

---

## AI INTERACTION #2

**Date:** [e.g. 6 February 2026]  
**AI Tool:** Cursor / ChatGPT / Claude  

**Task:** I needed to create a PostgreSQL user and database with a specific username and password for the lab.

**Prompt used:** "create database with the user muhammad-asif-khan and PASSWORD asif.khan"

**Response quality:** ⭐⭐⭐⭐⭐  

**Key learnings:**  
- In PostgreSQL, usernames with a hyphen (like `muhammad-asif-khan`) must be quoted in SQL: `"muhammad-asif-khan"`.  
- The steps are: CREATE USER with PASSWORD, optionally ALTER USER for privileges, then CREATE DATABASE with OWNER.  
- I can put these commands in a .sql file and run it with `sudo -u postgres psql -f create_user_and_db.sql` instead of typing them manually in psql.

**How I verified:** I ran the script, then ran `psql -U muhammad-asif-khan -d lab1_db -c "SELECT version();"` and was prompted for the password. Connection succeeded.

**What I modified:** I used the generated `create_user_and_db.sql` as provided and ran it from the `database-labs` folder. I did not change the username or password.

---

## AI INTERACTION #3

**Date:** [e.g. 7 February 2026]  
**AI Tool:** Cursor / ChatGPT / Claude  

**Task:** In DBeaver I only saw the `postgres` database and not `lab1_db`. I needed to fix this so I could use lab1_db in DBeaver.

**Prompt used:** "in dbeaver i don't have lab1_db" (and shared a screenshot of the Database Navigator showing only postgres).

**Response quality:** ⭐⭐⭐⭐  

**Key learnings:**  
- The connection in DBeaver might be pointing at the default `postgres` database; I should refresh the Databases node to see if other databases appear.  
- If lab1_db still does not exist, I can create it from the current connection with: `CREATE DATABASE lab1_db OWNER "muhammad-asif-khan";` in an SQL script.  
- For lab work it is better to have a separate connection that uses Database = `lab1_db` and Username = `muhammad-asif-khan` so that lab1_db is clearly visible and used for all lab scripts.

**How I verified:** I refreshed the connection or created the database with the SQL above, then created a new connection in DBeaver with Database = lab1_db and Username = muhammad-asif-khan. I saw lab1_db in the navigator and could expand it to see Schemas and Tables.

**What I modified:** I created a new DBeaver connection specifically for lab1_db with host localhost, port 5432, database lab1_db, and username muhammad-asif-khan. I use this connection for all lab 1 SQL and screenshots.

---

## AI INTERACTION #4

**Date:** [e.g. 6 February 2026]  
**AI Tool:** Cursor / ChatGPT / Claude  

**Task:** I needed to complete the Week 1 lab manual: create the repo structure, SQL files for the books_read table and queries, and know what to deliver for the report.

**Prompt used:** "let's complete our week 1 lab manual" and reference to week1.pdf.

**Response quality:** ⭐⭐⭐⭐⭐  

**Key learnings:**  
- The lab requires a `database-labs` repo with a `lab1` folder containing `create_books_table.sql`, `queries.sql`, and `NOTES.md`.  
- The table `books_read` has specific columns (book_id, title, author, category, pages, date_finished, rating, notes) and the lab expects at least 5 sample rows.  
- I need five types of analytical queries: WHERE, GROUP BY, ORDER BY, a date function (e.g. TO_CHAR), and a multi-condition (AND/OR).  
- The report must include environment setup screenshots, database work (table, data, 5 queries, schema export), AI Learning Log (5 entries), and version control (GitHub, commits, file structure).

**How I verified:** I compared the created files with week1.pdf, ran `create_books_table.sql` in DBeaver and saw the table and 5 rows. I ran each query in `queries.sql` and confirmed the results. I checked LAB01_SUBMISSION_CHECKLIST.md against the report sections.

**What I modified:** I used the provided `create_books_table.sql` and `queries.sql` as-is. I added my name and details to README.md and NOTES.md. I ran the table script against my lab1_db and used the same queries for the report screenshots.

---

## AI INTERACTION #5

**Date:** [e.g. 7 February 2026]  
**AI Tool:** Cursor / ChatGPT / Claude  

**Task:** The lab report was in Markdown and I needed to submit a PDF or DOCX file. I wanted a ready-to-submit document, not just .md.

**Prompt used:** "no you have created markdown file i need pdf or docx file i need to submit it"

**Response quality:** ⭐⭐⭐⭐⭐  

**Key learnings:**  
- I can get a PDF without extra software by opening an HTML version of the report in Chrome or Firefox and using Print → Save as PDF.  
- To get a DOCX I can open the same HTML in LibreOffice Writer and Save As → Microsoft Word (.docx), or upload the HTML to Google Docs and Download as .docx.  
- If pandoc is installed (`sudo apt install pandoc`), I can convert Markdown to DOCX with: `pandoc Lab01_Report.md -o Lab01_Report.docx`.  
- The report content can live in both .md and .html; the HTML is best for printing to PDF and for opening in Word/LibreOffice.

**How I verified:** I opened Lab01_Report.html in a browser and used Ctrl+P → Save as PDF. I got a multi-page PDF. I also opened the HTML in LibreOffice (or used Google Docs) and saved/exported as .docx and confirmed the file opened in Word.

**What I modified:** I used the provided Lab01_Report.html and HOW_TO_GET_PDF_AND_DOCX.txt. I added my screenshots to the report (or pasted them into the PDF when printing). I saved the final PDF as Lab01_MyName_RollNumber.pdf for submission.

---

*End of AI Learning Log draft. Copy the above into Section 3 of your report and adjust any details to match your actual experience.*
