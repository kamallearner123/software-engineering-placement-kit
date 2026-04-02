# 🌳 Trees and Heaps

Binary Trees, Binary Search Trees (BST), and Heaps are the cornerstone of many advanced algorithms and are extremely popular in technical interviews.

## 🎓 Core Concepts

### 1. Binary Tree
- A tree where each node has at most two children (left and right).
- **Traversals**:
  - **Inorder**: (Left, Root, Right) -> Yields sorted order for BST.
  - **Preorder**: (Root, Left, Right).
  - **Postorder**: (Left, Right, Root).
  - **Level Order**: BFS traversal using a Queue.

### 2. Binary Search Tree (BST)
- A specialized binary tree where:
  - Left Child < Root.
  - Right Child > Root.
- **Complexity**: Average O(log N) for Search, Insert, and Delete.

### 3. Heaps (Priority Queues)
- A complete binary tree that satisfies the heap property.
- **Max-Heap**: Root is the maximum element.
- **Min-Heap**: Root is the minimum element.
- **Common Use Cases**: Top K elements, Scheduling, Dijkstra's algorithm.

---

## 🏆 Top 10 Interview Problems

1.  **Lowest Common Ancestor (LCA)** of two nodes in a Binary Tree.
2.  **Binary Tree Level Order Traversal** (BFS).
3.  **Maximum Depth (Height)** of a Binary Tree.
4.  **Validate Binary Search Tree**.
5.  **Path Sum II**: Find all paths that sum to a target value.
6.  **Serializing and Deserializing** a Binary Tree.
7.  **Invert (Flip) Binary Tree**.
8.  **Merge K Sorted Lists** (Using Heap).
9.  **Kth Largest Element in an Array** (Using Heap).
10. **Find Median from Data Stream** (Using Two-Heaps).

---

## 💻 Sample Code (Inorder Traversal - Python)

```python
class Node:
    def __init__(self, key):
        self.left = None
        self.right = None
        self.val = key

def printInorder(root):
    if root:
        # First recur on left child
        printInorder(root.left)
        # Then print the data of node
        print(root.val, end=" "),
        # Now recur on right child
        printInorder(root.right)

# Usage
root = Node(1)
root.left = Node(2)
root.right = Node(3)
printInorder(root) # Output: 2 1 3
```

## 🛠️ Practice Resources
- [LeetCode: Binary Tree Tag](https://leetcode.com/tag/binary-tree/)
- [GeeksforGeeks: Tree Data Structure](https://www.geeksforgeeks.org/binary-tree-data-structure/)
