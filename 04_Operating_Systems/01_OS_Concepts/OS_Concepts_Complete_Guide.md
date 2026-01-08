# OS Concepts: Complete Guide

> **Module:** Operating Systems & Linux
> **Topic:** Process Management, Memory Management, and Concurrency
> **Duration:** 2 hours

## 📚 Table of Contents

1. [What is an Operating System?](#intro)
2. [Process vs Thread](#process-thread)
3. [Process Scheduling](#scheduling)
4. [Deadlocks](#deadlocks)
5. [Memory Management](#memory)
6. [Inter-Process Communication (IPC)](#ipc)
7. [Interview Questions](#interview-questions)
8. [Multiple Choice Questions](#mcqs)
9. [Practice Challenges](#challenges)
10. [References](#references)

---

## <a name="intro"></a>1. What is an Operating System?

An **Operating System (OS)** is system software that manages computer hardware and software resources and provides common services for computer programs.

### Core Functions
-   **Process Management:** CPU scheduling.
-   **Memory Management:** RAM allocation.
-   **File System Management:** Storage organization.
-   **Device Management:** I/O control.
-   **Security:** User authentication.

### Kernel Types
-   **Monolithic:** All services run in kernel space (e.g., Linux, Unix). Fast but crash in one part crashes whole system.
-   **Microkernel:** Minimal services in kernel, rest in user space (e.g., Minix, QNX). More stable but slower (message passing).

---

## <a name="process-thread"></a>2. Process vs Thread

### Process
A program in execution. It includes the program code, current activity (PC), stack, data section, and heap.
-   **Heavyweight:** Separate memory space.
-   **Context Switch:** Slow.
-   **Isolation:** High (Crash in one doesn't affect others).

### Thread
A basic unit of CPU utilization within a process. Shares code, data, and OS resources with other threads of same process.
-   **Lightweight:** Shared memory space.
-   **Context Switch:** Fast.
-   **Isolation:** Low (One thread crash can kill process).

> **Analogy:** A Process is a house. Threads are people living in it.

---

## <a name="scheduling"></a>3. Process Scheduling

Deciding which process runs on the CPU at a given time.

### Key Algorithms

1.  **FCFS (First Come First Serve):** Non-preemptive. Simple queue. Problem: Convoy effect (short process stuck behind long one).
2.  **SJF (Shortest Job First):** Optimal waiting time. Problem: Hard to predict future CPU burst.
3.  **Round Robin (RR):** Preemptive. Each process gets a fixed time slice (quantum). Good for time-sharing systems.
4.  **Priority Scheduling:** Highest priority runs first. Problem: Starvation (low priority never runs). Solution: Aging.

---

## <a name="deadlocks"></a>4. Deadlocks

A situation where a set of processes are blocked because each process is holding a resource and waiting for another resource acquired by some other process.

### 4 Necessary Conditions (Coffman Conditions)
1.  **Mutual Exclusion:** Only one process can use resource at a time.
2.  **Hold and Wait:** Process holding at least one resource is waiting for others.
3.  **No Preemption:** Resource cannot be taken away forcibly.
4.  **Circular Wait:** P1 waits for P2, P2 waits for P3... Pn waits for P1.

### Handling Deadlocks
-   **Prevention:** Break one of the 4 conditions.
-   **Avoidance:** Banker's Algorithm (check safe state before allocation).
-   **Detection & Recovery:** Check for cycles and kill processes.
-   **Ignorance (Ostrich Algorithm):** Pretend it never happens (Used by Unix/Windows).

---

## <a name="memory"></a>5. Memory Management

### Virtual Memory
Use of disk space as an extension of RAM. Allows running programs larger than physical memory.

### Paging
-   Divide physical memory into fixed-size blocks (**Frames**).
-   Divide logical memory into blocks of same size (**Pages**).
-   **Page Table:** Maps Pages to Frames.

### Swapping
Moving processes between main memory and backing store (disk) to free up RAM.

### Thrashing
When the OS spends more time swapping pages in/out than executing code. Occurs when RAM is full.

---

## <a name="ipc"></a>6. Inter-Process Communication (IPC)

Mechanisms for processes to exchange data.

1.  **Pipes:** Unidirectional data channel (e.g., `ls | grep`).
2.  **Message Queues:** Linked list of messages stored in kernel.
3.  **Shared Memory:** Fastest IPC. Processes map same memory region. Needs synchronization (Semaphores/Mutex).
4.  **Sockets:** Communication over network (or local domain).
5.  **Signals:** Asynchronous notifications (e.g., SIGINT, SIGKILL).

---

## <a name="interview-questions"></a>7. Interview Questions

### Q1: Difference between Mutex and Semaphore?
**Answer:**
-   **Mutex (Lock):** Ownership model. Only the thread that locked it can unlock it. Used for mutual exclusion. (Key to a toilet).
-   **Semaphore:** Signaling mechanism. Can be signaled by any thread. Used for limiting access to N resources. (Number of keys).

### Q2: What is a Context Switch?
**Answer:**
The process of saving the state (registers, PC, stack) of the currently running process and restoring the state of the next process to run. It involves overhead (CPU idle time).

### Q3: What is a Zombie Process?
**Answer:**
A process that has finished execution but still has an entry in the process table. It happens when child exits but parent hasn't read its exit status (via `wait()`).

### Q4: What is Fragmentation?
**Answer:**
-   **Internal:** Allocated memory is slightly larger than requested. Wasted space inside block.
-   **External:** Total free memory is enough but is not contiguous.

### Q5: Explain `malloc()` vs `calloc()`.
**Answer:**
-   `malloc(size)`: Allocates uninitialized memory block.
-   `calloc(n, size)`: Allocates block for array of n elements and initializes them to zero.

---

## <a name="mcqs"></a>8. Multiple Choice Questions

### MCQ 1
**Which component performs the Context Switching?**
A) Compiler
B) Dispatcher
C) Loader
D) Linker

<details>
<summary>Answer</summary>
**B) Dispatcher**
</details>

### MCQ 2
**Which scheduling algorithm suffers from Starvation?**
A) Round Robin
B) FCFS
C) Priority Scheduling
D) FIFO

<details>
<summary>Answer</summary>
**C) Priority Scheduling** (Low priority jobs may wait forever).
</details>

### MCQ 3
**Banker's Algorithm is used for?**
A) Deadlock Prevention
B) Deadlock Avoidance
C) Deadlock Detection
D) Deadlock Recovery

<details>
<summary>Answer</summary>
**B) Deadlock Avoidance**
</details>

### MCQ 4
**Which IPC mechanism is generally fastest?**
A) Pipes
B) Message Queues
C) Shared Memory
D) Sockets

<details>
<summary>Answer</summary>
**C) Shared Memory** (No copying of data between kernel and user space).
</details>

### MCQ 5
**The address generated by CPU is known as?**
A) Physical Address
B) Logical Address
C) Actual Address
D) None

<details>
<summary>Answer</summary>
**B) Logical Address** (Mapped to Physical by MMU).
</details>

---

## <a name="challenges"></a>9. Practice Challenges

### Challenge 1: Dining Philosophers Problem
**Topic:** Concurrency
Explain the Dining Philosophers problem and proposing a solution (e.g., Resource Hierarchy Solution - always pick up lower numbered fork first).

### Challenge 2: Simulate Scheduling
**Scenario:**
-   P1: Burst 10
-   P2: Burst 4
-   P3: Burst 2
**Task:** Calculate implementation order and Wait Time for FCFS vs SJF.

<details>
<summary>Solution</summary>
**FCFS:**
-   Wait: P1=0, P2=10, P3=14. Avg = (0+10+14)/3 = 8.
**SJF (Order P3, P2, P1):**
-   Wait: P3=0, P2=2, P1=6. Avg = (0+2+6)/3 = 2.66 (Better!)
</details>

---

## <a name="references"></a>10. References

-   **"Operating System Concepts"** (Dinosaur Book) by Silberschatz, Galvin, Gagne.
-   **"Modern Operating Systems"** by Andrew S. Tanenbaum.

---

## 🎯 Key Takeaways

1.  **Concurrency is hard:** Race conditions and deadlocks are common bugs.
2.  **OS manages resources:** CPU (scheduler), RAM (paging), I/O.
3.  **Kernel vs User:** Understand the boundary for security and stability.
