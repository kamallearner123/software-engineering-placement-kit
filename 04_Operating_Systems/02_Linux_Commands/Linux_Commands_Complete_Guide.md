# Linux Commands: Complete Guide

> **Module:** Operating Systems & Linux
> **Topic:** File Management, Text Processing, and System Administration
> **Duration:** 2 hours

## 📚 Table of Contents

1. [Understanding the Shell](#shell)
2. [File System Navigation](#navigation)
3. [File Operations](#file-ops)
4. [File Permissions](#permissions)
5. [Text Processing (grep, sed, awk)](#text)
6. [Process Management](#process)
7. [Networking Commands](#network)
8. [Interview Questions](#interview-questions)
9. [Multiple Choice Questions](#mcqs)
10. [Practice Challenges](#challenges)
11. [References](#references)

---

## <a name="shell"></a>1. Understanding the Shell

The **Shell** is a command-line interpreter that provides a user interface for the Unix-like operating systems.
-   **Bash:** Bourne Again Shell (Default on most Linux distros).
-   **Zsh:** Z Shell (Default on macOS).
-   **Prompt:** `username@hostname:~$`
    -   `~`: Home directory.
    -   `$`: Regular user.
    -   `#`: Root user (Superuser).

---

## <a name="navigation"></a>2. File System Navigation

| Command | Description | Example |
| :--- | :--- | :--- |
| `pwd` | Print Working Directory. Shows where you are. | `pwd` |
| `ls` | List directory contents. | `ls -la` (List all + hidden) |
| `cd` | Change Directory. | `cd /var/log` |
| `cd ..` | Go up one level. | `cd ..` |
| `cd ~` | Go to home directory. | `cd ~` |

---

## <a name="file-ops"></a>3. File Operations

| Command | Description | Example |
| :--- | :--- | :--- |
| `touch` | Create empty file. | `touch notes.txt` |
| `mkdir` | Make Directory. | `mkdir project` |
| `cp` | Copy file/directory. | `cp file.txt backup.txt` |
| `mv` | Move or Rename. | `mv file.txt newname.txt` |
| `rm` | Remove (Delete). | `rm file.txt` |
| `rm -rf` | Force remove directory (Careful!). | `rm -rf folder/` |
| `cat` | Display file content. | `cat config.json` |
| `head` | Show first 10 lines. | `head -n 5 file.txt` |
| `tail` | Show last 10 lines. | `tail -f log.txt` (Follow) |

---

## <a name="permissions"></a>4. File Permissions

Linux permissions are divided into: **User (u)**, **Group (g)**, **Others (o)**.
Types: **Read (r=4)**, **Write (w=2)**, **Execute (x=1)**.

### `chmod` (Change Mode)
-   `chmod 755 script.sh`
    -   User: 7 (4+2+1) -> rwx
    -   Group: 5 (4+0+1) -> r-x
    -   Others: 5 (4+0+1) -> r-x
-   `chmod +x script.sh`: Add execute permission.

### `chown` (Change Owner)
-   `chown user:group file.txt`: Change ownership.

---

## <a name="text"></a>5. Text Processing

### `grep` (Global Regular Expression Print)
Search for specific text patterns.
-   `grep "error" log.txt`: Search "error" in file.
-   `grep -r "main" .`: Recursive search in current dir.
-   `grep -i "hello" file`: Case insensitive.

### `sed` (Stream Editor)
Search and Replace.
-   `sed 's/old/new/g' file.txt`: Replace 'old' with 'new' globally. (Does not modify file unless `-i`).

### `awk` (Text Processing Language)
Used for data extraction and reporting (columns).
-   `awk '{print $1}' file.txt`: Print first column.
-   `df -h | awk '{print $5}'`: Print disk usage percentages.

---

## <a name="process"></a>6. Process Management

| Command | Description |
| :--- | :--- |
| `ps` | Process Status. `ps aux` shows all. |
| `top` | Dynamic real-time view of running processes. |
| `htop` | Colorful, interactive version of top. |
| `kill` | Terminate process. `kill <pid>` (SIGTERM). |
| `kill -9` | Force kill. `kill -9 <pid>` (SIGKILL). |

---

## <a name="network"></a>7. Networking Commands

| Command | Description |
| :--- | :--- |
| `ping` | Check connectivity to a host. |
| `ifconfig` | Interface Configuration (Current IP). (Use `ip addr` now). |
| `netstat` | Network Statistics (Ports). |
| `curl` | Transfer data from/to server. `curl http://google.com` |
| `ssh` | Secure Shell. Remote login. `ssh user@host`. |

---

## <a name="interview-questions"></a>8. Interview Questions

### Q1: What does `ls -l` show?
**Answer:**
It shows the long listing format, which includes:
-   File permissions (`-rw-r--r--`)
-   Number of links
-   Owner name
-   Group name
-   File size
-   Time of last modification
-   File/Directory name

### Q2: How do you find a file by name?
**Answer:**
Using the `find` command.
`find /path/to/search -name "filename.txt"`

### Q3: Explain the pipe `|` operator.
**Answer:**
Key concept in Linux. It takes the **Standard Output (stdout)** of the command on the left and feeds it as **Standard Input (stdin)** to the command on the right.
Example: `ls | grep "txt"` (List files, then search for "txt" in that list).

### Q4: What is the difference between `Soft Link` and `Hard Link`?
**Answer:**
-   **Hard Link:** A mirror copy of the original file. Points to the same Inode. If original is deleted, hard link still works.
-   **Soft Link (Symlink):** Pointer to the file name. If original is deleted, link becomes broken. (Like a Windows Shortcut).

### Q5: How to check disk usage?
**Answer:**
-   `df -h`: Disk Free (shows total/available space on mounts).
-   `du -sh folder`: Disk Usage (shows size of specific directory).

---

## <a name="mcqs"></a>9. Multiple Choice Questions

### MCQ 1
**Which command is used to change permissions?**
A) `chown`
B) `chmod`
C) `chperm`
D) `attrib`

<details>
<summary>Answer</summary>
**B) `chmod`**
</details>

### MCQ 2
**What is the PID of the `init` or `systemd` process (first process)?**
A) 0
B) 1
C) 100
D) Random

<details>
<summary>Answer</summary>
**B) 1**
</details>

### MCQ 3
**Which symbol redirects output to a file (overwriting it)?**
A) `|`
B) `>>`
C) `>`
D) `<`

<details>
<summary>Answer</summary>
**C) `>`** (`>>` appends).
</details>

### MCQ 4
**Which command displays the current user name?**
A) `whoami`
B) `checkuser`
C) `mypc`
D) `pwd`

<details>
<summary>Answer</summary>
**A) `whoami`**
</details>

### MCQ 5
**How do you run a process in the background?**
A) Add `&` at the end
B) Add `BG` at the start
C) Press Ctrl+Z
D) You cannot

<details>
<summary>Answer</summary>
**A) Add `&` at the end**
</details>

---

## <a name="challenges"></a>10. Practice Challenges

### Challenge 1: Permission Puzzle
**Task:** Create a file `secret.txt`. Set permissions so:
-   Owner can Read/Write/Execute.
-   Group can Read only.
-   Others have No permissions.
**Command:** `chmod 740 secret.txt`

### Challenge 2: Log Analysis
**Task:** Given a log file `server.log`, find all lines containing "ERROR" and save them to `errors.txt`.
**Command:** `grep "ERROR" server.log > errors.txt`

### Challenge 3: Process Check
**Task:** Find the Process ID (PID) of the python script running `app.py`.
**Command:** `ps aux | grep app.py`

---

## <a name="references"></a>11. References

-   `man` pages (e.g., `man ls`).
-   [Linux Journey](https://linuxjourney.com/).

---

## 🎯 Key Takeaways

1.  **CLI is Power:** It's faster and more capable than GUI for admin tasks.
2.  **Piping:** Combine simple commands to perform complex operations (`|`).
3.  **Permissions:** Essential for security (`chmod`, `chown`).
4.  **Practice:** The only way to learn is to use the terminal daily.
