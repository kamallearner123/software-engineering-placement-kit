# System Design Basics: Complete Guide

> **Module:** System Design & DevOps
> **Topic:** Scalability, Availability, and Distributed Systems
> **Duration:** 1.5 hours

## 📚 Table of Contents

1. [Introduction to System Design](#introduction)
2. [Scalability](#scalability)
3. [Availability & Reliability](#availability)
4. [Load Balancing](#load-balancing)
5. [Caching](#caching)
6. [CAP Theorem](#cap-theorem)
7. [Case Study: URL Shortener](#case-study)
8. [Interview Questions](#interview-questions)
9. [Multiple Choice Questions](#mcqs)
10. [Practice Challenges](#challenges)
11. [References](#references)

---

## <a name="introduction"></a>1. Introduction to System Design

System Design is the process of defining the architecture, components, modules, interfaces, and data for a system to satisfy specified requirements.

### Why is it important?
-   **Scale:** Handling millions of users.
-   **Reliability:** Ensuring system is always up.
-   **Efficiency:** Optimizing resources and cost.
-   **Interview:** Critical for senior/architect roles and SDE-2+.

---

## <a name="scalability"></a>2. Scalability

### Vertical Scalability (Scaling Up)
-   Adding more power (CPU, RAM) to an existing server.
-   **Pros:** Simple, no code changes.
-   **Cons:** Hard limit (ceiling), single point of failure.

### Horizontal Scalability (Scaling Out)
-   Adding more machines to the resource pool.
-   **Pros:** Infinite scale, redundancy (no single point of failure).
-   **Cons:** Complex (requires load balancing, distributed data).

| Feature | Vertical | Horizontal |
| :--- | :--- | :--- |
| **Cost** | Exponential | Linear |
| **Complexity** | Low | High |
| **Limit** | Hardware capacity | Virtually unlimited |

---

## <a name="availability"></a>3. Availability & Reliability

### Availability
The percentage of time a system is operational.
-   **99.9% (Three Nines):** ~8.7 hours downtime/year.
-   **99.99% (Four Nines):** ~52 minutes downtime/year.
-   **99.999% (Five Nines):** ~5 minutes downtime/year. (Gold Standard)

### Reliability
The probability that a system performs correctly during a specific time.

### Redundancy
Duplicating critical components/functions to increase reliability.
-   **Active-Passive:** One active, one on standby.
-   **Active-Active:** Both active, handling traffic.

---

## <a name="load-balancing"></a>4. Load Balancing

A Load Balancer (LB) distributes incoming network traffic across multiple servers.

### Algorithms
1.  **Round Robin:** Sequential request distribution.
2.  **Least Connections:** Sends traffic to the server with fewest active connections.
3.  **IP Hash:** Directs traffic based on client IP (for session stickiness).
4.  **Weighted Round Robin:** Assigns more traffic to powerful servers.

### Types
-   **Hardware LB:** F5, Citrix (expensive).
-   **Software LB:** Nginx, HAProxy (open source).
-   **Cloud LB:** AWS ELB, Google Cloud Load Balancing.

---

## <a name="caching"></a>5. Caching

Caching stores copies of frequently accessed data in faster storage (RAM) to reduce latency and database load.

### Caching Layers
-   **Browser Cache:** Client-side.
-   **CDN (Content Delivery Network):** Caches static assets (images, CSS) close to user (e.g., Cloudflare, Akamai).
-   **Server Cache:** Redis/Memcached. Stores DB query results.

### Cache Eviction Policies
-   **LRU (Least Recently Used):** Discards least recently used items first (most common).
-   **LFU (Least Frequently Used):** Discards least often used items.
-   **FIFO (First In First Out):** Discards oldest items.

---

## <a name="cap-theorem"></a>6. CAP Theorem

In a distributed system, you can only pick **two** out of three:

1.  **Consistency (C):** Every read receives the most recent write or an error.
2.  **Availability (A):** Every request receives a (non-error) response, without the guarantee that it contains the most recent write.
3.  **Partition Tolerance (P):** The system continues to operate despite an arbitrary number of messages being dropped/delayed by the network.

> **Note:** Since network partitions (P) are inevitable in distributed systems, you must choose between **CP** (Consistency over Availability) and **AP** (Availability over Consistency).

-   **CP Systems:** MongoDB, HBase (Banking systems - accuracy > uptime).
-   **AP Systems:** Cassandra, DynamoDB (Social media - uptime > instant consistency).

---

## <a name="case-study"></a>7. Case Study: Design a URL Shortener (TinyURL)

### Requirements
-   **Functional:**
    -   Given long URL -> return unique short URL.
    -   Clicking short URL -> redirect to long URL.
-   **Non-Functional:**
    -   Highly available (redirects must work).
    -   Low latency.
    -   Write-heavy (creation) and Read-heavy (redirection).

### Capacity Estimation
-   100M new URLs/month.
-   100:1 Read:Write ratio.
-   Storage: 500 bytes per URL -> ~6TB/year.

### Data Model
-   **Table:** `URL_Mapping`
    -   `id` (PK)
    -   `short_code` (unique index)
    -   `long_url`
    -   `created_at`

### Hashing Algorithm (Base62)
-   Characters: `[a-z, A-Z, 0-9]` = 26 + 26 + 10 = 62.
-   A 7-character string: 62^7 = ~3.5 Trillion combinations (Enough!).
-   Approach: Convert DB Auto-Increment ID to Base62 string.

### Design Architecture
1.  **Client** sends `long_url`.
2.  **App Server** works.
3.  **Database** generates unique ID.
4.  **App Server** converts ID to Base62 `short_code`.
5.  **App Server** saves `short_code` (optional if deriving from ID).
6.  **Cache (Redis)** stores `short_code` -> `long_url` for fast redirection.

---

## <a name="interview-questions"></a>8. Interview Questions

### Q1: Vertical vs Horizontal scaling?
**Answer:**
Vertical (Scaling Up) takes place on a single machine (more RAM/CPU). Simple but has a ceiling. Horizontal (Scaling Out) involves adding more machines. It provides infinite scale and redundancy but adds complexity (load balancing, data partitioning).

### Q2: What is a Load Balancer?
**Answer:**
A device or software that distributes network traffic across a cluster of servers to ensure no single server is overwhelmed. It increases availability and reliability. Algorithms include Round Robin, Least Connections, etc.

### Q3: Explain CAP Theorem.
**Answer:**
It states that a distributed system cannot simultaneously guarantee Consistency, Availability, and Partition Tolerance. Since Partition Tolerance is required over unreliable networks, we must choose between Consistency (CP) and Availability (AP).

### Q4: Why use a CDNs?
**Answer:**
A CDN (Content Delivery Network) caches static content (images, videos, CSS) in geographically distributed servers. It reduces latency by serving user requests from the nearest edge server and reduces load on the primary origin server.

### Q5: What is Sharding?
**Answer:**
Sharding is a database architecture pattern related to horizontal partitioning. It splits a large dataset into smaller chunks (shards) stored across multiple database nodes. Each shard holds a unique subset of data.

---

## <a name="mcqs"></a>9. Multiple Choice Questions

### MCQ 1
**Which scaling method involves adding more RAM to a server?**
A) Horizontal
B) Vertical
C) Diagonal
D) Distributed

<details>
<summary>Answer</summary>
**B) Vertical**
</details>

### MCQ 2
**In the CAP theorem, what does 'P' stand for?**
A) Performance
B) Partition Tolerance
C) Persistence
D) Protocol

<details>
<summary>Answer</summary>
**B) Partition Tolerance**
</details>

### MCQ 3
**Which algorithm distributes traffic sequentially?**
A) Least Connections
B) IP Hash
C) Round Robin
D) Weighted Random

<details>
<summary>Answer</summary>
**C) Round Robin**
</details>

### MCQ 4
**Which is an AP system?**
A) RDBMS (MySQL)
B) Cassandra
C) MongoDB
D) Redis (Single Node)

<details>
<summary>Answer</summary>
**B) Cassandra** (Prioritizes availability and partition tolerance).
</details>

### MCQ 5
**What is the status code for a permanent redirect?**
A) 200
B) 301
C) 302
D) 404

<details>
<summary>Answer</summary>
**B) 301** (302 is temporary redirect).
</details>

---

## <a name="challenges"></a>10. Practice Challenges

### Challenge 1: Capacity Planning
**Difficulty:** Medium
A system receives 10,000 requests per second. Each request requires 50ms processing time. How many concurrent threads/servers do you need to handle this load?

<details>
<summary>Solution</summary>
Total Time = 1 second (1000ms).
Each thread handles: 1000ms / 50ms = 20 requests/sec.
Required threads: 10,000 / 20 = 500 threads.
</details>

### Challenge 2: Designing a Cache
**Difficulty:** Hard
Design an in-memory LRU Cache with `get` and `put` methods.
Hint: Use a Hash Map + Doubly Linked List.

### Challenge 3: Base62 Conversion
**Difficulty:** Medium
Write a code snippet (pseudocode or Python) to convert a decimal number to Base62.
`0-9`, `a-z`, `A-Z`.

<details>
<summary>Solution</summary>

```python
def to_base62(num):
    chars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    if num == 0: return "0"
    res = []
    while num > 0:
        res.append(chars[num % 62])
        num //= 62
    return "".join(reversed(res))
```
</details>

---

## <a name="references"></a>11. References

-   **"Designing Data-Intensive Applications"** by Martin Kleppmann (The Bible of System Design)
-   **"System Design Interview"** by Alex Xu
-   [High Scalability Blog](http://highscalability.com/)

---

## 🎯 Key Takeaways

1.  **Trade-offs:** There is no perfect design. Always a trade-off (e.g., Consistency vs Availability).
2.  **Scalability:** Prefer horizontal scaling for large distributed systems.
3.  **Redundancy:** Eliminate single points of failure.
4.  **Simplicity:** Simple designs are easier to scale and maintain.
