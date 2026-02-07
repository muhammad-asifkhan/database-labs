# Week 1 Lab — Install Required Software (Ubuntu / Linux)

---

## Setup status

| Step | Item | Status |
|------|------|--------|
| 1 | System update | Done |
| 2 | PostgreSQL installed | Done |
| 3 | PostgreSQL started & enabled | Done |
| 4 | Database user + `lab1_db` | Done |
| 5 | DBeaver installed | Done |
| 6 | Git | Already installed |
| 7 | DBeaver connected to PostgreSQL | Done |

**What’s left for you:** Run the lab SQL (step 8) to create the `books_read` table, then Git config, push to GitHub, and complete the PDF for submission (see `lab1/LAB01_SUBMISSION_CHECKLIST.md`).

---

Run the commands below **in your own terminal** (one block at a time). You will need to enter your password when `sudo` asks.

---

## 1. Update system (recommended)

```bash
sudo apt update
sudo apt upgrade -y
```

---

## 2. Install PostgreSQL

```bash
# Install PostgreSQL and contrib (extra modules)
sudo apt install -y postgresql postgresql-contrib
```

**Verify:**
```bash
psql --version
```
You should see something like `psql (PostgreSQL) 16.x` or `15.x`.

---

## 3. Start PostgreSQL and enable on boot

```bash
# Start the service now
sudo systemctl start postgresql

# Enable so it starts on every boot
sudo systemctl enable postgresql

# Check it's running
sudo systemctl status postgresql
```
You should see **active (running)** in green.

---

## 4. Create your database user and lab1_db

Replace `YOUR_LINUX_USERNAME` with your actual username (e.g. `muhammad-asif-khan`).  
Replace `your_secure_password` with a password you’ll remember.

```bash
# Switch to postgres user and open psql
sudo -u postgres psql
```

Then **inside the psql prompt** (`postgres=#`), run (edit the username and password first):

```sql
-- Create your user (use your Linux username)
CREATE USER YOUR_LINUX_USERNAME WITH PASSWORD 'your_secure_password';

-- Grant superuser for learning
ALTER USER YOUR_LINUX_USERNAME WITH SUPERUSER;

-- Create the lab database
CREATE DATABASE lab1_db OWNER YOUR_LINUX_USERNAME;

-- Check
\l

-- Exit
\q
```

**Test connection:**
```bash
psql -U YOUR_LINUX_USERNAME -d lab1_db -c "SELECT version();"
```
If you see the PostgreSQL version, it worked.

---

## 5. Install DBeaver Community

### Option A: Install from .deb (recommended)

```bash
# Go to a folder you can write to
cd ~/Downloads

# Download DBeaver Community (Ubuntu/Debian .deb)
# If you have wget:
wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb

# Install
sudo dpkg -i dbeaver-ce_*_amd64.deb

# If you get dependency errors, run:
sudo apt install -f -y
```

### Option B: Using snap (if you use snap)

```bash
sudo snap install dbeaver-ce
```

**Launch:** Search for “DBeaver” in your app menu or run:
```bash
dbeaver
```

---

## 6. Git (already installed)

Check:
```bash
git --version
```
If you see a version, you’re good. Configure once (use your real name and GitHub email):

```bash
git config --global user.name "Your Full Name"
git config --global user.email "your.email@example.com"
git config --list
```

---

## 7. Connect DBeaver to PostgreSQL

1. Open **DBeaver**.
2. **Database → New Database Connection** (or the plug icon).
3. Choose **PostgreSQL** → Next.
4. Fill in:
   - **Host:** `localhost`
   - **Port:** `5432`
   - **Database:** `lab1_db`
   - **Username:** your Linux username (e.g. `muhammad-asif-khan`)
   - **Password:** the password you set in step 4
   - Check **Save password**.
5. Click **Test Connection**. First time it will download drivers → **Download**.
6. If it says “Connected”, click **Finish**.

---

## 8. Run the Lab 1 SQL (create table + data)

In terminal, from the folder that contains `lab1/create_books_table.sql`:

```bash
cd ~/asif/database-labs
psql -U YOUR_LINUX_USERNAME -d lab1_db -f lab1/create_books_table.sql
```

Or in DBeaver: open `lab1/create_books_table.sql`, select all, and run (Ctrl+Enter).

---

## Quick reference

| Tool         | Check command                    | Purpose              |
|-------------|-----------------------------------|----------------------|
| PostgreSQL  | `psql --version`                 | Database server      |
| PostgreSQL  | `sudo systemctl status postgresql` | Is it running?     |
| DBeaver     | `dbeaver` or from app menu        | Database GUI         |
| Git         | `git --version`                  | Version control      |

If any step fails, copy the **exact error message** and the **exact command** you ran, and we can fix it step by step.

---

## What’s left — your checklist

Use this after installation is done:

- [x] **Step 4** — Create your PostgreSQL user and `lab1_db`.
- [x] **Step 7** — DBeaver connected to PostgreSQL.
- [ ] **Step 8** — Run `lab1/create_books_table.sql` (terminal or DBeaver) so the `books_read` table exists.
- [ ] **Git config** — `git config --global user.name "..."` and `user.email "..."` (once per machine).
- [ ] **GitHub** — Create repo `database-labs`, push this folder (`git init`, `git remote add origin ...`, `git push -u origin main`).
- [ ] **Lab PDF** — Fill `lab1/NOTES.md`, complete 5 AI log entries, take screenshots, export schema. See **lab1/LAB01_SUBMISSION_CHECKLIST.md** for the full list.
