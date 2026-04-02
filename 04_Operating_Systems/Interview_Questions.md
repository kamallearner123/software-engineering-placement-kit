# 💡 Operating Systems (OS) Interview Questions & Answers (Expanded)

Core OS and Linux interview questions (20+ total) covering resource management and system-level concepts.

---

## 1. Process vs Thread
**Answer**: Process (independent); Thread (shared memory within a process).

---

## 2. What is a Deadlock and the 4 Coffman conditions?
**Answer**: See OS module for details.

---

## 3. Virtual Memory and Paging
**Answer**: Allows execution of processes not entirely in RAM. Use a Page Table for translation.

---

## 4. Zombie vs Orphan Process
**Answer**: Zombie (terminated but still in process table); Orphan (parent terminated, child still running).

---

## 5. What is a Race Condition?
**Answer**: Occurs when multiple threads access and modify shared data simultaneously, leading to unpredictable results.

```python
import threading
counter = 0
def increment():
    global counter
    for _ in range(100000):
        counter += 1
# Two threads incrementing 'counter' simultaneously leads to a race condition.
```

---

## 6. Semaphores vs Mutexes
**Answer**: Mutex (locking for one thread); Semaphore (signaling/counting for multiple).

```python
# Mutex Example
lock = threading.Lock()
def safe_increment():
    global counter
    with lock: # Mutex-like lock
        counter += 1
```

---

## 7. What is Thrashing?
**Answer**: Frequent paging in and out due to excessive processes, leading to high CPU disk-wait and zero actual work.

---

## 8. User Mode vs Kernel Mode
**Answer**: User Mode (limited privileges, where applications run); Kernel Mode (full hardware access).

---

## 9. Context Switching
**Answer**: OS saving the current CPU state (registers, program counter) and loading the state of the next process.

---

## 10. Synchronous vs Asynchronous I/O
**Answer**: Synchronous (thread waits for I/O to finish); Asynchronous (thread continues and is notified later).

---

## 11. Paging vs Segmentation
**Answer**: Paging (fixed-size blocks); Segmentation (logical blocks based on components like code/stack/heap).

---

## 12. Thread-safe Code
**Answer**: Code that can be called by multiple threads simultaneously without race conditions or corruption.

---

## 13. CPU Scheduling Algorithms
**Answer**:
- **First Come First Serve (FCFS)**.
- **Round Robin (RR)**: Time-sliced.
- **Shortest Job First (SJF)**.

---

## 14. System Calls
**Answer**: Interface between user applications and the OS kernel.
- `fork()`: Create a child process.
- `exec()`: Replace a process's memory with a new program.
- `wait()`: Wait for a child to terminate.

---

## 15. Memory Management (Stack vs Heap)
**Answer**:
- **Stack**: Automatic allocation (LIFO), fixed size, for local variables and function calls.
- **Heap**: Manual allocation (`malloc`/`new`), dynamic size, for objects and large data.

---

## 16. Interrupts vs Polling
**Answer**:
- **Interrupts**: CPU is notified by hardware when something needs attention.
- **Polling**: CPU continuously checks if a device is ready (wastes cycles).

---

## 17. RAID 0, 1, and 5
**Answer**:
- **RAID 0**: Striping (Fast, no redundancy).
- **RAID 1**: Mirroring (Redundancy).
- **RAID 5**: Parity (Balance of speed and safety).

---

## 18. Banker's Algorithm
**Answer**: A Deadlock Avoidance algorithm that tests for safety by simulating the allocation of resources.

---

## 19. Virtual Memory vs Physical Memory
**Answer**:
- **Physical**: Actual RAM hardware.
- **Virtual**: Address space used by a process (stored on disk if needed).

---

## 20. Monolithic vs Microkernel
**Answer**:
- **Monolithic**: Entire OS runs in Kernel space (Faster).
- **Microkernel**: Minimal OS in Kernel space; services in User space (More stable and secure).

---

## 🎓 Summary Table: CPU Scheduling

| Algorithm | Preemptive | Complexity | Optimal for |
| :--- | :--- | :--- | :--- |
| **FCFS** | No | O(1) | Simple apps. |
| **SJF** | No | O(n log n) | Minimizing wait time. |
| **Round Robin** | Yes | O(1) | Time-sharing systems. |
| **Priority** | Both | O(n) | Real-time processes. |
