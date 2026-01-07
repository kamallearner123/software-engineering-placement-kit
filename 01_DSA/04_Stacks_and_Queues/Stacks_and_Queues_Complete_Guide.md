# Stacks and Queues: Complete Guide

> **Module:** Data Structures & Algorithms  
> **Topic:** Stack (LIFO), Queue (FIFO), Circular Queues & Applications  
> **Duration:** 4 hours

## 📚 Table of Contents

1. [Introduction to Stacks](#introduction-stacks)
2. [Stack Implementation](#stack-implementation)
3. [Stack Applications](#stack-applications)
4. [Introduction to Queues](#introduction-queues)
5. [Queue Implementation](#queue-implementation)
6. [Circular Queue](#circular-queue)
7. [Queue Applications](#queue-applications)
8. [Advanced: Deque and Priority Queue](#advanced)
9. [Practice Questions](#practice-questions)

---

## <a name="introduction-stacks"></a>1. Introduction to Stacks

### What is a Stack?

A **stack** is a linear data structure that follows the **LIFO** (Last In, First Out) principle.

**Real-life Examples:**
- Stack of plates
- Browser back button
- Undo functionality in editors
- Function call stack

### Visual Representation

```
    ┌───┐
    │ 4 │ ← Top (Last In, First Out)
    ├───┤
    │ 3 │
    ├───┤
    │ 2 │
    ├───┤
    │ 1 │
    └───┘
```

### Basic Operations

| Operation | Description | Time Complexity |
|-----------|-------------|-----------------|
| `push(x)` | Add element to top | O(1) |
| `pop()` | Remove and return top element | O(1) |
| `peek()` / `top()` | Return top element without removing | O(1) |
| `isEmpty()` | Check if stack is empty | O(1) |
| `size()` | Get number of elements | O(1) |

---

## <a name="stack-implementation"></a>2. Stack Implementation

### 2.1 Stack Using Array

```python
class Stack:
    """Stack implementation using list (array)"""
    
    def __init__(self, capacity=100):
        self.capacity = capacity
        self.stack = []
        self.top = -1
    
    def push(self, item):
        """Add item to top of stack"""
        if self.is_full():
            print("Stack Overflow!")
            return False
        
        self.stack.append(item)
        self.top += 1
        return True
    
    def pop(self):
        """Remove and return top item"""
        if self.is_empty():
            print("Stack Underflow!")
            return None
        
        item = self.stack.pop()
        self.top -= 1
        return item
    
    def peek(self):
        """Return top item without removing"""
        if self.is_empty():
            return None
        return self.stack[self.top]
    
    def is_empty(self):
        """Check if stack is empty"""
        return self.top == -1
    
    def is_full(self):
        """Check if stack is full"""
        return self.top == self.capacity - 1
    
    def size(self):
        """Return number of elements"""
        return self.top + 1
    
    def display(self):
        """Print stack elements"""
        if self.is_empty():
            print("Stack is empty")
            return
        
        print("Stack (top to bottom):", end=" ")
        for i in range(self.top, -1, -1):
            print(self.stack[i], end=" ")
        print()

# Example Usage
stack = Stack()
stack.push(10)
stack.push(20)
stack.push(30)
stack.display()  # 30 20 10
print("Top:", stack.peek())  # 30
print("Popped:", stack.pop())  # 30
stack.display()  # 20 10
```

**C++ Implementation:**
```cpp
#include <iostream>
#define MAX 100

class Stack {
private:
    int top;
    int arr[MAX];

public:
    Stack() { top = -1; }
    
    bool push(int x) {
        if (top >= MAX - 1) {
            std::cout << "Stack Overflow\n";
            return false;
        }
        arr[++top] = x;
        return true;
    }
    
    int pop() {
        if (top < 0) {
            std::cout << "Stack Underflow\n";
            return -1;
        }
        return arr[top--];
    }
    
    int peek() {
        if (top < 0) {
            std::cout << "Stack is Empty\n";
            return -1;
        }
        return arr[top];
    }
    
    bool isEmpty() {
        return (top < 0);
    }
};
```

---

### 2.2 Stack Using Linked List

```python
class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

class StackLinkedList:
    """Stack implementation using linked list"""
    
    def __init__(self):
        self.head = None
        self.count = 0
    
    def push(self, item):
        """Add item to top (beginning of linked list)"""
        new_node = Node(item)
        new_node.next = self.head
        self.head = new_node
        self.count += 1
    
    def pop(self):
        """Remove and return top item"""
        if self.is_empty():
            print("Stack Underflow!")
            return None
        
        item = self.head.data
        self.head = self.head.next
        self.count -= 1
        return item
    
    def peek(self):
        """Return top item without removing"""
        if self.is_empty():
            return None
        return self.head.data
    
    def is_empty(self):
        """Check if stack is empty"""
        return self.head is None
    
    def size(self):
        """Return number of elements"""
        return self.count
```

**Visual Process:**
```
Push 10:  10 → NULL

Push 20:  20 → 10 → NULL

Push 30:  30 → 20 → 10 → NULL
          ↑
         HEAD (Top)

Pop:      20 → 10 → NULL
          ↑
         HEAD (Top)
```

---

### Array vs Linked List Implementation

| Feature | Array | Linked List |
|---------|-------|-------------|
| Memory | Contiguous, fixed size | Dynamic, scattered |
| Push/Pop | O(1) | O(1) |
| Memory overhead | Less | More (pointers) |
| Size limit | Fixed (can overflow) | Dynamic |
| Cache performance | Better | Worse |

---

## <a name="stack-applications"></a>3. Stack Applications

### 3.1 Balanced Parentheses Checking

Check if parentheses/brackets are properly balanced.

**Examples:**
- `()` → Valid
- `({[]})` → Valid
- `([)]` → Invalid
- `((()` → Invalid

**Algorithm:**
1. For each opening bracket: push to stack
2. For each closing bracket: pop and check if it matches
3. At end: stack should be empty

**Time Complexity:** O(n)  
**Space Complexity:** O(n)

```python
def is_balanced(expression):
    """
    Check if parentheses are balanced
    """
    stack = []
    opening = "({["
    closing = ")}]"
    pairs = {'(': ')', '{': '}', '[': ']'}
    
    for char in expression:
        if char in opening:
            stack.append(char)
        elif char in closing:
            if not stack:
                return False
            if pairs[stack.pop()] != char:
                return False
    
    return len(stack) == 0

# Examples
print(is_balanced("()"))        # True
print(is_balanced("({[]})"))    # True
print(is_balanced("([)]"))      # False
print(is_balanced("((()"))      # False
```

**Visual Process for `({[]})`:**
```
Character: (
Stack: [(]

Character: {
Stack: [(, {]

Character: [
Stack: [(, {, []

Character: ]
Pop [, match with ]  ✓
Stack: [(, {]

Character: }
Pop {, match with }  ✓
Stack: [(]

Character: )
Pop (, match with )  ✓
Stack: []

Result: Balanced ✓
```

---

### 3.2 Expression Evaluation

#### Infix to Postfix Conversion

**Infix:** `A + B * C`  
**Postfix:** `A B C * +`

**Why Postfix?** No need for parentheses or operator precedence!

```python
def infix_to_postfix(expression):
    """
    Convert infix expression to postfix
    """
    precedence = {'+': 1, '-': 1, '*': 2, '/': 2, '^': 3}
    stack = []
    postfix = []
    
    for char in expression.replace(" ", ""):
        # Operand
        if char.isalnum():
            postfix.append(char)
        
        # Opening parenthesis
        elif char == '(':
            stack.append(char)
        
        # Closing parenthesis
        elif char == ')':
            while stack and stack[-1] != '(':
                postfix.append(stack.pop())
            stack.pop()  # Remove '('
        
        # Operator
        else:
            while (stack and stack[-1] != '(' and
                   precedence.get(stack[-1], 0) >= precedence.get(char, 0)):
                postfix.append(stack.pop())
            stack.append(char)
    
    # Pop remaining operators
    while stack:
        postfix.append(stack.pop())
    
    return ''.join(postfix)

# Examples
print(infix_to_postfix("A+B*C"))      # ABC*+
print(infix_to_postfix("(A+B)*C"))    # AB+C*
print(infix_to_postfix("A+B*C-D"))    # ABC*+D-
```

---

#### Postfix Evaluation

```python
def evaluate_postfix(expression):
    """
    Evaluate postfix expression
    """
    stack = []
    
    for char in expression.split():
        # If operand, push to stack
        if char.isdigit():
            stack.append(int(char))
        
        # If operator, pop two operands and compute
        else:
            operand2 = stack.pop()
            operand1 = stack.pop()
            
            if char == '+':
                result = operand1 + operand2
            elif char == '-':
                result = operand1 - operand2
            elif char == '*':
                result = operand1 * operand2
            elif char == '/':
                result = operand1 / operand2
            
            stack.append(result)
    
    return stack.pop()

# Example
print(evaluate_postfix("2 3 * 5 +"))  # 11
# Process: 2*3 = 6, then 6+5 = 11
```

**Visual Process for `2 3 * 5 +`:**
```
Token: 2
Stack: [2]

Token: 3
Stack: [2, 3]

Token: *
Pop 3, 2
Compute: 2 * 3 = 6
Stack: [6]

Token: 5
Stack: [6, 5]

Token: +
Pop 5, 6
Compute: 6 + 5 = 11
Stack: [11]

Result: 11
```

---

### 3.3 Function Call Stack

When a function is called, its execution context is pushed onto the call stack.

```python
def factorial(n):
    if n <= 1:
        return 1
    return n * factorial(n - 1)

# Call: factorial(4)
```

**Call Stack:**
```
factorial(4)
  ├── factorial(3)
  │   ├── factorial(2)
  │   │   ├── factorial(1)  → returns 1
  │   │   └── returns 2 * 1 = 2
  │   └── returns 3 * 2 = 6
  └── returns 4 * 6 = 24
```

---

### 3.4 Undo Functionality

```python
class TextEditor:
    """Simple text editor with undo"""
    
    def __init__(self):
        self.text = ""
        self.undo_stack = []
    
    def write(self, text):
        """Add text"""
        self.undo_stack.append(self.text)
        self.text += text
    
    def undo(self):
        """Undo last operation"""
        if self.undo_stack:
            self.text = self.undo_stack.pop()
    
    def get_text(self):
        return self.text

# Example
editor = TextEditor()
editor.write("Hello")
print(editor.get_text())  # Hello
editor.write(" World")
print(editor.get_text())  # Hello World
editor.undo()
print(editor.get_text())  # Hello
```

---

## <a name="introduction-queues"></a>4. Introduction to Queues

### What is a Queue?

A **queue** is a linear data structure that follows the **FIFO** (First In, First Out) principle.

**Real-life Examples:**
- Line at ticket counter
- Print job queue
- BFS (Breadth-First Search)
- Task scheduling

### Visual Representation

```
FRONT                                REAR
  ↓                                   ↓
[1] → [2] → [3] → [4]
  ↑                 ↑
 Dequeue          Enqueue
(Remove)          (Add)
```

### Basic Operations

| Operation | Description | Time Complexity |
|-----------|-------------|-----------------|
| `enqueue(x)` | Add element to rear | O(1) |
| `dequeue()` | Remove and return front element | O(1) |
| `front()` / `peek()` | Return front element | O(1) |
| `isEmpty()` | Check if queue is empty | O(1) |
| `size()` | Get number of elements | O(1) |

---

## <a name="queue-implementation"></a>5. Queue Implementation

### 5.1 Queue Using Array (Simple)

```python
class Queue:
    """Queue implementation using list"""
    
    def __init__(self):
        self.queue = []
    
    def enqueue(self, item):
        """Add item to rear"""
        self.queue.append(item)
    
    def dequeue(self):
        """Remove and return front item"""
        if self.is_empty():
            print("Queue Underflow!")
            return None
        return self.queue.pop(0)  # O(n) operation!
    
    def front(self):
        """Return front item"""
        if self.is_empty():
            return None
        return self.queue[0]
    
    def is_empty(self):
        """Check if queue is empty"""
        return len(self.queue) == 0
    
    def size(self):
        """Return number of elements"""
        return len(self.queue)
```

**Problem:** `dequeue()` is O(n) because `pop(0)` shifts all elements!

---

### 5.2 Queue Using Two Pointers (Efficient)

```python
class EfficientQueue:
    """Efficient queue using array with two pointers"""
    
    def __init__(self, capacity=100):
        self.capacity = capacity
        self.queue = [None] * capacity
        self.front_idx = 0
        self.rear_idx = -1
        self.count = 0
    
    def enqueue(self, item):
        """Add item to rear - O(1)"""
        if self.is_full():
            print("Queue Overflow!")
            return False
        
        self.rear_idx = (self.rear_idx + 1) % self.capacity
        self.queue[self.rear_idx] = item
        self.count += 1
        return True
    
    def dequeue(self):
        """Remove and return front item - O(1)"""
        if self.is_empty():
            print("Queue Underflow!")
            return None
        
        item = self.queue[self.front_idx]
        self.front_idx = (self.front_idx + 1) % self.capacity
        self.count -= 1
        return item
    
    def front(self):
        """Return front item"""
        if self.is_empty():
            return None
        return self.queue[self.front_idx]
    
    def is_empty(self):
        """Check if queue is empty"""
        return self.count == 0
    
    def is_full(self):
        """Check if queue is full"""
        return self.count == self.capacity
    
    def size(self):
        """Return number of elements"""
        return self.count
```

---

### 5.3 Queue Using Linked List

```python
class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

class QueueLinkedList:
    """Queue implementation using linked list"""
    
    def __init__(self):
        self.front = None
        self.rear = None
        self.count = 0
    
    def enqueue(self, item):
        """Add item to rear"""
        new_node = Node(item)
        
        if self.rear is None:
            self.front = self.rear = new_node
        else:
            self.rear.next = new_node
            self.rear = new_node
        
        self.count += 1
    
    def dequeue(self):
        """Remove and return front item"""
        if self.is_empty():
            print("Queue Underflow!")
            return None
        
        item = self.front.data
        self.front = self.front.next
        
        if self.front is None:
            self.rear = None
        
        self.count -= 1
        return item
    
    def peek(self):
        """Return front item"""
        if self.is_empty():
            return None
        return self.front.data
    
    def is_empty(self):
        """Check if queue is empty"""
        return self.front is None
    
    def size(self):
        """Return number of elements"""
        return self.count
```

**Visual Process:**
```
Enqueue 10:  
  FRONT → [10] ← REAR

Enqueue 20:
  FRONT → [10] → [20] ← REAR

Enqueue 30:
  FRONT → [10] → [20] → [30] ← REAR

Dequeue:
  FRONT → [20] → [30] ← REAR
  (Removed 10)
```

---

## <a name="circular-queue"></a>6. Circular Queue

### What is a Circular Queue?

A queue where the last position connects back to the first position, forming a circle.

**Advantage:** Efficient use of space (no wasted space after dequeue)

**Visual Representation:**
```
      [1] → [2]
       ↑     ↓
      [4] ← [3]
      
Front = 0, Rear = 3
Size = 4
```

### Implementation

```python
class CircularQueue:
    """Circular queue implementation"""
    
    def __init__(self, capacity):
        self.capacity = capacity
        self.queue = [None] * capacity
        self.front = -1
        self.rear = -1
        self.count = 0
    
    def enqueue(self, item):
        """Add item to rear"""
        if self.is_full():
            print("Queue is full!")
            return False
        
        # First element
        if self.front == -1:
            self.front = 0
        
        self.rear = (self.rear + 1) % self.capacity
        self.queue[self.rear] = item
        self.count += 1
        return True
    
    def dequeue(self):
        """Remove and return front item"""
        if self.is_empty():
            print("Queue is empty!")
            return None
        
        item = self.queue[self.front]
        
        # Last element
        if self.front == self.rear:
            self.front = -1
            self.rear = -1
        else:
            self.front = (self.front + 1) % self.capacity
        
        self.count -= 1
        return item
    
    def is_empty(self):
        """Check if queue is empty"""
        return self.count == 0
    
    def is_full(self):
        """Check if queue is full"""
        return self.count == self.capacity
    
    def size(self):
        """Return number of elements"""
        return self.count
    
    def display(self):
        """Display queue elements"""
        if self.is_empty():
            print("Queue is empty")
            return
        
        print("Queue:", end=" ")
        i = self.front
        while True:
            print(self.queue[i], end=" ")
            if i == self.rear:
                break
            i = (i + 1) % self.capacity
        print()

# Example
cq = CircularQueue(5)
cq.enqueue(10)
cq.enqueue(20)
cq.enqueue(30)
cq.display()  # 10 20 30
cq.dequeue()  # Remove 10
cq.enqueue(40)
cq.enqueue(50)
cq.display()  # 20 30 40 50
```

---

## <a name="queue-applications"></a>7. Queue Applications

### 7.1 BFS (Breadth-First Search)

```python
from collections import deque

def bfs(graph, start):
    """
    Breadth-First Search using queue
    """
    visited = set()
    queue = deque([start])
    visited.add(start)
    result = []
    
    while queue:
        node = queue.popleft()
        result.append(node)
        
        for neighbor in graph[node]:
            if neighbor not in visited:
                visited.add(neighbor)
                queue.append(neighbor)
    
    return result

# Example graph
graph = {
    'A': ['B', 'C'],
    'B': ['A', 'D', 'E'],
    'C': ['A', 'F'],
    'D': ['B'],
    'E': ['B', 'F'],
    'F': ['C', 'E']
}

print(bfs(graph, 'A'))  # ['A', 'B', 'C', 'D', 'E', 'F']
```

---

### 7.2 LRU Cache (Using Queue + Hash Map)

**LRU** = Least Recently Used cache eviction policy

```python
from collections import OrderedDict

class LRUCache:
    """LRU Cache using OrderedDict"""
    
    def __init__(self, capacity):
        self.cache = OrderedDict()
        self.capacity = capacity
    
    def get(self, key):
        """Get value and mark as recently used"""
        if key not in self.cache:
            return -1
        
        # Move to end (most recently used)
        self.cache.move_to_end(key)
        return self.cache[key]
    
    def put(self, key, value):
        """Put key-value pair"""
        if key in self.cache:
            # Update and move to end
            self.cache.move_to_end(key)
        
        self.cache[key] = value
        
        # Remove least recently used if capacity exceeded
        if len(self.cache) > self.capacity:
            self.cache.popitem(last=False)
    
    def display(self):
        """Display cache (least to most recent)"""
        print("Cache (LRU → MRU):", list(self.cache.items()))

# Example
cache = LRUCache(3)
cache.put(1, "A")
cache.put(2, "B")
cache.put(3, "C")
cache.display()  # [(1, 'A'), (2, 'B'), (3, 'C')]

cache.get(1)     # Access 1
cache.display()  # [(2, 'B'), (3, 'C'), (1, 'A')]

cache.put(4, "D")  # Evicts 2 (LRU)
cache.display()  # [(3, 'C'), (1, 'A'), (4, 'D')]
```

---

### 7.3 Task Scheduling

```python
class TaskScheduler:
    """Simple task scheduler using queue"""
    
    def __init__(self):
        self.task_queue = deque()
    
    def add_task(self, task):
        """Add task to queue"""
        self.task_queue.append(task)
        print(f"Task added: {task}")
    
    def execute_tasks(self):
        """Execute all tasks in FIFO order"""
        print("\nExecuting tasks:")
        while self.task_queue:
            task = self.task_queue.popleft()
            print(f"  Executing: {task}")

# Example
scheduler = TaskScheduler()
scheduler.add_task("Print Document 1")
scheduler.add_task("Print Document 2")
scheduler.add_task("Print Document 3")
scheduler.execute_tasks()
```

---

## <a name="advanced"></a>8. Advanced: Deque and Priority Queue

### 8.1 Deque (Double-Ended Queue)

Operations at **both ends**.

```python
from collections import deque

# Python's deque
dq = deque()

# Operations at rear
dq.append(10)       # Add to rear
dq.append(20)

# Operations at front
dq.appendleft(5)    # Add to front
dq.appendleft(1)

print(dq)           # deque([1, 5, 10, 20])

dq.pop()            # Remove from rear
dq.popleft()        # Remove from front

print(dq)           # deque([5, 10])
```

---

### 8.2 Priority Queue

Elements are dequeued based on **priority**, not FIFO.

```python
import heapq

class PriorityQueue:
    """Priority queue using heapq (min-heap)"""
    
    def __init__(self):
        self.heap = []
    
    def push(self, priority, item):
        """Add item with priority"""
        heapq.heappush(self.heap, (priority, item))
    
    def pop(self):
        """Remove and return highest priority item"""
        if self.is_empty():
            return None
        return heapq.heappop(self.heap)[1]
    
    def is_empty(self):
        """Check if queue is empty"""
        return len(self.heap) == 0

# Example
pq = PriorityQueue()
pq.push(3, "Low priority")
pq.push(1, "High priority")
pq.push(2, "Medium priority")

print(pq.pop())  # High priority (priority 1)
print(pq.pop())  # Medium priority (priority 2)
print(pq.pop())  # Low priority (priority 3)
```

---

## <a name="practice-questions"></a>9. Practice Questions

### Question 1: Stack Basics

**What will be the output after these operations?**
```
push(10)
push(20)
push(30)
pop()
push(40)
peek()
```

<details>
<summary>Click for answer</summary>

**Answer: 40**

Process:
```
push(10):  [10]
push(20):  [10, 20]
push(30):  [10, 20, 30]
pop():     [10, 20]  (removed 30)
push(40):  [10, 20, 40]
peek():    40  (top element)
```

**Result:** peek() returns 40
</details>

---

### Question 2: Balanced Parentheses

**Is the expression `{[()]}` balanced?**

<details>
<summary>Click for answer</summary>

**Answer: Yes, balanced**

Process:
```
{  → push {    Stack: [{]
[  → push [    Stack: [{, []
(  → push (    Stack: [{, [, (]
)  → pop (, match ✓    Stack: [{, []
]  → pop [, match ✓    Stack: [{]
}  → pop {, match ✓    Stack: []

Stack is empty → Balanced!
```
</details>

---

### Question 3: Postfix Evaluation

**Evaluate postfix expression: `5 3 + 2 *`**

<details>
<summary>Click for answer</summary>

**Answer: 16**

Process:
```
5  → push 5       Stack: [5]
3  → push 3       Stack: [5, 3]
+  → pop 3, 5     Compute: 5 + 3 = 8
   → push 8       Stack: [8]
2  → push 2       Stack: [8, 2]
*  → pop 2, 8     Compute: 8 * 2 = 16
   → push 16      Stack: [16]

Result: 16
```
</details>

---

### Question 4: Queue Operations

**What will be the front element after these operations?**
```
enqueue(10)
enqueue(20)
enqueue(30)
dequeue()
enqueue(40)
front()
```

<details>
<summary>Click for answer</summary>

**Answer: 20**

Process:
```
enqueue(10):  [10]  (front=10, rear=10)
enqueue(20):  [10, 20]  (front=10, rear=20)
enqueue(30):  [10, 20, 30]  (front=10, rear=30)
dequeue():    [20, 30]  (removed 10, front=20)
enqueue(40):  [20, 30, 40]  (front=20, rear=40)
front():      20
```

**Result:** front() returns 20
</details>

---

### Question 5: Stack vs Queue

**Given sequence 1, 2, 3, 4, 5:**
- **Using Stack (LIFO):** What order will elements come out?
- **Using Queue (FIFO):** What order will elements come out?

<details>
<summary>Click for answer</summary>

**Stack Output: 5, 4, 3, 2, 1** (reversed)
```
Push order:  1 → 2 → 3 → 4 → 5
Pop order:   5 → 4 → 3 → 2 → 1  (Last In, First Out)
```

**Queue Output: 1, 2, 3, 4, 5** (same order)
```
Enqueue order:  1 → 2 → 3 → 4 → 5
Dequeue order:  1 → 2 → 3 → 4 → 5  (First In, First Out)
```

**Key Difference:** Stack reverses order, Queue maintains order
</details>

---

### Question 6: Circular Queue

**In a circular queue of size 5, after these operations, is the queue full?**
```
enqueue(1)
enqueue(2)
enqueue(3)
dequeue()
enqueue(4)
enqueue(5)
enqueue(6)
```

<details>
<summary>Click for answer</summary>

**Answer: No, not full**

Track positions (size = 5):
```
enqueue(1):  [1, _, _, _, _]  (front=0, rear=0, count=1)
enqueue(2):  [1, 2, _, _, _]  (front=0, rear=1, count=2)
enqueue(3):  [1, 2, 3, _, _]  (front=0, rear=2, count=3)
dequeue():   [_, 2, 3, _, _]  (front=1, rear=2, count=2)
enqueue(4):  [_, 2, 3, 4, _]  (front=1, rear=3, count=3)
enqueue(5):  [_, 2, 3, 4, 5]  (front=1, rear=4, count=4)
enqueue(6):  [6, 2, 3, 4, 5]  (front=1, rear=0, count=5) ✓ Full!
```

**After last enqueue:** Queue IS full (count = 5 = capacity)

**Correction:** Queue BECOMES full after the last operation!
</details>

---

### Question 7: Implementation Choice

**When should you use linked list instead of array for stack implementation?**

<details>
<summary>Click for answer</summary>

**Use Linked List when:**

1. **Unknown maximum size**: Don't know how many elements
2. **Highly dynamic**: Frequent push/pop with varying sizes
3. **Memory constraints**: Can't allocate large contiguous block

**Use Array when:**
1. **Known maximum size**: Fixed upper limit
2. **Better cache performance**: Contiguous memory
3. **Less memory overhead**: No pointer storage
4. **Simpler implementation**: Easier to code

**Tradeoff:**
- Array: Faster (cache-friendly), but fixed size
- Linked List: Dynamic size, but slower (pointer overhead)

**In most interviews:** Array implementation is simpler and sufficient!
</details>

---

### Question 8: Time Complexity

**What's wrong with this queue implementation?**
```python
def dequeue(self):
    return self.queue.pop(0)  # Using list
```

<details>
<summary>Click for answer</summary>

**Problem: O(n) time complexity!**

`pop(0)` removes first element, then **shifts all remaining elements** left.

**Example:**
```
Before: [10, 20, 30, 40, 50]
         0   1   2   3   4

pop(0):
Step 1: Remove 10
Step 2: Shift all:
        [20, 30, 40, 50, _]
         0   1   2   3   4
        
Result: [20, 30, 40, 50]
        (4 shift operations = O(n))
```

**Solution:** Use `collections.deque` or circular queue with two pointers!
```python
from collections import deque
queue = deque()
queue.popleft()  # O(1) operation!
```
</details>

---

### Question 9: Application

**Which data structure would you use to implement browser back/forward buttons?**

<details>
<summary>Click for answer</summary>

**Answer: Two Stacks**

**Implementation:**
- **Back Stack**: Stores previous pages
- **Forward Stack**: Stores pages for "forward" button

**Operations:**

1. **Visit new page:**
   ```
   Push current page to back_stack
   Clear forward_stack
   ```

2. **Click Back:**
   ```
   Pop from back_stack
   Push current page to forward_stack
   ```

3. **Click Forward:**
   ```
   Pop from forward_stack
   Push current page to back_stack
   ```

**Example:**
```
Visit: Page1 → Page2 → Page3

Back Stack: [Page1, Page2]
Current: Page3
Forward Stack: []

Click Back:
Back Stack: [Page1]
Current: Page2
Forward Stack: [Page3]

Click Forward:
Back Stack: [Page1, Page2]
Current: Page3
Forward Stack: []
```

**Why Stacks?** LIFO property perfect for back/forward navigation!
</details>

---

### Question 10: Priority Queue

**In a min-priority queue, you insert: 5, 2, 8, 1, 9. What order will they be removed?**

<details>
<summary>Click for answer</summary>

**Answer: 1, 2, 5, 8, 9** (ascending order)

**Min-Priority Queue:** Smallest priority value has highest priority

**Process:**
```
Insert 5:  Heap: [5]
Insert 2:  Heap: [2, 5]
Insert 8:  Heap: [2, 5, 8]
Insert 1:  Heap: [1, 2, 8, 5]  (heap reorders)
Insert 9:  Heap: [1, 2, 8, 5, 9]

Remove operations (pop min each time):
Pop: 1  →  Heap: [2, 5, 8, 9]
Pop: 2  →  Heap: [5, 9, 8]
Pop: 5  →  Heap: [8, 9]
Pop: 8  →  Heap: [9]
Pop: 9  →  Heap: []

Order: 1, 2, 5, 8, 9
```

**Use Case:** Job scheduling, Dijkstra's algorithm, Huffman coding
</details>

---

## 🎯 Key Takeaways

### Stacks (LIFO)
- ✅ Perfect for **reversing** operations
- ✅ **Function calls**, undo/redo, bracket matching
- ✅ All operations O(1)
- 📝 **Remember:** Last In, First Out

### Queues (FIFO)
- ✅ Perfect for **ordering** and **scheduling**
- ✅ **BFS**, task scheduling, buffer management
- ✅ All operations O(1) with proper implementation
- 📝 **Remember:** First In, First Out

### Circular Queue
- ✅ Efficient space usage
- ✅ No wasted space after dequeue
- ✅ Used in **buffering**, **streaming**

### Applications to Master
1. **Balanced Parentheses** - Stack
2. **Expression Evaluation** - Stack
3. **BFS Traversal** - Queue
4. **LRU Cache** - Queue + Hash Map
5. **Browser History** - Two Stacks

---

## 📚 Practice Resources

- **LeetCode Stack Problems:** 20+ problems
- **LeetCode Queue Problems:** 15+ problems
- **Must-solve:**
  - Valid Parentheses
  - Evaluate Reverse Polish Notation
  - Implement Queue using Stacks
  - LRU Cache
  - Sliding Window Maximum

---

**Next Steps:**
1. Implement both stack and queue from scratch
2. Solve balanced parentheses problem
3. Implement expression evaluation
4. Practice BFS using queue
5. Build LRU cache

**Remember:** Understanding when to use Stack vs Queue is more important than memorizing implementations. Focus on the LIFO vs FIFO principle!
