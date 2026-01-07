# Algorithm Complexity Analysis: Complete Guide

> **Module:** Data Structures & Algorithms  
> **Topic:** Introduction to Algorithm Analysis & Asymptotic Notations  
> **Duration:** 2 hours

## 📚 Table of Contents

1. [Introduction to Algorithm Analysis](#introduction)
2. [Asymptotic Notations](#asymptotic-notations)
3. [Big-O Notation (O)](#big-o-notation)
4. [Big-Omega Notation (Ω)](#big-omega-notation)
5. [Big-Theta Notation (Θ)](#big-theta-notation)
6. [Common Complexity Classes](#common-complexity-classes)
7. [Analyzing Loops](#analyzing-loops)
8. [Analyzing Recursion](#analyzing-recursion)
9. [Best, Average, and Worst Cases](#case-analysis)
10. [Practice Questions](#practice-questions)

---

## <a name="introduction"></a>1. Introduction to Algorithm Analysis

### What is Algorithm Analysis?

Algorithm analysis is the process of determining the **efficiency** of an algorithm in terms of:
- **Time Complexity**: How much time does the algorithm take?
- **Space Complexity**: How much memory does the algorithm use?

### Why is it Important?

- Choose the best algorithm for a problem
- Predict performance before implementation
- Optimize code for better efficiency
- Essential for technical interviews

### Measuring Efficiency

Instead of measuring actual time (which depends on hardware), we count the **number of operations** as a function of input size **n**.

---

## <a name="asymptotic-notations"></a>2. Asymptotic Notations

Asymptotic notation describes the **growth rate** of an algorithm's time or space requirements as the input size becomes very large.

![Complexity Notations Comparison](/home/kamal/.gemini/antigravity/brain/07277c88-112a-47e4-b745-38a0e2e4f61b/complexity_notation_comparison_1767808640132.png)

### The Three Main Notations

| Notation | Name | Represents | Used For |
|----------|------|------------|----------|
| **O** | Big-O | Upper Bound | Worst Case |
| **Ω** | Big-Omega | Lower Bound | Best Case |
| **Θ** | Big-Theta | Tight Bound | Average Case |

---

## <a name="big-o-notation"></a>3. Big-O Notation (O) - Upper Bound

### Definition

**Big-O** describes the **worst-case scenario** - the maximum time/space an algorithm might need.

> f(n) = O(g(n)) means f(n) grows **no faster than** g(n)

### Formal Definition

f(n) = O(g(n)) if there exist constants c > 0 and n₀ > 0 such that:

```
f(n) ≤ c · g(n) for all n ≥ n₀
```

### Example

If an algorithm takes at most **3n² + 5n + 10** operations:
- We say it's **O(n²)** because n² is the dominant term
- We ignore constants (3, 5, 10) and lower-order terms (5n, 10)

### Why Use Big-O?

- Focuses on **scalability** for large inputs
- Simplifies comparison between algorithms
- Industry standard for discussing performance

---

## <a name="big-omega-notation"></a>4. Big-Omega Notation (Ω) - Lower Bound

### Definition

**Big-Omega** describes the **best-case scenario** - the minimum time/space an algorithm needs.

> f(n) = Ω(g(n)) means f(n) grows **at least as fast as** g(n)

### Formal Definition

f(n) = Ω(g(n)) if there exist constants c > 0 and n₀ > 0 such that:

```
f(n) ≥ c · g(n) for all n ≥ n₀
```

### Example

**Linear Search** in an array:
- **Best case**: Element found at first position → Ω(1)
- Even in best case, we need at least 1 operation

---

## <a name="big-theta-notation"></a>5. Big-Theta Notation (Θ) - Tight Bound

### Definition

**Big-Theta** describes the **average-case** or when upper and lower bounds are the same.

> f(n) = Θ(g(n)) means f(n) grows **exactly like** g(n)

### Formal Definition

f(n) = Θ(g(n)) if f(n) = O(g(n)) AND f(n) = Ω(g(n))

### Example

**Printing all elements** of an array of size n:
- Best case: Must print n elements → Ω(n)
- Worst case: Must print n elements → O(n)
- Therefore: Θ(n) - tight bound

---

## <a name="common-complexity-classes"></a>6. Common Complexity Classes

![Algorithm Complexity Comparison](/home/kamal/.gemini/antigravity/brain/07277c88-112a-47e4-b745-38a0e2e4f61b/big_o_complexity_chart_1767808611791.png)

### Complexity Classes (Best to Worst)

| Complexity | Name | Example | Performance |
|------------|------|---------|-------------|
| **O(1)** | Constant | Accessing array element | Excellent ⭐⭐⭐⭐⭐ |
| **O(log n)** | Logarithmic | Binary search | Very Good ⭐⭐⭐⭐ |
| **O(n)** | Linear | Linear search | Good ⭐⭐⭐ |
| **O(n log n)** | Linearithmic | Merge sort, Quick sort | Acceptable ⭐⭐ |
| **O(n²)** | Quadratic | Bubble sort, Nested loops | Poor ⭐ |
| **O(n³)** | Cubic | 3 nested loops | Very Poor |
| **O(2ⁿ)** | Exponential | Recursive fibonacci | Terrible |
| **O(n!)** | Factorial | Generating permutations | Extremely Bad |

### Growth Comparison

For n = 1000:
- O(1) = 1 operation
- O(log n) ≈ 10 operations
- O(n) = 1,000 operations
- O(n log n) ≈ 10,000 operations
- O(n²) = 1,000,000 operations
- O(2ⁿ) = ... (impossibly huge!)

---

## <a name="analyzing-loops"></a>7. Analyzing Loops

![Loop Complexity Examples](/home/kamal/.gemini/antigravity/brain/07277c88-112a-47e4-b745-38a0e2e4f61b/loop_complexity_examples_1767808663491.png)

### Rule #1: Single Loop

```python
for i in range(n):
    print(i)  # O(1) operation
```

**Analysis:**
- Loop runs **n times**
- Each iteration: O(1)
- **Total: O(n)**

---

### Rule #2: Nested Loops

```python
for i in range(n):
    for j in range(n):
        print(i, j)  # O(1) operation
```

**Analysis:**
- Outer loop: n times
- Inner loop: n times for each outer iteration
- Total iterations: n × n = n²
- **Total: O(n²)**

---

### Rule #3: Sequential Loops

```python
for i in range(n):
    print(i)      # O(n)

for j in range(n):
    print(j)      # O(n)
```

**Analysis:**
- First loop: O(n)
- Second loop: O(n)
- Total: O(n) + O(n) = O(2n)
- **Simplified: O(n)** (drop constants)

---

### Rule #4: Dependent Nested Loops

```python
for i in range(n):
    for j in range(i):
        print(i, j)
```

**Analysis:**
- When i=0: inner loop runs 0 times
- When i=1: inner loop runs 1 time
- When i=2: inner loop runs 2 times
- ...
- When i=n-1: inner loop runs n-1 times
- Total: 0 + 1 + 2 + ... + (n-1) = n(n-1)/2 = (n² - n)/2
- **Total: O(n²)** (drop constants and lower terms)

---

### Rule #5: Logarithmic Loops

```python
i = 1
while i < n:
    print(i)
    i = i * 2  # or i *= 2
```

**Analysis:**
- i values: 1, 2, 4, 8, 16, ..., n
- i doubles each iteration
- After k iterations: i = 2^k
- When i ≥ n, loop stops: 2^k = n → k = log₂(n)
- **Total: O(log n)**

**Example:** Binary Search uses this pattern

---

### Rule #6: Three Nested Loops

```python
for i in range(n):
    for j in range(n):
        for k in range(n):
            print(i, j, k)
```

**Analysis:**
- Three loops, each running n times
- Total: n × n × n = n³
- **Total: O(n³)**

---

## <a name="analyzing-recursion"></a>8. Analyzing Recursion

![Recursion Tree - Factorial](/home/kamal/.gemini/antigravity/brain/07277c88-112a-47e4-b745-38a0e2e4f61b/recursion_tree_factorial_1767808684763.png)

### Method: Recursion Tree

To analyze recursive functions:
1. Draw the recursion tree
2. Count the number of function calls
3. Analyze work done at each call

---

### Example 1: Factorial (Linear Recursion)

```python
def factorial(n):
    if n == 0:  # Base case
        return 1
    return n * factorial(n - 1)  # Recursive call
```

**Analysis:**
- Makes n recursive calls: fact(n) → fact(n-1) → ... → fact(0)
- Each call does O(1) work
- **Total: O(n)**

---

### Example 2: Binary Search (Logarithmic Recursion)

```python
def binary_search(arr, target, left, right):
    if left > right:
        return -1
    
    mid = (left + right) // 2
    
    if arr[mid] == target:
        return mid
    elif arr[mid] > target:
        return binary_search(arr, target, left, mid - 1)
    else:
        return binary_search(arr, target, mid + 1, right)
```

**Analysis:**
- Each call searches half the array
- Reduces problem size by half each time
- Makes log₂(n) calls
- **Total: O(log n)**

---

### Example 3: Fibonacci (Exponential Recursion)

```python
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n - 1) + fibonacci(n - 2)
```

**Analysis:**
- Each call makes 2 recursive calls
- Creates a binary tree of calls
- Tree height: n, nodes at level i: 2^i
- Total calls: 1 + 2 + 4 + ... + 2^n ≈ 2^n
- **Total: O(2ⁿ)** - VERY SLOW!

---

### Example 4: Merge Sort (Divide & Conquer)

```python
def merge_sort(arr):
    if len(arr) <= 1:
        return arr
    
    mid = len(arr) // 2
    left = merge_sort(arr[:mid])    # T(n/2)
    right = merge_sort(arr[mid:])   # T(n/2)
    
    return merge(left, right)       # O(n)
```

**Analysis:**
Using recurrence relation:
- T(n) = 2T(n/2) + O(n)
- Height of tree: log n
- Work at each level: n
- Total: n × log n
- **Total: O(n log n)**

---

## <a name="case-analysis"></a>9. Best, Average, and Worst Case Analysis

### Linear Search Example

```python
def linear_search(arr, target):
    for i in range(len(arr)):
        if arr[i] == target:
            return i
    return -1
```

### Case Analysis

| Case | Scenario | Complexity | Notation |
|------|----------|------------|----------|
| **Best Case** | Element at first position | 1 comparison | Ω(1) |
| **Average Case** | Element in middle (on average) | n/2 comparisons | Θ(n) |
| **Worst Case** | Element at end or not present | n comparisons | O(n) |

### When to Use Each?

- **Best Case (Ω)**: Rarely used, optimistic scenario
- **Worst Case (O)**: Most commonly used, guarantees performance
- **Average Case (Θ)**: Useful when typical behavior matters

---

## <a name="practice-questions"></a>10. Practice Questions

### Question 1: Basic Understanding

**What is the time complexity of accessing an element in an array by index?**

```python
value = arr[5]
```

<details>
<summary>Click for answer</summary>

**Answer: O(1)** - Constant time

Array elements are stored in contiguous memory. Accessing by index is a single operation regardless of array size.
</details>

---

### Question 2: Simple Loop

**What is the time complexity of this code?**

```python
def print_numbers(n):
    for i in range(n):
        print(i)
```

<details>
<summary>Click for answer</summary>

**Answer: O(n)** - Linear time

The loop runs exactly n times, each iteration does O(1) work.
</details>

---

### Question 3: Nested Loops

**What is the time complexity?**

```python
def print_pairs(n):
    for i in range(n):
        for j in range(n):
            print(i, j)
```

<details>
<summary>Click for answer</summary>

**Answer: O(n²)** - Quadratic time

Outer loop: n iterations  
Inner loop: n iterations for each outer  
Total: n × n = n²
</details>

---

### Question 4: Multiple Loops

**What is the time complexity?**

```python
def process(n):
    # Loop 1
    for i in range(n):
        print(i)
    
    # Loop 2
    for j in range(n):
        for k in range(n):
            print(j, k)
```

<details>
<summary>Click for answer</summary>

**Answer: O(n²)**

Loop 1: O(n)  
Loop 2: O(n²)  
Total: O(n) + O(n²) = O(n²)  

We keep the dominant term (n²).
</details>

---

### Question 5: Dependent Loop

**What is the time complexity?**

```python
def triangle(n):
    for i in range(n):
        for j in range(i + 1):
            print("*", end="")
        print()
```

<details>
<summary>Click for answer</summary>

**Answer: O(n²)**

Iterations:
- i=0: 1 time
- i=1: 2 times
- i=2: 3 times
- ...
- i=n-1: n times

Total: 1 + 2 + 3 + ... + n = n(n+1)/2 = O(n²)
</details>

---

### Question 6: Logarithmic Pattern

**What is the time complexity?**

```python
def halving(n):
    i = n
    while i > 0:
        print(i)
        i = i // 2
```

<details>
<summary>Click for answer</summary>

**Answer: O(log n)**

i values: n, n/2, n/4, n/8, ..., 1  
Each iteration divides by 2  
Number of iterations = log₂(n)
</details>

---

### Question 7: Recursion Analysis

**What is the time complexity?**

```python
def sum_array(arr, n):
    if n <= 0:
        return 0
    return arr[n-1] + sum_array(arr, n-1)
```

<details>
<summary>Click for answer</summary>

**Answer: O(n)**

Makes n recursive calls (one for each element).  
Each call does O(1) work.  
Total: O(n)
</details>

---

### Question 8: Complex Example

**What is the time complexity?**

```python
def mystery(n):
    count = 0
    for i in range(n):
        j = 1
        while j < n:
            count += 1
            j *= 2
    return count
```

<details>
<summary>Click for answer</summary>

**Answer: O(n log n)**

Outer loop: runs n times  
Inner while loop: runs log(n) times (j doubles each time)  
Total: n × log(n) = O(n log n)
</details>

---

### Question 9: Best/Worst Case

**For the following code, what are the best and worst case complexities?**

```python
def find_duplicate(arr):
    for i in range(len(arr)):
        for j in range(i + 1, len(arr)):
            if arr[i] == arr[j]:
                return True
    return False
```

<details>
<summary>Click for answer</summary>

**Best Case: Ω(1)**  
If first two elements are duplicates, returns immediately.

**Worst Case: O(n²)**  
If no duplicates or duplicate at end, checks all pairs.  
Number of pairs = n(n-1)/2 = O(n²)
</details>

---

### Question 10: Which is Better?

**Algorithm A:** O(n log n) for all cases  
**Algorithm B:** Best O(n), Average O(n log n), Worst O(n²)

**Which algorithm would you choose and why?**

<details>
<summary>Click for answer</summary>

**Answer: Usually Algorithm A**

**Reasons:**
- Predictable performance
- Guaranteed O(n log n) even in worst case
- Algorithm B could degrade to O(n²) on certain inputs

**When to choose B:**
- If you know your data will trigger best/average case
- If best case O(n) is critical for your use case

**In interviews:** Prefer consistent performance (Algorithm A).
</details>

---

## 🎯 Key Takeaways

1. **Big-O (O)** = Worst case (upper bound) - Most commonly used
2. **Big-Omega (Ω)** = Best case (lower bound)
3. **Big-Theta (Θ)** = Average case (tight bound)

4. **Drop constants:** O(3n) → O(n)
5. **Keep dominant term:** O(n² + n) → O(n²)
6. **fokus on large n:** Asymptotic behavior matters

7. **Common patterns:**
   - Single loop → O(n)
   - Nested loops → multiply complexities
   - Dividing problem in half → O(log n)
   - Recursion → draw tree, count calls

---

## 📚 Additional Resources

- Practice more on [LeetCode](https://leetcode.com/)
- Visualize algorithms at [VisuAlgo](https://visualgo.net/)
- Read: "Introduction to Algorithms" (CLRS)

---

**Next Steps:** Practice analyzing complexity of algorithms you encounter. Focus on identifying patterns (loops, recursion, divide-and-conquer) and applying the rules systematically.

**Remember:** In technical interviews, always discuss time and space complexity of your solutions!
