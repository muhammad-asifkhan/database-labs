# Section 4: Version Control — Do These Steps

Section 3 (AI Learning Log) is **already done** in `Lab01_Report.html` — all 5 entries have dates (6 & 7 February 2026) and Cursor as the AI tool. You only need to add your screenshots when you export the PDF.

---

## Section 4.1 — GitHub repo

**You need to do:**

1. **Create the repo on GitHub**
   - Go to https://github.com/new
   - Repository name: **database-labs**
   - Description: "Database Systems Lab - Spring 2026"
   - Public. Do **not** check "Add a README".
   - Click **Create repository**.

2. **Push your local folder to GitHub** (run in terminal):

```bash
cd ~/asif/database-labs

# If you have not initialized git yet:
git init
git add .
git commit -m "Initial commit: Lab 01 environment and report"

# Add your GitHub repo (replace YOUR_USERNAME with your GitHub username):
git remote add origin https://github.com/YOUR_USERNAME/database-labs.git

# Push (you will be asked for GitHub username and password/token):
git branch -M main
git push -u origin main
```

3. **Screenshot:** Open your repo in the browser (https://github.com/YOUR_USERNAME/database-labs). Capture the page showing README, folder structure (e.g. lab1/), and commit history.  
   **Save as:** `16_github_repo.png`

---

## Section 4.2 — Commit history

**Run in terminal:**

```bash
cd ~/asif/database-labs
git log --oneline --graph --all
```

**Screenshot:** Terminal window with the output (commit hashes and messages).  
**Save as:** `17_git_log.png`

---

## Section 4.3 — File structure

**Run in terminal:**

```bash
cd ~/asif/database-labs
find . -type f | grep -v '.git'
```

Or if you have `tree` installed:

```bash
cd ~/asif/database-labs
tree
```

**Screenshot:** Terminal showing the file list (README.md, lab1/create_books_table.sql, lab1/queries.sql, lab1/NOTES.md, etc.).  
**Save as:** `18_repo_structure.png`

---

## After the 3 screenshots

- Insert **16_github_repo.png**, **17_git_log.png**, and **18_repo_structure.png** into your report (Section 4) where indicated, or paste them into the PDF when you print.
- Update the report with your real GitHub URL: `https://github.com/YOUR_USERNAME/database-labs` (replace YOUR_USERNAME).
- Export the report to PDF and submit.
