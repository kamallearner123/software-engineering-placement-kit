# Linked Lists: Complete Guide

> **Module:** Data Structures & Algorithms  
> **Topic:** Singly, Doubly, Circular Linked Lists & Advanced Algorithms  
> **Duration:** 4 hours

## 📚 Table of Contents

1. [Introduction to Linked Lists](#introduction)
2. [Singly Linked List](#singly-linked-list)
3. [Doubly Linked List](#doubly-linked-list)
4. [Circular Linked List](#circular-linked-list)
5. [List Reversal](#list-reversal)
6. [Floyd's Cycle Detection Algorithm](#floyds-algorithm)
7. [Common Linked List Problems](#common-problems)
8. [Practice Questions](#practice-questions)

---

## <a name="introduction"></a>1. Introduction to Linked Lists

### What is a Linked List?

A **linked list** is a linear data structure where elements are stored in **nodes**. Each node contains:
- **Data**: The value stored
- **Pointer(s)**: Reference to next (and/or previous) node

### Linked List vs Array

| Feature | Array | Linked List |
|---------|-------|-------------|
| Memory | Contiguous | Scattered |
| Access Time | O(1) | O(n) |
| Insertion (beginning) | O(n) | O(1) |
| Deletion (beginning) | O(n) | O(1) |
| Size | Fixed (in C/C++) | Dynamic |
| Memory Usage | Less overhead | More (stores pointers) |

### When to Use Linked Lists?

✅ **Use when:**
- Frequent insertions/deletions at beginning
- Size changes frequently
- Don't need random access

❌ **Don't use when:**
- Need fast random access
- Memory is limited (pointer overhead)
- Need cache-friendly sequential access

---

## <a name="singly-linked-list"></a>2. Singly Linked List

### Structure

Each node points to the **next** node only.

```
[Data|Next] → [Data|Next] → [Data|Next] → NULL
   Head                          Tail
```

**Visual Example:**
```
10 → 20 → 30 → 40 → NULL
```

### Node Implementation

```python
class Node:
    """Node for singly linked list"""
    def __init__(self, data):
        self.data = data
        self.next = None

class LinkedList:
    """Singly linked list"""
    def __init__(self):
        self.head = None
```

**C++ Implementation:**
```cpp
struct Node {
    int data;
    Node* next;
    
    Node(int val) : data(val), next(nullptr) {}
};

class LinkedList {
private:
    Node* head;
public:
    LinkedList() : head(nullptr) {}
};
```

---

### 2.1 Insertion Operations

#### Insert at Beginning

**Time Complexity:** O(1)  
**Space Complexity:** O(1)

```python
def insert_at_beginning(self, data):
    """Insert node at the beginning"""
    new_node = Node(data)
    new_node.next = self.head  # Point new node to current head
    self.head = new_node       # Update head to new node
```

**Visual Process:**
```
Before: 10 → 20 → 30 → NULL
Insert 5 at beginning:

Step 1: Create node 5
        5 → ?

Step 2: Point new node to head
        5 → 10 → 20 → 30 → NULL

Step 3: Update head
       HEAD
        ↓
        5 → 10 → 20 → 30 → NULL
```

---

#### Insert at End

**Time Complexity:** O(n) - need to traverse to end  
**Space Complexity:** O(1)

```python
def insert_at_end(self, data):
    """Insert node at the end"""
    new_node = Node(data)
    
    # If list is empty
    if not self.head:
        self.head = new_node
        return
    
    # Traverse to last node
    current = self.head
    while current.next:
        current = current.next
    
    # Add new node at end
    current.next = new_node
```

**Optimization:** Maintain a `tail` pointer → O(1) insertion

---

#### Insert at Position

**Time Complexity:** O(n)  
**Space Complexity:** O(1)

```python
def insert_at_position(self, data, position):
    """Insert node at specific position (0-indexed)"""
    new_node = Node(data)
    
    # Insert at beginning
    if position == 0:
        new_node.next = self.head
        self.head = new_node
        return
    
    # Traverse to position-1
    current = self.head
    for i in range(position - 1):
        if not current:
            print("Position out of bounds")
            return
        current = current.next
    
    # Insert new node
    new_node.next = current.next
    current.next = new_node
```

**Visual Process (Insert 25 at position 2):**
```
Before: 10 → 20 → 30 → 40 → NULL
        0    1    2    3

Step 1: Traverse to position 1 (20)
          current
             ↓
        10 → 20 → 30 → 40 → NULL

Step 2: Set new_node.next = current.next
        25 → 30

Step 3: Set current.next = new_node
        10 → 20 → 25 → 30 → 40 → NULL
```

---

### 2.2 Deletion Operations

#### Delete from Beginning

**Time Complexity:** O(1)  
**Space Complexity:** O(1)

```python
def delete_from_beginning(self):
    """Delete first node"""
    if not self.head:
        print("List is empty")
        return
    
    self.head = self.head.next
```

---

#### Delete from End

**Time Complexity:** O(n)  
**Space Complexity:** O(1)

```python
def delete_from_end(self):
    """Delete last node"""
    if not self.head:
        print("List is empty")
        return
    
    # If only one node
    if not self.head.next:
        self.head = None
        return
    
    # Traverse to second-last node
    current = self.head
    while current.next.next:
        current = current.next
    
    current.next = None
```

---

#### Delete Specific Value

**Time Complexity:** O(n)  
**Space Complexity:** O(1)

```python
def delete_value(self, value):
    """Delete first occurrence of value"""
    if not self.head:
        return
    
    # If head node contains value
    if self.head.data == value:
        self.head = self.head.next
        return
    
    # Search for value
    current = self.head
    while current.next:
        if current.next.data == value:
            current.next = current.next.next
            return
        current = current.next
```

---

### 2.3 Traversal

```python
def display(self):
    """Print all nodes"""
    if not self.head:
        print("List is empty")
        return
    
    current = self.head
    while current:
        print(current.data, end=" → ")
        current = current.next
    print("NULL")
```

---

## <a name="doubly-linked-list"></a>3. Doubly Linked List

### Structure

Each node has pointers to **both** next and previous nodes.

```
NULL ← [Prev|Data|Next] ⇄ [Prev|Data|Next] ⇄ [Prev|Data|Next] → NULL
          Head                                      Tail
```

**Visual Example:**
```
NULL ← 10 ⇄ 20 ⇄ 30 ⇄ 40 → NULL
```

### Advantages over Singly Linked List

✅ Can traverse in **both directions**  
✅ Deletion is easier (have access to previous node)  
✅ Can insert before a given node easily

❌ More memory (extra pointer)  
❌ More complex operations

---

### Node Implementation

```python
class DNode:
    """Node for doubly linked list"""
    def __init__(self, data):
        self.data = data
        self.next = None
        self.prev = None

class DoublyLinkedList:
    """Doubly linked list"""
    def __init__(self):
        self.head = None
```

---

### Insertion at Beginning

**Time Complexity:** O(1)

```python
def insert_at_beginning(self, data):
    """Insert at beginning of doubly linked list"""
    new_node = DNode(data)
    
    if not self.head:
        self.head = new_node
        return
    
    new_node.next = self.head
    self.head.prev = new_node
    self.head = new_node
```

**Visual Process:**
```
Before: NULL ← 10 ⇄ 20 ⇄ 30 → NULL

Insert 5:
Step 1: Create node 5
Step 2: 5.next = head (10)
        5 → 10 ⇄ 20 ⇄ 30 → NULL
Step 3: head.prev = 5
        5 ⇄ 10 ⇄ 20 ⇄ 30 → NULL
Step 4: head = 5
        NULL ← 5 ⇄ 10 ⇄ 20 ⇄ 30 → NULL
```

---

### Deletion

```python
def delete_node(self, node):
    """Delete a specific node (given reference to it)"""
    if not node:
        return
    
    # If node is head
    if node == self.head:
        self.head = node.next
    
    # Change next only if node is not last
    if node.next:
        node.next.prev = node.prev
    
    # Change prev only if node is not first
    if node.prev:
        node.prev.next = node.next
```

**Advantage:** Don't need to traverse from head to find previous node!

---

### Reverse Traversal

```python
def display_reverse(self):
    """Print list in reverse order"""
    if not self.head:
        return
    
    # Go to last node
    current = self.head
    while current.next:
        current = current.next
    
    # Traverse backwards
    while current:
        print(current.data, end=" ← ")
        current = current.prev
    print("NULL")
```

---

## <a name="circular-linked-list"></a>4. Circular Linked List

### Structure

Last node points back to the **first node** (or head).

**Singly Circular:**
```
    ┌─────────────────────┐
    ↓                     │
[Data|Next] → [Data|Next] → [Data|Next] ─┘
   Head
```

**Doubly Circular:**
```
    ┌──────────────────────────────┐
    ↓                              │
NULL ← [Prev|Data|Next] ⇄ [Prev|Data|Next] ⇄ [Prev|Data|Next]
                ↑                              │
                └──────────────────────────────┘
```

### Characteristics

- No NULL at end
- Can traverse entire list from any node
- Useful for round-robin scheduling

---

### Implementation

```python
class CircularLinkedList:
    def __init__(self):
        self.head = None
    
    def insert_at_beginning(self, data):
        """Insert at beginning of circular list"""
        new_node = Node(data)
        
        if not self.head:
            new_node.next = new_node  # Point to itself
            self.head = new_node
            return
        
        # Find last node
        current = self.head
        while current.next != self.head:
            current = current.next
        
        # Insert new node
        new_node.next = self.head
        current.next = new_node
        self.head = new_node
    
    def display(self):
        """Print circular linked list"""
        if not self.head:
            print("List is empty")
            return
        
        current = self.head
        while True:
            print(current.data, end=" → ")
            current = current.next
            if current == self.head:
                break
        print("(back to head)")
```

---

## <a name="list-reversal"></a>5. List Reversal

### 5.1 Iterative Reversal

**Time Complexity:** O(n)  
**Space Complexity:** O(1)

```python
def reverse_iterative(self):
    """Reverse linked list iteratively"""
    prev = None
    current = self.head
    
    while current:
        next_node = current.next  # Save next
        current.next = prev       # Reverse link
        prev = current            # Move prev forward
        current = next_node       # Move current forward
    
    self.head = prev
```

**Visual Process:**
```
Original: 10 → 20 → 30 → 40 → NULL

Step 1: prev=None, current=10
        NULL ← 10    20 → 30 → 40 → NULL

Step 2: prev=10, current=20
        NULL ← 10 ← 20    30 → 40 → NULL

Step 3: prev=20, current=30
        NULL ← 10 ← 20 ← 30    40 → NULL

Step 4: prev=30, current=40
        NULL ← 10 ← 20 ← 30 ← 40

Final: 40 → 30 → 20 → 10 → NULL
```

---

### 5.2 Recursive Reversal

**Time Complexity:** O(n)  
**Space Complexity:** O(n) - recursion stack

```python
def reverse_recursive(self, node):
    """Reverse linked list recursively"""
    # Base case: empty or single node
    if not node or not node.next:
        self.head = node
        return node
    
    # Recursive case
    rest = self.reverse_recursive(node.next)
    node.next.next = node  # Reverse link
    node.next = None       # Break forward link
    
    return rest
```

**Recursion Tree:**
```
reverse(10)
  └── reverse(20)
      └── reverse(30)
          └── reverse(40)
              └── reverse(NULL)  ← Base case
                  
Return path:
40.next = 30
30.next = 20
20.next = 10
10.next = NULL
```

---

## <a name="floyds-algorithm"></a>6. Floyd's Cycle Detection Algorithm

### The Problem

Detect if a linked list has a **cycle** (loop).

**Example with Cycle:**
```
1 → 2 → 3 → 4 → 5
        ↑       ↓
        8 ← 7 ← 6
```

### Floyd's Tortoise and Hare Algorithm

Use **two pointers**:
- **Slow pointer**: Moves 1 step at a time
- **Fast pointer**: Moves 2 steps at a time

**If there's a cycle**, fast will eventually catch slow.

**Time Complexity:** O(n)  
**Space Complexity:** O(1)

```python
def has_cycle(self):
    """
    Detect cycle using Floyd's algorithm
    Returns: True if cycle exists, False otherwise
    """
    if not self.head:
        return False
    
    slow = self.head
    fast = self.head
    
    while fast and fast.next:
        slow = slow.next         # Move 1 step
        fast = fast.next.next    # Move 2 steps
        
        if slow == fast:         # They met!
            return True
    
    return False  # Reached end, no cycle
```

**Visual Process:**
```
List: 1 → 2 → 3 → 4 → 5
              ↑       ↓
              8 ← 7 ← 6

Iteration 1:
  Slow: 1, Fast: 2

Iteration 2:
  Slow: 2, Fast: 4

Iteration 3:
  Slow: 3, Fast: 6

Iteration 4:
  Slow: 4, Fast: 8

Iteration 5:
  Slow: 5, Fast: 3

Iteration 6:
  Slow: 6, Fast: 5

Iteration 7:
  Slow: 7, Fast: 7  ← They meet! Cycle detected!
```

---

### Finding Cycle Start

```python
def find_cycle_start(self):
    """
    Find the node where cycle begins
    Returns: Node where cycle starts, or None
    """
    if not self.head:
        return None
    
    # Phase 1: Detect cycle
    slow = fast = self.head
    has_cycle = False
    
    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next
        
        if slow == fast:
            has_cycle = True
            break
    
    if not has_cycle:
        return None
    
    # Phase 2: Find start of cycle
    slow = self.head
    while slow != fast:
        slow = slow.next
        fast = fast.next
    
    return slow  # This is the start of cycle
```

---

## <a name="common-problems"></a>7. Common Linked List Problems

### 7.1 Find Middle Element

**Using Slow-Fast Pointers:**

```python
def find_middle(self):
    """
    Find middle element using two pointers
    """
    if not self.head:
        return None
    
    slow = self.head
    fast = self.head
    
    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next
    
    return slow  # Middle element
```

---

### 7.2 Merge Two Sorted Lists

```python
def merge_sorted_lists(l1, l2):
    """
    Merge two sorted linked lists
    Returns: head of merged list
    """
    dummy = Node(0)  # Dummy node
    current = dummy
    
    while l1 and l2:
        if l1.data <= l2.data:
            current.next = l1
            l1 = l1.next
        else:
            current.next = l2
            l2 = l2.next
        current = current.next
    
    # Attach remaining nodes
    current.next = l1 if l1 else l2
    
    return dummy.next
```

---

### 7.3 Remove Nth Node from End

```python
def remove_nth_from_end(self, n):
    """
    Remove nth node from end of list
    """
    dummy = Node(0)
    dummy.next = self.head
    
    # Use two pointers with gap of n
    fast = slow = dummy
    
    # Move fast n+1 steps ahead
    for _ in range(n + 1):
        if not fast:
            return
        fast = fast.next
    
    # Move both until fast reaches end
    while fast:
        fast = fast.next
        slow = slow.next
    
    # Remove node
    slow.next = slow.next.next
    self.head = dummy.next
```

---

### 7.4 Check if Palindrome

```python
def is_palindrome(self):
    """
    Check if linked list is palindrome
    """
    if not self.head or not self.head.next:
        return True
    
    # Find middle
    slow = fast = self.head
    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next
    
    # Reverse second half
    prev = None
    current = slow
    while current:
        next_node = current.next
        current.next = prev
        prev = current
        current = next_node
    
    # Compare first and second half
    first = self.head
    second = prev
    while second:
        if first.data != second.data:
            return False
        first = first.next
        second = second.next
    
    return True
```

---

## <a name="practice-questions"></a>8. Practice Questions

### Question 1: Basic Understanding

**What is the main advantage of linked lists over arrays?**

<details>
<summary>Click for answer</summary>

**Answer: Dynamic size and O(1) insertion/deletion at beginning**

**Advantages:**
1. **Dynamic size**: Can grow/shrink during runtime
2. **O(1) insertion/deletion at beginning**: Just update pointers
3. **No wasted memory**: Allocate exactly what's needed
4. **Easy insertion/deletion in middle**: No shifting required

**In arrays:**
- Fixed size (in C/C++)
- Insertion at beginning requires O(n) shifts
- May waste memory or run out of space
</details>

---

### Question 2: Complexity Analysis

**What is the time complexity to access the nth element in a linked list?**

<details>
<summary>Click for answer</summary>

**Answer: O(n)**

Must traverse from head to reach nth element:
```python
current = head
for i in range(n):
    current = current.next
return current
```

**In arrays:** O(1) - direct index access

This is the main **disadvantage** of linked lists!
</details>

---

### Question 3: Doubly vs Singly

**Why is deletion easier in a doubly linked list?**

<details>
<summary>Click for answer</summary>

**Answer: Direct access to previous node**

**In doubly linked list:**
```python
def delete_node(node):
    node.prev.next = node.next  # Have access to prev!
    node.next.prev = node.prev
```
Time: **O(1)** if we have reference to the node

**In singly linked list:**
```python
def delete_node(head, node):
    # Must traverse from head to find previous node
    current = head
    while current.next != node:
        current = current.next
    current.next = node.next
```
Time: **O(n)** - need to traverse to find previous

**Conclusion:** Doubly linked list saves time for deletion!
</details>

---

### Question 4: Floyd's Algorithm

**Why does Floyd's algorithm work? Why do slow and fast pointers meet if there's a cycle?**

<details>
<summary>Click for answer</summary>

**Answer: Fast pointer gains 1 position per iteration**

**Intuition:**
Think of a circular race track. Fast runner goes 2× speed of slow runner.

**In each iteration:**
- Slow moves 1 step
- Fast moves 2 steps
- Fast gains 1 step on slow

**Inside the cycle:**
The distance between them decreases by 1 each iteration.
Eventually, fast catches slow!

**Mathematical proof:**
Let cycle length = C, distance between them = D
- After D iterations, fast catches slow
- Time complexity: O(C) which is O(n)

**Space:** O(1) - only two pointers!
</details>

---

### Question 5: List Reversal

**Reverse the list: 1 → 2 → 3 → 4 → NULL. Show the steps.**

<details>
<summary>Click for answer</summary>

**Answer: 4 → 3 → 2 → 1 → NULL**

**Iterative steps:**
```
Initial: 1 → 2 → 3 → 4 → NULL
prev = NULL, current = 1

Step 1: 
  NULL ← 1    2 → 3 → 4 → NULL
  prev=1, current=2

Step 2:
  NULL ← 1 ← 2    3 → 4 → NULL
  prev=2, current=3

Step 3:
  NULL ← 1 ← 2 ← 3    4 → NULL
  prev=3, current=4

Step 4:
  NULL ← 1 ← 2 ← 3 ← 4
  prev=4, current=NULL

Final: 4 → 3 → 2 → 1 → NULL
```

**Time:** O(n), **Space:** O(1)
</details>

---

### Question 6: Cycle Detection

**Given list: 1 → 2 → 3 → 4 → 5 → 3 (points back to node 3), does it have a cycle?**

<details>
<summary>Click for answer</summary>

**Answer: Yes, cycle exists starting at node 3**

**Detection using Floyd's algorithm:**
```
Slow: 1 → 2 → 3 → 4 → 5 → 3 → 4 → 5 → 3 ...
Fast: 1 → 3 → 5 → 4 → 3 → 5 → 4 → 3 ...

They will meet inside the cycle!
```

**Finding cycle start:**
After meeting, reset one pointer to head.
Move both at same speed → they meet at cycle start (node 3)!
</details>

---

### Question 7: Middle Element

**Find the middle element of list: 1 → 2 → 3 → 4 → 5 → NULL**

<details>
<summary>Click for answer</summary>

**Answer: 3**

**Using slow-fast pointers:**
```
Step 1: slow=1, fast=1
Step 2: slow=2, fast=3
Step 3: slow=3, fast=5
Step 4: fast.next=NULL, stop

Middle = slow = 3
```

**For even-length list (1→2→3→4):**
```
Step 1: slow=1, fast=1
Step 2: slow=2, fast=3
Step 3: slow=3, fast=NULL

Middle = slow = 3 (second middle)
```

**Time:** O(n/2) = O(n), **Space:** O(1)
</details>

---

### Question 8: Memory Comparison

**Which uses more memory: array of 100 integers or linked list of 100 integers?**

<details>
<summary>Click for answer</summary>

**Answer: Linked list uses more memory**

**Array:**
```
Memory = 100 × sizeof(int) = 100 × 4 = 400 bytes
```

**Linked list:**
```
Each node = sizeof(int) + sizeof(pointer)
          = 4 + 8 (on 64-bit system)
          = 12 bytes

Total = 100 × 12 = 1200 bytes
```

**Linked list uses 3× more memory!**

**Reason:** Pointer overhead (8 bytes per node on 64-bit systems)

**Tradeoff:** More memory for dynamic size and O(1) operations
</details>

---

### Question 9: Palindrome Check

**Is list 1 → 2 → 3 → 2 → 1 → NULL a palindrome?**

<details>
<summary>Click for answer</summary>

**Answer: Yes**

**Method:** Find middle, reverse second half, compare

```
Original: 1 → 2 → 3 → 2 → 1 → NULL

Step 1: Find middle (3)
        First half: 1 → 2 → 3
        Second half: 2 → 1 → NULL

Step 2: Reverse second half
        Second half: 1 → 2 → NULL

Step 3: Compare
        1 == 1 ✓
        2 == 2 ✓
        
Result: Palindrome!
```

**Time:** O(n), **Space:** O(1)
</details>

---

### Question 10: Merge Sorted Lists

**Merge lists L1: 1→3→5 and L2: 2→4→6**

<details>
<summary>Click for answer</summary>

**Answer: 1 → 2 → 3 → 4 → 5 → 6**

**Step-by-step merge:**
```
L1: 1 → 3 → 5
L2: 2 → 4 → 6

Comparison:
1 < 2 → add 1: [1]
      L1: 3 → 5, L2: 2 → 4 → 6

2 < 3 → add 2: [1, 2]
      L1: 3 → 5, L2: 4 → 6

3 < 4 → add 3: [1, 2, 3]
      L1: 5, L2: 4 → 6

4 < 5 → add 4: [1, 2, 3, 4]
      L1: 5, L2: 6

5 < 6 → add 5: [1, 2, 3, 4, 5]
      L1: NULL, L2: 6

Add remaining: [1, 2, 3, 4, 5, 6]
```

**Time:** O(n + m), **Space:** O(1) if modifying existing nodes
</details>

---

## 🎯 Key Takeaways

### Singly Linked List
- ✅ Simple structure, one next pointer
- ✅ O(1) insertion at beginning
- ❌ O(n) to access nth element
- ❌ Can only traverse forward

### Doubly Linked List
- ✅ Bidirectional traversal
- ✅ Easier deletion (have prev pointer)
- ❌ More memory (two pointers)
- ❌ More complex operations

### Circular Linked List
- ✅ Can traverse from any node
- ✅ Useful for round-robin applications
- ❌ Must be careful with termination

### Important Algorithms
1. **Reversal:** Iterative O(n) time, O(1) space
2. **Floyd's Cycle Detection:** O(n) time, O(1) space
3. **Middle Element:** Use two pointers
4. **Merge Sorted Lists:** O(n+m) time

### When to use Linked Lists?
- Frequent insertions/deletions at beginning
- Unknown size, needs to grow dynamically
- Don't need random access
- Implementing stacks, queues

---

## 📚 Practice Resources

- **LeetCode:** Linked List tagged problems
- **HackerRank:** Linked Lists section
- **Key problems:**
  - Reverse Linked List
  - Detect Cycle
  - Merge Two Sorted Lists
  - Remove Nth Node From End
  - Palindrome Linked List

---

**Next Steps:**
1. Implement all three types of linked lists
2. Practice reversal (iterative and recursive)
3. Master Floyd's algorithm
4. Solve at least 10 linked list problems
5. Understand time/space tradeoffs

**Remember:** Draw diagrams! Linked list problems become much clearer with visual representations.
