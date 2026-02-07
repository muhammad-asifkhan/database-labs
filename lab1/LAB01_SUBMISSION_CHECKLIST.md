# Lab 01 — Submission Checklist & Commands for PDF

**PDF filename:** `Lab01_[FirstName][LastName]_[RollNumber].pdf`  
**Due:** Thursday 5th February 2026  
**Submit to:** Google Classroom (PDF only, < 10MB)

---

## Section 1: Environment Setup (20 pts) — Screenshots needed

| # | What to capture | Command / action |
|---|------------------|-------------------|
| 1.1 | Linux terminal + version + username | `uname -a` then `whoami` |
| 1.2 | PostgreSQL installed and running | `psql --version` then `sudo service postgresql status` |
| 1.3 | psql connection + version + databases | In psql: `SELECT version();` then `\l` |
| 1.4 | DBeaver connected, lab1_db and books_read visible | DBeaver window |
| 1.5 | Git version and config | `git --version` then `git config --list` |

---

## Section 2: Database Work (30 pts)

| # | What to include |
|---|------------------|
| 2.1 | Screenshot of `books_read` table structure in DBeaver (columns, types, constraints) |
| 2.2 | Screenshot of: `SELECT * FROM books_read ORDER BY date_finished;` — at least 5 rows |
| 2.3 | **5 queries** — for each: SQL code + result screenshot + short explanation. Types: (1) WHERE, (2) GROUP BY, (3) ORDER BY, (4) date function, (5) AND/OR |
| 2.4 | Export schema: run in terminal then paste first 20 lines in PDF:  
      | `pg_dump -U your_username -d lab1_db -s > lab1_schema.sql` |

---

## Section 3: AI Learning Log (25 pts)

- **Minimum 5** AI interactions.
- Each entry: Task, Prompt, Response quality (stars), Key learnings, How you verified, What you modified.
- Document in PDF; you can draft in `AI_LEARNING_LOG_TEMPLATE.md`.

---

## Section 4: Version Control (15 pts)

| # | What to include |
|---|------------------|
| 4.1 | GitHub repo URL + screenshot (folder structure, commit history, README) |
| 4.2 | Screenshot of: `git log --oneline --graph --all` |
| 4.3 | Repo structure: `database-labs/` → `README.md`, `lab1/` → `create_books_table.sql`, `queries.sql`, `NOTES.md` |

---

## One-time setup (if not done yet)

```bash
# 1. Create and use repo (choose one location)
mkdir -p ~/database-labs
cd ~/database-labs
# Copy contents from asif/database-labs into here, then:

git init
git add .
git commit -m "Initial commit: Course setup"
git remote add origin https://github.com/YOUR_USERNAME/database-labs.git
git push -u origin main
```

```bash
# 2. Create DB and table (in psql or DBeaver)
psql -U your_username -d lab1_db -f lab1/create_books_table.sql
```

```bash
# 3. Schema dump for PDF (run from terminal, replace your_username)
pg_dump -U your_username -d lab1_db -s > lab1_schema.sql
head -20 lab1_schema.sql   # paste this in PDF
```

---

## Final checks before submit

- [ ] PDF has all 4 sections
- [ ] Name and roll number on first page
- [ ] All screenshots clear and readable
- [ ] GitHub repo public (or instructor has access)
- [ ] File size < 10MB
