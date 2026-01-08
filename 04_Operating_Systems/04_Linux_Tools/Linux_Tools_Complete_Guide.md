# Linux Tools: Complete Guide

> **Module:** Operating Systems & Linux
> **Topic:** Debugging, Networking, and Security Tools
> **Duration:** 2 hours

## 📚 Table of Contents

1. [Network Analysis Tools](#network)
2. [Processing & Debugging Tools](#debugging)
3. [Security Tools](#security)
4. [File & Disk Tools](#disk)
5. [Interview Questions](#interview-questions)
6. [Multiple Choice Questions](#mcqs)
7. [Practice Challenges](#challenges)
8. [References](#references)

---

## <a name="network"></a>1. Network Analysis Tools

### `Wireshark`
A GUI-based network protocol analyzer.
-   **Use Case:** Deep inspection of packets. Analyzing HTTP headers, TCP handshakes.
-   **Key Feature:** Filtering (e.g., `ip.addr == 192.168.1.1`).

### `tcpdump`
Command-line packet analyzer.
-   **Use Case:** Capturing traffic on headless servers.
-   **Command:** `tcpdump -i eth0 port 80` (Capture web traffic).

### `netstat` (Network Statistics)
Print network connections, routing tables, interface statistics.
-   **Command:** `netstat -tuln` (Show listening ports).
-   **Replacement:** `ss` (Socket Statistics) is faster. `ss -tuln`.

### `curl` & `wget`
-   **curl:** Transfer data. Great for API testing. `curl -v http://example.com`.
-   **wget:** Download files recursively. `wget -r http://example.com`.

---

## <a name="debugging"></a>2. Processing & Debugging Tools

### `strace` (System Call Trace)
Intercepts and records system calls made by a process.
-   **Use Case:** Debugging why a program cannot open a file or crashes.
-   **Command:** `strace ./program` or `strace -p <pid>`.

### `lsof` (List Open Files)
Lists information about files opened by processes. In Linux, everything is a file (sockets, pipes, disks).
-   **Command:** `lsof -i :80` (Who is using port 80?).
-   **Command:** `lsof /var/log/syslog` (Who has this file open?).

### `dmesg`
Prints the message buffer of the kernel.
-   **Use Case:** diagnosing hardware issues, driver failures, or OOM (Out of Memory) kills.
-   **Command:** `dmesg | grep usb` (Check USB device events).

### `ptrace`
A system call that provides a means for a "tracer" process to observe and control the execution of another process. Used by debuggers like `gdb` and tools like `strace`.

---

## <a name="security"></a>3. Security Tools

### `nmap` (Network Mapper)
Used for network discovery and security auditing.
-   **Scan:** `nmap 192.168.1.1` (Scan ports).
-   **OS Detect:** `nmap -O 192.168.1.1` (Guess Operating System).
-   **Use Case:** Finding open ports/vulnerabilities on a server.

### `openssl`
Toolkit for SSL/TLS.
-   **Use Case:** Generate certificates, check hashes.
-   **Command:** `openssl md5 file.txt` (Calculate MD5 checksum).

---

## <a name="disk"></a>4. File & Disk Tools

### `du` & `df`
-   `df -h`: Disk Free. Space available on mounts.
-   `du -sh *`: Disk Usage. Size of files/folders.

### `mount` & `umount`
-   Attach/Detach filesystems (USBs, disks).

---

## <a name="interview-questions"></a>5. Interview Questions

### Q1: How do you find which process is listening on port 8080?
**Answer:**
Using `netstat`, `ss`, or `lsof`.
-   `netstat -tulnp | grep 8080`
-   `lsof -i :8080`

### Q2: A process is crashing silently. How do you investigate?
**Answer:**
1.  Check exit code (`echo $?`).
2.  Check logs (`/var/log/syslog`).
3.  Run with `strace` to see the last system call before crash.
4.  Check `dmesg` for OOM kills or segfaults.

### Q3: What is the difference between `tcpdump` and `Wireshark`?
**Answer:**
-   `tcpdump`: CLI tool. Good for capturing raw packets on remote servers. Hard to read.
-   `Wireshark`: GUI tool. Excellent for visualizing and filtering the captured packets (pcap files).
Wait workflow: Capture with tcpdump -> Analyze with Wireshark.

### Q4: How do you debug a high CPU usage issue?
**Answer:**
1.  Run `top` or `htop` to identify the process.
2.  Identify if it's User Space (application) or Kernel Space (drivers/I/O).
3.  Use specialized tools like `perf` or connect a debugger (`gdb`) if needed.

### Q5: What does `strace` do?
**Answer:**
It traces system calls and signals. It shows every interaction between the process and the Linux Kernel (file opens, network connections, memory allocation).

---

## <a name="mcqs"></a>6. Multiple Choice Questions

### MCQ 1
**Which tool is used for port scanning?**
A) `ping`
B) `nmap`
C) `wget`
D) `htop`

<details>
<summary>Answer</summary>
**B) `nmap`**
</details>

### MCQ 2
**Which command lists open files?**
A) `lsof`
B) `ls -open`
C) `openfiles`
D) `files`

<details>
<summary>Answer</summary>
**A) `lsof`**
</details>

### MCQ 3
**Where are kernel messages stored?**
A) `dmesg`
B) `kmsg`
C) `syslog`
D) All of the above

<details>
<summary>Answer</summary>
**D) All of the above** (dmesg reads the ring buffer, which often logs to syslog/kmsg).
</details>

### MCQ 4
**Which tool creates a `.pcap` file?**
A) `mkpcap`
B) `tcpdump`
C) `netcap`
D) `curl`

<details>
<summary>Answer</summary>
**B) `tcpdump`**
</details>

### MCQ 5
**Which command shows listening ports?**
A) `netstat -tuln`
B) `ports -show`
C) `ping -listen`
D) `ls -ports`

<details>
<summary>Answer</summary>
**A) `netstat -tuln`**
</details>

---

## <a name="challenges"></a>7. Practice Challenges

### Challenge 1: Find the Intruder
**Task:** Use `lsof` to find all network connections established by the user "root".
**Command:** `lsof -u root -i`

### Challenge 2: Network Spy
**Task:** Use `tcpdump` to capture 10 packets related to HTTP (Port 80) and save them to `capture.pcap`.
**Command:** `tcpdump -c 10 -i eth0 port 80 -w capture.pcap`

### Challenge 3: Why did it fail?
**Task:** Run `ls /root` (as a normal user) using `strace` and find the specific error code returned by the system call.
**Command:** `strace ls /root` -> Look for `openat` returning `-1 EACCES (Permission denied)`.

---

## <a name="references"></a>8. References

-   **"Linux Command Line and Shell Scripting Bible"** by Richard Blum.
-   Julia Evans (Wizard Zines) on Linux Tools.

---

## 🎯 Key Takeaways

1.  **Observability:** Tools like `htop`, `lsof`, `netstat` give you eyes into the system.
2.  **Kernel Interaction:** `strace` and `dmesg` show what the kernel is doing.
3.  **Network Knowledge:** Understanding `tcpdump` and `nmap` is crucial for troubleshooting connectivity and security.
