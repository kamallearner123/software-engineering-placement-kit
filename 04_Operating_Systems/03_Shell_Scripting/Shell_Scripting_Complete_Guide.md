# Shell Scripting: Complete Guide

> **Module:** Operating Systems & Linux
> **Topic:** Bash Scripting, Automation, and Cron Jobs
> **Duration:** 2 hours

## 📚 Table of Contents

1. [Introduction to Shell Scripting](#intro)
2. [Variables and Input](#variables)
3. [Conditionals (If/Else)](#conditionals)
4. [Loops (For/While)](#loops)
5. [Functions](#functions)
6. [Command Line Arguments](#args)
7. [Cron Jobs (Scheduling)](#cron)
8. [Interview Questions](#interview-questions)
9. [Multiple Choice Questions](#mcqs)
10. [Practice Challenges](#challenges)
11. [References](#references)

---

## <a name="intro"></a>1. Introduction to Shell Scripting

A shell script is a text file containing a sequence of commands for a UNIX-based operating system. It allows repetitive tasks to be automated.

### The Shebang (`#!`)
The first line of the script tells the system which interpreter to use.
```bash
#!/bin/bash
echo "Hello, World!"
```

### Running a Script
1.  Create file: `nano script.sh`
2.  Make executable: `chmod +x script.sh`
3.  Run: `./script.sh`

---

## <a name="variables"></a>2. Variables and Input

### Variables
-   **Assignment:** `NAME="Alice"` (No spaces around `=`).
-   **Access:** `echo $NAME` or `echo ${NAME}`.

### User Input
```bash
read -p "Enter your name: " USER_NAME
echo "Hello $USER_NAME"
```

---

## <a name="conditionals"></a>3. Conditionals (If/Else)

### Syntax
```bash
if [ condition ]; then
    # commands
elif [ condition ]; then
    # commands
else
    # commands
fi
```
> **Note:** Spaces inside `[ ]` are mandatory! `[ $a == $b ]`.

### Comparisons
-   **Numbers:** `-eq` (equal), `-ne` (not equal), `-gt` (greater), `-lt` (less), `-ge`, `-le`.
-   **Strings:** `==` (equal), `!=` (not equal), `-z` (empty).
-   **Files:** `-f` (exists regular file), `-d` (directory), `-e` (exists).

**Example:**
```bash
if [ -f "config.txt" ]; then
    echo "Config file exists."
else
    echo "Config file missing!"
fi
```

---

## <a name="loops"></a>4. Loops (For/While)

### For Loop
```bash
# Iterate over a list
for item in apple banana cherry; do
    echo "I like $item"
done

# C-style loop
for ((i=1; i<=5; i++)); do
    echo "Count: $i"
done
```

### While Loop
```bash
count=1
while [ $count -le 5 ]; do
    echo "Count: $count"
    ((count++))
done
```

---

## <a name="functions"></a>5. Functions

Code reuse blocks.

```bash
function greet() {
    echo "Hello, $1"
}

greet "Alice"  # Arguments passed directly
```

### Exit Codes
Every command returns an exit status (0-255).
-   `0`: Success.
-   `Non-zero`: Failure.
-   Check last command status with `$?`.

---

## <a name="args"></a>6. Command Line Arguments

Accessing arguments passed to the script (`./script.sh arg1 arg2`).

-   `$0`: Script name.
-   `$1`, `$2`: First and second arguments.
-   `$#`: Number of arguments.
-   `$@`: All arguments as a list.

**Example:**
```bash
if [ $# -lt 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi
echo "Processing file: $1"
```

---

## <a name="cron"></a>7. Cron Jobs (Scheduling)

Cron is a time-based job scheduler.

### Crontab Syntax
`* * * * * command_to_execute`
-   Minute (0-59)
-   Hour (0-23)
-   Day of Month (1-31)
-   Month (1-12)
-   Day of Week (0-6) (Sunday=0)

**Commands:**
-   `crontab -e`: Edit cron jobs.
-   `crontab -l`: List cron jobs.

**Example:**
`0 5 * * * /home/user/backup.sh` (Run at 5:00 AM every day).

---

## <a name="interview-questions"></a>8. Interview Questions

### Q1: What is `$?` in Bash?
**Answer:**
It holds the **exit status** of the last executed command. `0` usually means success, while any non-zero value indicates an error.

### Q2: How check if a directory exists in a script?
**Answer:**
Using the `-d` operator in an `if` statement.
```bash
if [ -d "/path/to/dir" ]; then
    echo "Directory exists"
fi
```

### Q3: Difference between `$@` and `$*`?
**Answer:**
Both represent all arguments.
-   `$@`: Treats each argument as a separate quoted string ("arg1", "arg2"). (Preferred).
-   `$*`: Treats all arguments as a single string ("arg1 arg2").

### Q4: How to run a script in background and keep running after logout?
**Answer:**
Use `nohup` (No Hang Up) combined with `&`.
`nohup ./script.sh &`

### Q5: What is the difference between `source script.sh` and `./script.sh`?
**Answer:**
-   `./script.sh`: Runs in a **new subshell**. Variables defined in script do not affect current shell.
-   `source script.sh`: Runs in the **current shell**. Variables are loaded into current environment.

---

## <a name="mcqs"></a>9. Multiple Choice Questions

### MCQ 1
**Which operator is used for numeric equal comparison?**
A) `==`
B) `=`
C) `-eq`
D) `-equals`

<details>
<summary>Answer</summary>
**C) `-eq`**
</details>

### MCQ 2
**How do you access the first argument of a script?**
A) `$ARG1`
B) `$1`
C) `%1`
D) `@1`

<details>
<summary>Answer</summary>
**B) `$1`**
</details>

### MCQ 3
**Which symbol redirects stdout to stderr?**
A) `2>&1`
B) `1>&2`
C) `>>`
D) `|`

<details>
<summary>Answer</summary>
**A) `2>&1`** (Redirect file descriptor 2 (stderr) to 1 (stdout)).
</details>

### MCQ 4
**What signifies a comment in Bash?**
A) `//`
B) `#`
C) `/*`
D) `--`

<details>
<summary>Answer</summary>
**B) `#`**
</details>

### MCQ 5
**Which crontab entry runs every 5 minutes?**
A) `* 5 * * *`
B) `5 * * * *`
C) `*/5 * * * *`
D) `* * * * 5`

<details>
<summary>Answer</summary>
**C) `*/5 * * * *`**
</details>

---

## <a name="challenges"></a>10. Practice Challenges

### Challenge 1: Backup Script
**Task:** Write a script that:
1.  Takes a directory path as an argument.
2.  Compresses the directory into a `.tar.gz` file with a timestamp in the name.
3.  Moves it to a `/backup` folder.

<details>
<summary>Solution</summary>

```bash
#!/bin/bash
DIR=$1
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/backup"

if [ -z "$DIR" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

tar -czf "$BACKUP_DIR/backup_$TIMESTAMP.tar.gz" "$DIR"
echo "Backup complete!"
```
</details>

### Challenge 2: Log Monitor
**Task:** Write a script that checks a log file every 10 seconds. If it finds the word "CRITICAL", it prints a warning message (simulate sending an email).

### Challenge 3: User Creator
**Task:** Write a script that reads a text file containing names (one per line) and creates a Linux user for each name. (Requires sudo).

---

## <a name="references"></a>11. References

-   [Bash Guide for Beginners](https://tldp.org/LDP/Bash-Beginners-Guide/html/)
-   Crontab Guru (for testing cron expressions)

---

## 🎯 Key Takeaways

1.  **Automate Everything:** If you do it twice, script it.
2.  **Check Exit Codes:** Always handle errors (`set -e` helps).
3.  **Quote Variables:** Always use `"$VAR"` to prevent issues with spaces.
4.  **Cron is King:** Schedule maintenance tasks using cron.
