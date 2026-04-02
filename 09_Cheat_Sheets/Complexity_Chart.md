# ⏱️ Time & Space Complexity Cheat Sheet

Understanding Big O notation is the single most important skill for a Coding Interview.

## 📊 The Big O Hierarchy (Best to Worst)

1.  **O(1)** - Constant (Ideal)
2.  **O(log n)** - Logarithmic (Binary Search)
3.  **O(n)** - Linear (Single Loop)
4.  **O(n log n)** - Log-Linear (Merge/Quick Sort)
5.  **O(n²)** - Quadratic (Nested Loops)
6.  **O(2ⁿ)** - Exponential (Recursive Fibonacci)
7.  **O(n!)** - Factorial (Traveling Salesman)

---

## 📦 Data Structure Operations

| Data Structure | Access | Search | Insertion | Deletion |
| :--- | :--- | :--- | :--- | :--- |
| **Array** | O(1) | O(n) | O(n) | O(n) |
| **Stack** | O(n) | O(n) | O(1) | O(1) |
| **Queue** | O(n) | O(n) | O(1) | O(1) |
| **Singly Linked List** | O(n) | O(n) | O(1) | O(1) |
| **Binary Search Tree** | O(log n) | O(log n) | O(log n) | O(log n) |
| **Hash Table** | N/A | O(1) | O(1) | O(1) |

---

## ⚡ Sorting Algorithms

| Name | Average Time | Space Complexity |
| :--- | :--- | :--- |
| **Bubble Sort** | O(n²) | O(1) |
| **Insertion Sort** | O(n²) | O(1) |
| **Merge Sort** | O(n log n) | O(n) |
| **Quick Sort** | O(n log n) | O(log n) |
| **Heap Sort** | O(n log n) | O(1) |

---

## 💡 Quick Tips for the Interview
- If the input is **sorted**, think **Binary Search** O(log n).
- If you need **all permutations**, think **Backtracking** O(n!).
- If you need to find **all subsets**, think **Bit Manipulation** or **Recursion** O(2ⁿ).
- If there is a **dictionary/mapping** requirement, think **Hash Map** O(1).
