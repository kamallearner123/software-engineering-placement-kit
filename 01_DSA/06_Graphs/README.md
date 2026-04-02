# 🕸️ Graphs

Graphs are a collection of nodes (vertices) and the connections between them (edges). Many real-world problems can be modeled using graphs, like social networks and navigation systems.

## 🎓 Core Concepts

### 1. Representation
- **Adjacency Matrix**: A 2D array where `matrix[i][j]` = 1 if an edge exists from `i` to `j`.
- **Adjacency List**: An array of lists where each element is a list of neighbors for a node.

### 2. Traversals
- **BFS (Breadth-First Search)**: Uses a Queue. Explores neighbors level-by-level. Shortest path in unweighted graphs.
- **DFS (Depth-First Search)**: Uses a Stack (or recursion). Explores deep into one branch before backtracking.

### 3. Key Algorithms
- **Dijkstra's Algorithm**: Shortest path in weighted graphs.
- **Topological Sort**: Ordering nodes based on dependencies (DAGs only).
- **Cycle Detection**: Using Union-Find or DFS color markers.
- **Kruskal's & Prim's**: Minimum Spanning Tree (MST).

---

## 🏆 Top 10 Interview Problems

1.  **Clone Graph**.
2.  **Course Schedule (Detect Cycle in Directed Graph)**.
3.  **Number of Islands**.
4.  **Word Ladder**.
5.  **Rotting Oranges**.
6.  **Topological Sort**.
7.  **Alien Dictionary**.
8.  **Dijkstra's Shortest Path**.
9.  **Bipartite Graph Check**.
10. **Reconstruct Itinerary**.

---

## 💻 Sample Code (BFS in Python)

```python
from collections import deque

def bfs(graph, start_node):
    visited = set()
    queue = deque([start_node])
    visited.add(start_node)
    
    while queue:
        node = queue.popleft()
        print(node, end=" ")
        
        for neighbor in graph[node]:
            if neighbor not in visited:
                visited.add(neighbor)
                queue.append(neighbor)

# Usage
adj_list = {
    0: [1, 2],
    1: [2],
    2: [0, 3],
    3: [3]
}
bfs(adj_list, 2) # Output: 2 0 3 1
```

## 🛠️ Practice Resources
- [LeetCode: Graph Tag](https://leetcode.com/tag/graph/)
- [GeeksforGeeks: Graph Algorithms](https://www.geeksforgeeks.org/graph-data-structure-and-algorithms/)
