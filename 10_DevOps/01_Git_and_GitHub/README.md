# GitHub Workflows: Complete Guide

> **Module:** System Design & DevOps
> **Topic:** Version Control, Branching Strategies, and Collaboration
> **Duration:** 1 hour

## 📚 Table of Contents

1. [Git vs GitHub](#intro)
2. [Git Basics](#basics)
3. [Branching Strategies](#branching)
4. [Pull Requests & Code Review](#pr)
5. [Merge vs Rebase](#merge-rebase)
6. [Best Practices](#practices)
7. [Interview Questions](#interview-questions)
8. [Multiple Choice Questions](#mcqs)
9. [Practice Challenges](#challenges)
10. [References](#references)

---

## <a name="intro"></a>1. Git vs GitHub

-   **Git:** A distributed version control system (tool). It runs locally on your machine.
-   **GitHub:** A cloud-based hosting service for Git repositories. It adds features like Pull Requests, Issues, and Actions.

---

## <a name="basics"></a>2. Git Basics

### Essential Commands

```bash
# Configuration
git config --global user.name "Your Name"
git config --global user.email "email@example.com"

# Setup
git init              # Initialize local repo
git clone <url>       # Download remote repo

# Workflow
git status            # Check changes
git add <file>        # Stage file
git add .             # Stage all
git commit -m "msg"   # Save snapshot
git push origin main  # Upload to remote
git pull origin main  # Download updates
```

### The Three States
1.  **Working Directory:** Where you modify files.
2.  **Staging Area:** Where you prepare a snapshot.
3.  **Repository:** Where Git stores the snapshots (commits).

---

## <a name="branching"></a>3. Branching Strategies

### Why Branch?
To work on features in isolation without breaking the main codebase.

### Common Strategies

1.  **Feature Branch Workflow (Simplest):**
    -   `main`: Stable code.
    -   `feature/xyz`: For new features. Merge into `main` when done.

2.  **Gitflow Workflow (Traditional):**
    -   `main`: Production releases.
    -   `develop`: Integration branch.
    -   `feature/*`: Feature development.
    -   `release/*`: Preparing for release.
    -   `hotfix/*`: Urgent fixes for production.

3.  **Trunk Based Development (Modern/DevOps):**
    -   Small, frequent updates to `main` (trunk).
    -   Uses Feature Flags to hide incomplete features.

---

## <a name="pr"></a>4. Pull Requests & Code Review

**Pull Request (PR):** A request to merge your changes into another branch. It initiates a Code Review.

### How to Create a PR?
1.  Create a branch locally: `git checkout -b feature/login`.
2.  Make changes, commit, and push: `git push -u origin feature/login`.
3.  Go to GitHub website -> "Compare & pull request".

### Code Review Checklist
-   Does the code meet requirements?
-   Are there tests?
-   Is the code readable?
-   No hardcoded credentials?

---

## <a name="merge-rebase"></a>5. Merge vs Rebase

### Merge (`git merge feature`)
-   Combines histories.
-   Creates a new "Merge Commit".
-   **Pros:** Preserves history exactly as it happened.
-   **Cons:** History can become messy/cluttered.

### Rebase (`git rebase main`)
-   Moves your branch to begin from the tip of `main`.
-   Rewrites history to make it linear.
-   **Pros:** Clean linear history.
-   **Cons:** Dangerous on shared branches (rewrites history).

> **Rule:** Never rebase a public branch that others are working on!

---

## <a name="practices"></a>6. Best Practices

1.  **Commit Often:** Small, atomic commits.
2.  **Good Messages:** "Fix login bug" (Good) vs "Update" (Bad).
3.  **Pull Before Push:** Avoid conflicts by keeping your local repo updated.
4.  **Use .gitignore:** Don't commit secrets, build artifacts, or node_modules.

---

## <a name="interview-questions"></a>7. Interview Questions

### Q1: Difference between `git pull` and `git fetch`?
**Answer:**
-   `git fetch`: Downloads changes from remote but **does not** update your working directory.
-   `git pull`: Downloads changes **AND** merges them into your current branch (fetch + merge).

### Q2: What is a Merge Conflict?
**Answer:**
Occurs when Git cannot automatically resolve differences in code between two commits (e.g., two people edited the same line of a file). You must manually resolve it by choosing which code to keep.

### Q3: What is "Stashing"?
**Answer:**
`git stash` temporarily saves your changes (dirty working directory) without committing them, allowing you to switch branches. You can restore them later with `git stash pop`.

### Q4: Explain `git cherry-pick`.
**Answer:**
`git cherry-pick <commit-hash>` takes a specific commit from one branch and applies it to your current branch. Useful for applying hotfixes.

### Q5: How to undo the last commit?
**Answer:**
-   `git reset --soft HEAD~1`: Undoes commit, keeps changes in staging.
-   `git reset --hard HEAD~1`: Undoes commit and discards all changes (Dangerous).

---

## <a name="mcqs"></a>8. Multiple Choice Questions

### MCQ 1
**Which command creates a new branch and switches to it?**
A) `git branch new`
B) `git checkout new`
C) `git checkout -b new`
D) `git create new`

<details>
<summary>Answer</summary>
**C) `git checkout -b new`**
</details>

### MCQ 2
**Where are files listed in `.gitignore` stored?**
A) Staging area
B) They are ignored by Git
C) Remote repository only
D) Local repository only

<details>
<summary>Answer</summary>
**B) They are ignored by Git**
</details>

### MCQ 3
**Which command shows the commit history?**
A) `git log`
B) `git history`
C) `git status`
D) `git list`

<details>
<summary>Answer</summary>
**A) `git log`**
</details>

### MCQ 4
**What folder contains the Git repository metadata?**
A) `.github`
B) `.git`
C) `git_data`
D) `node_modules`

<details>
<summary>Answer</summary>
**B) `.git`**
</details>

---

## <a name="challenges"></a>9. Practice Challenges

### Challenge 1: Resolve a Conflict
1.  Create a repo.
2.  Make change to `file.txt` on `main`. Commit.
3.  Create branch `feature`. Change same line in `file.txt`. Commit.
4.  Go back to `main`. Change same line to something else. Commit.
5.  Merge `feature` into `main`. Fix the conflict.

### Challenge 2: Squash Commits
**Scenario:** You made 5 typo fix commits.
**Task:** Use `git rebase -i` to squash them into one clean commit before merging.

### Challenge 3: Restore Deleted File
**Task:** Delete a file, commit it. Then find a way to verify the file was there in previous commit and restore it using `git checkout` or `git restore`.

---

## <a name="references"></a>10. References

-   [Pro Git Book](https://git-scm.com/book/en/v2) (Official & Free)
-   Atlassian Git Tutorials
-   GitHub Learning Lab

---

## 🎯 Key Takeaways

1.  **Git is mandatory:** Every developer works with it daily.
2.  **Branching protects production:** Never push directly to main.
3.  **Communication:** Good commit messages and PR descriptions are part of being a professional developer.
