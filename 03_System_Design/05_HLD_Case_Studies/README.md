# 🏗️ High-Level Design (HLD) Case Studies

System Design interviews test your ability to design scalable, reliable, and maintainable software systems.

## 📐 The Standard HLD Roadmap

When asked to "Design X", follow these steps:
1.  **Requirement Clarification**: Functional (What it does) vs. Non-Functional (Scalability, Availability).
2.  **Back-of-the-envelope estimation**: Traffic volume, Storage requirements.
3.  **API Design**: Define the core endpoints (e.g., `POST /shorten`).
4.  **Database Schema**: SQL (Relational) vs NoSQL (Scalability).
5.  **High-Level Architecture**: Web Servers -> Load Balancers -> Caching -> Database.
6.  **Deep Dive**: Partitioning, Replication, Security.

---

## 📘 Case Study 1: URL Shortener (TinyURL)

### 10-Second Architecture:
- **Hashing**: Use Base-62 encoding (a-z, A-Z, 0-9) to convert a numeric ID into a short string.
- **Database**: NoSQL (like MongoDB or Cassandra) for fast read/write and scaling.
- **Caching**: Redis or Memcached to store "hot" (frequently accessed) URLs.

---

## 📘 Case Study 2: API Rate Limiter

### 10-Second Architecture:
- **Algorithm**: Token Bucket or Leaky Bucket.
- **Storage**: In-memory (Redis) to track the number of requests per user in real-time.
- **Fail-open vs. Fail-closed**: Decision on what happens if the rate limiter itself fails.

---

## 🌟 Key Terminology for HLD

| Term | Meaning |
| :--- | :--- |
| **Load Balancer** | Distributes incoming traffic across multiple servers. |
| **DNS** | Translates domain names into IP addresses. |
| **Caching** | Temporary storage for fast data retrieval. |
| **Sharding** | Splitting a large database into smaller, faster pieces. |
| **Microservices** | Architecture where apps are built as a collection of services. |

---

## 🔗 Learning Resources
- [System Design Primer (GitHub)](https://github.com/donnemartin/system-design-primer)
- [ByteByteGo (Visual Guides)](https://bytebytego.com/)
