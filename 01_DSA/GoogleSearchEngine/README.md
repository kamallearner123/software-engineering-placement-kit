# 🔍 How Google Search Works in Milliseconds

> "You type a query, millions of results appear in less than a second. How?"

This module breaks down the complexity of a global search engine into fundamental **Data Structures and Algorithms (DSA)** and **System Design** concepts.

---

## 🗺️ Learning Path: The Layered Approach

We don't build a search engine in one go. We evolve it layer by layer, solving one bottleneck at a time.

```mermaid
graph TD
    A[Start: User Query] --> B{Layer 1: Lookup}
    B -->|Naive| C[Linear Scan - O(N)]
    B -->|Optimized| D[Inverted Index - HashMap]
    
    D --> E{Layer 2: Experience}
    E -->|Suggestions| F[Trie - Prefix Search]
    
    F --> G{Layer 3: Quality}
    G -->|Importance| H[PageRank - Graphs]
    G -->|Top Results| I[Heaps - Priority Queues]
    
    I --> J{Layer 4: Scale}
    J -->|Billions of Docs| K[Distributed Systems]
    K --> L[Caching & Load Balancing]
    L --> M[Modern Google Search]
    
    style C fill:#f96,stroke:#333
    style D fill:#9f9,stroke:#333
    style F fill:#9f9,stroke:#333
    style H fill:#9f9,stroke:#333
    style I fill:#9f9,stroke:#333
    style K fill:#9f9,stroke:#333
```

---

## 📚 Table of Contents

| Step | Topic | Key DSA / Concept | Description |
| :--- | :--- | :--- | :--- |
| 1️⃣ | [**Indexing**](./01_indexing.md) | **Inverted Index (HashMap)** | Moving from "Search Document" to "Search Word". |
| 2️⃣ | [**Autocomplete**](./02_trie_autocomplete.md) | **Trie (Prefix Tree)** | How Google predicts what you are typing. |
| 3️⃣ | [**Ranking**](./03_ranking_heap.md) | **Heap (Priority Queue)** | Picking the Top-K most relevant results instantly. |
| 4️⃣ | [**The Web Graph**](./04_graph_pagerank.md) | **Directed Graphs** | Understanding importance through links (PageRank). |
| 5️⃣ | [**Scaling Up**](./05_system_design.md) | **System Design** | Distributed indexing, Sharding, and Caching. |

---

## 💻 Practical Implementation

Inside the `src/` folder, you will find a **Mini-Google Search Engine** implementation that combines these concepts.

- [**Run the Mini-Search Engine**](./src/mini_search.py)
- **Features:** 
    - Build Inverted Index from text files.
    - Autocomplete suggestions using Trie.
    - Result ranking based on frequency.

---

## 💡 Real-Time Example: "Rust Tutorial"

1. **User Types "ru"**: The **Trie** suggests "rust tutorial", "rust programming".
2. **User Presses Enter**: The **HashMap (Inverted Index)** finds all 2,000,000 pages containing "rust" and "tutorial".
3. **Filtering**: The engine intersects these lists to find pages containing **both**.
4. **Ranking**: A **Min-Heap** is used to keep track of the top 10 pages with the highest **PageRank** (importance) and relevance.
5. **Delivery**: The results are fetched from a **Cache** if the search is common, or from a **Distributed Index** across thousands of servers.

---

## 🎓 For Instructors: The Hook
When teaching this, start with the **Naive Approach**. Ask students to search for a word in a 1,000-page book. They will realize they need an **Index** at the back of the book. That is the **Inverted Index**. 

Now ask: "What if there are 1,000,000,000 books?" 
**Welcome to System Design.**
