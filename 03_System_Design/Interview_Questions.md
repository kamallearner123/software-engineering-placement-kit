# 💡 System Design Interview Questions & Answers (Expanded)

This guide contains 20+ essential System Design (HLD/LLD) questions with architectural breakdowns and code snippets for design patterns.

---

## 1. Design a URL Shortener (TinyURL)
**Answer**: Map long URLs to unique short alphanumeric keys.
**Steps**: See [HLD Case Studies](../03_System_Design/05_HLD_Case_Studies/README.md).

---

## 2. What is the CAP Theorem?
**Answer**: In distributed systems, you only get 2 out of 3: Consistency, Availability, Partition Tolerance.

---

## 3. SQL vs NoSQL
**Answer**: SQL (Structured/Relational) vs NoSQL (Flexible/Non-relational).

---

## 4. How to handle "The Thundering Herd" problem in Caching?
**Answer**: This happens when many requests hit the DB at once when a cache expires. Use locks or stale-while-revalidate.

---

## 5. Load Balancing (Horizontal Scaling)
**Answer**: Distributing traffic to multiple servers.
**Strategy (Round Robin)**:
```python
class RoundRobin:
    def __init__(self, servers):
        self.servers = servers
        self.index = 0
    def get_server(self):
        server = self.servers[self.index]
        self.index = (self.index + 1) % len(self.servers)
        return server
```

---

## 6. Real-time Messenger (WhatsApp Design)
**Answer**: Needs bi-directional communication.
**Key Technology**: WebSockets (TCP-based persistent connections) and Message Queues.

---

## 7. Database Sharding
**Answer**: Splitting a large DB into smaller, faster pieces.
**Strategy (Hash-based)**:
```python
def get_shard(user_id, total_shards):
    return hash(user_id) % total_shards
```

---

## 8. Microservices vs Monolith
**Answer**: Microservices (modular components) vs Monolith (single unit).
- **Pro Micro**: Scale independent parts easily.
- **Pro Mono**: Simpler to develop and deploy initially.

---

## 9. Shallow vs Deep Copy (LLD)
**Answer**: Shallow (copy pointers); Deep (copy actual objects).

---

## 10. Singleton Pattern (LLD)
**Answer**: Only one instance of a class.
```python
class Singleton:
    _instance = None
    def __new__(cls):
        if not cls._instance:
            cls._instance = super(Singleton, cls).__new__(cls)
        return cls._instance
```

---

## 11. Observer Pattern (LLD)
**Answer**: One-to-Many dependency. When one object changes state, all its dependents are notified.

---

## 12. Factory Pattern (LLD)
**Answer**: Define an interface for creating an object, but let subclasses decide which class to instantiate.

---

## 13. SOLID Principles (LLD)
**Answer**:
- **S**ingle Responsibility: A class should have one reason to change.
- **O**pen/Closed: Open for extension, closed for modification.
- **L**iskov Substitution: Subtypes must be substitutable for their base types.
- **I**nterface Segregation: Don't force clients to depend on methods they don't use.
- **D**ependency Inversion: Depend on abstractions, not concretions.

---

## 14. Rate Limiter (Design)
**Answer**: Use the **Token Bucket** algorithm.

```python
import time
class RateLimiter:
    def __init__(self, capacity, rate):
        self.capacity, self.rate = capacity, rate
        self.tokens = capacity
        self.last_time = time.time()
    def allow(self):
        now = time.time()
        self.tokens += (now - self.last_time) * self.rate
        self.tokens = min(self.tokens, self.capacity)
        self.last_time = now
        if self.tokens >= 1:
            self.tokens -= 1
            return True
        return False
```

---

## 15. Notification System (Design)
**Answer**: Decouple publishers and subscribers using a Message Queue (Kafka/ActiveMQ).

---

## 16. Consistency vs Latency
**Answer**: Higher consistency (more nodes must agree) leads to higher latency.

---

## 17. Search Engine (Design basics)
**Answer**: Crawlers -> Indexer -> Inverted Index -> Query Processor.

---

## 18. Message Queues (Kafka)
**Answer**: Buffer between producer and consumer. Provides isolation and persistence.

---

## 19. Shallow Copy vs Deep Copy in C++
**Answer**: Need to write a custom Copy Constructor and Assignment Operator.

---

## 20. Dependency Injection (LLD)
**Answer**: Pass dependencies (objects) through constructor or method instead of creating them inside.

---

## 🎓 Summary of Design Patterns (LLD)

| Pattern | Type | Use Case |
| :--- | :--- | :--- |
| **Singleton** | Creational | Single DB connection, Logger. |
| **Observer** | Behavioral | Subscribing to event feeds. |
| **Strategy** | Behavioral | Swapping sorting algorithms at runtime. |
| **Adapter** | Structural | Connecting two incompatible interfaces. |
| **Builder** | Creational | Building complex objects like a Pizza order. |
