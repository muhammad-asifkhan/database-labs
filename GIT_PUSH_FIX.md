# Fix Git Push Errors

You saw:
- **Author identity unknown** — Git needs your name and email.
- **src refspec main does not match any** — Either the branch is still `master`, or there was no commit yet.
- **nothing to commit, working tree clean** — Everything is already committed; you only need to push.

Run these in order in your terminal (use your real name and the email tied to your GitHub account):

---

## Step 1: Set your Git identity (once per machine)

```bash
git config --global user.name "Muhammad Asif Khan"
git config --global user.email "your-email@example.com"
```
git config --global user.name "Muhammad Asif Khan"
git config --global user.email "your-email@example.com"
Replace `your-email@example.com` with your actual email (ideally your GitHub email).

---

## Step 2: Add files, commit, then push

```bash
cd ~/asif/database-labs

# Add all files
git add .

# Create the first commit (required before push)
git commit -m "Initial commit: Lab 01 environment and report"

# Rename branch from master to main (GitHub uses main)
git branch -M main

# Push to GitHub
git push -u origin main
```

When prompted for username and password:
- **Username:** your GitHub username (e.g. muhammad-asifkhan)
- **Password:** use a **Personal Access Token**, not your GitHub password. Create one at: GitHub → Settings → Developer settings → Personal access tokens → Generate new token (classic), scope: **repo**.

---

If your GitHub repo was created with default branch **master** instead of **main**, and push still fails, try:

```bash
git push -u origin master
```

Then in GitHub: repo → Settings → change default branch to **main** if you want.
