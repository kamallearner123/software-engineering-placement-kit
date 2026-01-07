# Arrays and Strings: Complete Guide

> **Module:** Data Structures & Algorithms  
> **Topic:** Arrays, Strings, Searching, Sorting, and Sliding Window Technique  
> **Duration:** 2 hours

## 📚 Table of Contents

1. [Introduction to Arrays](#introduction-arrays)
2. [Array Operations](#array-operations)
3. [Searching Algorithms](#searching-algorithms)
4. [Sorting Algorithms](#sorting-algorithms)
5. [String Fundamentals](#strings)
6. [String Manipulation Techniques](#string-manipulation)
7. [Sliding Window Technique](#sliding-window)
8. [Practice Questions](#practice-questions)

---

## <a name="introduction-arrays"></a>1. Introduction to Arrays

### What is an Array?

An **array** is a collection of elements stored in **contiguous memory locations**. All elements are of the same data type and accessed by an index.

### Key Characteristics

- **Fixed size** (in most languages like C/C++)
- **Random access**: O(1) time to access any element
- **Indexed from 0** in most programming languages
- **Homogeneous**: All elements of same type

### Array Declaration

```python
# Python
arr = [12, 5, 23, 8, 15, 3, 19]

# C/C++
int arr[7] = {12, 5, 23, 8, 15, 3, 19};

# Java
int[] arr = {12, 5, 23, 8, 15, 3, 19};
```

---

## <a name="array-operations"></a>2. Array Operations

![Array Operations](/home/kamal/.gemini/antigravity/brain/07277c88-112a-47e4-b745-38a0e2e4f61b/array_operations_visual_1767809640256.png)

### 2.1 Indexing (Access)

Accessing an element by its index.

**Time Complexity:** O(1) - Constant time

```python
def access_element(arr, index):
    """Access element at given index"""
    if 0 <= index < len(arr):
        return arr[index]
    return None

# Example
arr = [12, 5, 23, 8, 15, 3, 19]
print(arr[3])  # Output: 8
```

**Why O(1)?**
- Memory address = base_address + (index × element_size)
- Direct calculation, no iteration needed

---

### 2.2 Insertion

Adding an element at a specific position.

**Time Complexity:** 
- At end: O(1) (if space available)
- At beginning/middle: O(n) (requires shifting)

```python
def insert_element(arr, index, value):
    """Insert element at given index"""
    # Method 1: Using list insert (Python)
    arr.insert(index, value)
    return arr

# Example
arr = [12, 5, 23, 8, 15, 3, 19]
arr = insert_element(arr, 2, 11)
print(arr)  # [12, 5, 11, 23, 8, 15, 3, 19]
```

**Manual Implementation:**
```python
def insert_manual(arr, index, value, size):
    """Insert with manual shifting"""
    # Shift elements to the right
    for i in range(size - 1, index - 1, -1):
        arr[i + 1] = arr[i]
    
    # Insert new element
    arr[index] = value
    return arr
```

---

### 2.3 Deletion

Removing an element from a specific position.

**Time Complexity:** O(n) (requires shifting elements)

```python
def delete_element(arr, index):
    """Delete element at given index"""
    if 0 <= index < len(arr):
        arr.pop(index)
    return arr

# Example
arr = [12, 5, 23, 8, 15, 3, 19]
arr = delete_element(arr, 4)
print(arr)  # [12, 5, 23, 8, 3, 19]
```

---

### 2.4 Traversal

Visiting each element in the array.

**Time Complexity:** O(n)

```python
def traverse_array(arr):
    """Print all elements"""
    for element in arr:
        print(element, end=" ")
    print()

# Alternative with index
def traverse_with_index(arr):
    for i in range(len(arr)):
        print(f"arr[{i}] = {arr[i]}")
```

---

## <a name="searching-algorithms"></a>3. Searching Algorithms

![Search Algorithms Comparison](/home/kamal/.gemini/antigravity/brain/07277c88-112a-47e4-b745-38a0e2e4f61b/searching_algorithms_comparison_1767809667722.png)

### 3.1 Linear Search

Search by checking each element sequentially.

**Time Complexity:** 
- Best: O(1) - element at first position
- Average: O(n/2) = O(n)
- Worst: O(n) - element at end or not found

**Space Complexity:** O(1)

```python
def linear_search(arr, target):
    """
    Find target in array using linear search
    Returns: index if found, -1 otherwise
    """
    for i in range(len(arr)):
        if arr[i] == target:
            return i
    return -1

# Example
arr = [5, 12, 18, 23, 29, 34]
result = linear_search(arr, 23)
print(f"Found at index: {result}")  # Found at index: 3
```

**When to Use:**
- Small arrays
- Unsorted arrays
- Simple implementation needed

---

### 3.2 Binary Search

Search by repeatedly dividing sorted array in half.

**Prerequisite:** Array must be **sorted**

**Time Complexity:** 
- Best: O(1) - element at middle
- Average: O(log n)
- Worst: O(log n)

**Space Complexity:** 
- Iterative: O(1)
- Recursive: O(log n) - call stack

#### Iterative Implementation

```python
def binary_search(arr, target):
    """
    Binary search - iterative version
    Returns: index if found, -1 otherwise
    """
    left, right = 0, len(arr) - 1
    
    while left <= right:
        mid = (left + right) // 2
        
        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            left = mid + 1  # Search right half
        else:
            right = mid - 1  # Search left half
    
    return -1

# Example
arr = [5, 12, 18, 23, 29, 34]
result = binary_search(arr, 23)
print(f"Found at index: {result}")  # Found at index: 3
```

#### Recursive Implementation

```python
def binary_search_recursive(arr, target, left, right):
    """Binary search - recursive version"""
    if left > right:
        return -1
    
    mid = (left + right) // 2
    
    if arr[mid] == target:
        return mid
    elif arr[mid] < target:
        return binary_search_recursive(arr, target, mid + 1, right)
    else:
        return binary_search_recursive(arr, target, left, mid - 1)

# Example
arr = [5, 12, 18, 23, 29, 34]
result = binary_search_recursive(arr, 23, 0, len(arr) - 1)
print(f"Found at index: {result}")
```

**When to Use:**
- Large sorted arrays
- Need O(log n) performance
- Repeated searches on same data

---

## <a name="sorting-algorithms"></a>4. Sorting Algorithms

### 4.1 Bubble Sort

Repeatedly swap adjacent elements if they're in wrong order.

**Time Complexity:**
- Best: O(n) - already sorted (with optimization)
- Average: O(n²)
- Worst: O(n²)

**Space Complexity:** O(1) - in-place sorting

**Visual Representation:**
```
Pass 1: [5, 2, 8, 1, 9]  →  [2, 5, 1, 8, 9]
Pass 2: [2, 5, 1, 8, 9]  →  [2, 1, 5, 8, 9]
Pass 3: [2, 1, 5, 8, 9]  →  [1, 2, 5, 8, 9]
Pass 4: [1, 2, 5, 8, 9]  →  [1, 2, 5, 8, 9] ✓ Sorted
```

```python
def bubble_sort(arr):
    """
    Bubble sort implementation
    """
    n = len(arr)
    
    for i in range(n):
        swapped = False
        
        # Last i elements are already sorted
        for j in range(0, n - i - 1):
            # Swap if current > next
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
                swapped = True
        
        # Optimization: stop if no swaps occurred
        if not swapped:
            break
    
    return arr

# Example
arr = [64, 34, 25, 12, 22, 11, 90]
sorted_arr = bubble_sort(arr.copy())
print(sorted_arr)  # [11, 12, 22, 25, 34, 64, 90]
```

---

### 4.2 Selection Sort

Find minimum element and place it at the beginning.

**Time Complexity:** O(n²) for all cases

**Space Complexity:** O(1)

**Visual Representation:**
```
[64, 25, 12, 22, 11]  →  [11, 25, 12, 22, 64]  (min: 11)
[11, 25, 12, 22, 64]  →  [11, 12, 25, 22, 64]  (min: 12)
[11, 12, 25, 22, 64]  →  [11, 12, 22, 25, 64]  (min: 22)
[11, 12, 22, 25, 64]  →  [11, 12, 22, 25, 64]  (min: 25)
```

```python
def selection_sort(arr):
    """
    Selection sort implementation
    """
    n = len(arr)
    
    for i in range(n):
        # Find minimum element in unsorted portion
        min_idx = i
        for j in range(i + 1, n):
            if arr[j] < arr[min_idx]:
                min_idx = j
        
        # Swap minimum with first unsorted element
        arr[i], arr[min_idx] = arr[min_idx], arr[i]
    
    return arr

# Example
arr = [64, 25, 12, 22, 11]
sorted_arr = selection_sort(arr.copy())
print(sorted_arr)  # [11, 12, 22, 25, 64]
```

---

### 4.3 Insertion Sort

Build sorted array one element at a time by inserting each element in its correct position.

**Time Complexity:**
- Best: O(n) - already sorted
- Average: O(n²)
- Worst: O(n²) - reverse sorted

**Space Complexity:** O(1)

**Visual Representation:**
```
[12, 11, 13, 5, 6]
[12] | 11, 13, 5, 6      →  [11, 12] | 13, 5, 6
[11, 12] | 13, 5, 6      →  [11, 12, 13] | 5, 6
[11, 12, 13] | 5, 6      →  [5, 11, 12, 13] | 6
[5, 11, 12, 13] | 6      →  [5, 6, 11, 12, 13] ✓
```

```python
def insertion_sort(arr):
    """
    Insertion sort implementation
    """
    for i in range(1, len(arr)):
        key = arr[i]
        j = i - 1
        
        # Move elements greater than key one position ahead
        while j >= 0 and arr[j] > key:
            arr[j + 1] = arr[j]
            j -= 1
        
        # Place key in correct position
        arr[j + 1] = key
    
    return arr

# Example
arr = [12, 11, 13, 5, 6]
sorted_arr = insertion_sort(arr.copy())
print(sorted_arr)  # [5, 6, 11, 12, 13]
```

### Sorting Algorithm Comparison

| Algorithm | Best | Average | Worst | Space | Stable? |
|-----------|------|---------|-------|-------|---------|
| Bubble Sort | O(n) | O(n²) | O(n²) | O(1) | Yes |
| Selection Sort | O(n²) | O(n²) | O(n²) | O(1) | No |
| Insertion Sort | O(n) | O(n²) | O(n²) | O(1) | Yes |
| Merge Sort | O(n log n) | O(n log n) | O(n log n) | O(n) | Yes |
| Quick Sort | O(n log n) | O(n log n) | O(n²) | O(log n) | No |

---

## <a name="strings"></a>5. String Fundamentals

### What is a String?

A **string** is a sequence of characters. In most languages, strings are implemented as arrays of characters.

```python
# Python - strings are immutable
s = "Hello"

# C - strings are character arrays
char s[] = "Hello";  // ends with '\0'

# C++
std::string s = "Hello";
```

### String Properties

- **Immutable** in Python, Java
- **Mutable** in C, C++ (character arrays)
- **Indexed** like arrays
- End with null character `\0` in C/C++

---

## <a name="string-manipulation"></a>6. String Manipulation Techniques

### 6.1 Palindrome Check

A palindrome reads the same forwards and backwards.

**Examples:** "racecar", "madam", "level"

#### Two-Pointer Approach

**Time Complexity:** O(n)
**Space Complexity:** O(1)

```python
def is_palindrome(s):
    """
    Check if string is palindrome using two pointers
    """
    left, right = 0, len(s) - 1
    
    while left < right:
        if s[left] != s[right]:
            return False
        left += 1
        right -= 1
    
    return True

# Examples
print(is_palindrome("racecar"))  # True
print(is_palindrome("hello"))    # False
print(is_palindrome("A man a plan a canal Panama".replace(" ", "").lower()))  # True
```

**Visual Process:**
```
String: "RACECAR"
Step 1: R == R ✓ (left=0, right=6)
Step 2: A == A ✓ (left=1, right=5)
Step 3: C == C ✓ (left=2, right=4)
Step 4: E       (left=3, center reached)
Result: Palindrome
```

#### Reverse and Compare

```python
def is_palindrome_reverse(s):
    """Check palindrome by reversing"""
    return s == s[::-1]

print(is_palindrome_reverse("racecar"))  # True
```

---

### 6.2 Substring Search

Find if a pattern exists within a string.

#### Naive Approach

**Time Complexity:** O(n × m) where n = text length, m = pattern length

```python
def substring_search(text, pattern):
    """
    Find pattern in text
    Returns: starting index if found, -1 otherwise
    """
    n = len(text)
    m = len(pattern)
    
    # Check each possible starting position
    for i in range(n - m + 1):
        # Check if pattern matches at position i
        match = True
        for j in range(m):
            if text[i + j] != pattern[j]:
                match = False
                break
        
        if match:
            return i
    
    return -1

# Example
text = "hello world"
pattern = "world"
result = substring_search(text, pattern)
print(f"Pattern found at index: {result}")  # 6
```

#### Python Built-in

```python
def find_substring(text, pattern):
    """Using Python's built-in find"""
    return text.find(pattern)  # Returns -1 if not found

# or
def contains_substring(text, pattern):
    """Using 'in' operator"""
    return pattern in text  # Returns boolean
```

---

### 6.3 Character Frequency Count

Count occurrences of each character.

```python
def char_frequency(s):
    """
    Count frequency of each character
    Returns: dictionary with counts
    """
    freq = {}
    
    for char in s:
        freq[char] = freq.get(char, 0) + 1
    
    return freq

# Example
s = "programming"
print(char_frequency(s))
# {'p': 1, 'r': 2, 'o': 1, 'g': 2, 'a': 1, 'm': 2, 'i': 1, 'n': 1}

# Using Counter (Python)
from collections import Counter
print(Counter(s))
```

---

### 6.4 Anagram Check

Two strings are anagrams if they contain same characters with same frequencies.

**Examples:** "listen" and "silent", "evil" and "live"

```python
def are_anagrams(s1, s2):
    """
    Check if two strings are anagrams
    """
    # Method 1: Sort and compare
    return sorted(s1) == sorted(s2)

# Method 2: Character frequency
def are_anagrams_freq(s1, s2):
    if len(s1) != len(s2):
        return False
    
    from collections import Counter
    return Counter(s1) == Counter(s2)

# Examples
print(are_anagrams("listen", "silent"))  # True
print(are_anagrams("hello", "world"))    # False
```

---

## <a name="sliding-window"></a>7. Sliding Window Technique

The **sliding window** technique is used to solve problems involving subarrays or substrings efficiently.

### Concept

Instead of recalculating for each subarray, maintain a "window" and slide it across the array.

**Visual Example:**
```
Array: [2, 1, 5, 1, 3, 2]  Window size k = 3

Window 1: [2, 1, 5] → sum = 8
Window 2:    [1, 5, 1] → sum = 7
Window 3:       [5, 1, 3] → sum = 9  ← Maximum
Window 4:          [1, 3, 2] → sum = 6
```

---

### 7.1 Maximum Sum Subarray of Size K

Find maximum sum of any contiguous subarray of size k.

**Naive Approach:** O(n × k)
**Sliding Window:** O(n)

```python
def max_sum_subarray_naive(arr, k):
    """
    Naive approach - O(n × k)
    """
    n = len(arr)
    max_sum = float('-inf')
    
    for i in range(n - k + 1):
        current_sum = sum(arr[i:i + k])
        max_sum = max(max_sum, current_sum)
    
    return max_sum

def max_sum_subarray_sliding(arr, k):
    """
    Sliding window approach - O(n)
    """
    n = len(arr)
    if n < k:
        return None
    
    # Calculate sum of first window
    window_sum = sum(arr[:k])
    max_sum = window_sum
    
    # Slide the window
    for i in range(k, n):
        # Remove leftmost element, add rightmost element
        window_sum = window_sum - arr[i - k] + arr[i]
        max_sum = max(max_sum, window_sum)
    
    return max_sum

# Example
arr = [2, 1, 5, 1, 3, 2]
k = 3
print(max_sum_subarray_sliding(arr, k))  # 9 (from [5, 1, 3])
```

**How It Works:**
```
Initial window: [2, 1, 5], sum = 8

Slide 1: Remove 2, Add 1
         [1, 5, 1], sum = 8 - 2 + 1 = 7

Slide 2: Remove 1, Add 3
         [5, 1, 3], sum = 7 - 1 + 3 = 9 ✓

Slide 3: Remove 5, Add 2
         [1, 3, 2], sum = 9 - 5 + 2 = 6
```

---

### 7.2 Longest Substring Without Repeating Characters

Find length of longest substring with all unique characters.

**Example:** "abcabcbb" → "abc" (length 3)

**Time Complexity:** O(n)
**Space Complexity:** O(min(n, m)) where m = character set size

```python
def longest_substring_no_repeats(s):
    """
    Find longest substring without repeating characters
    """
    char_set = set()
    left = 0
    max_length = 0
    
    for right in range(len(s)):
        # If character already in window, shrink from left
        while s[right] in char_set:
            char_set.remove(s[left])
            left += 1
        
        # Add current character
        char_set.add(s[right])
        
        # Update max length
        max_length = max(max_length, right - left + 1)
    
    return max_length

# Examples
print(longest_substring_no_repeats("abcabcbb"))  # 3 ("abc")
print(longest_substring_no_repeats("bbbbb"))     # 1 ("b")
print(longest_substring_no_repeats("pwwkew"))    # 3 ("wke")
```

**Process Visualization:**
```
String: "abcabcbb"

Step 1: "a" → length = 1, set = {a}
Step 2: "ab" → length = 2, set = {a, b}
Step 3: "abc" → length = 3, set = {a, b, c}
Step 4: "abca" → duplicate 'a', remove left side
        "bca" → length = 3, set = {b, c, a}
Step 5: "bcab" → duplicate 'b', remove left side
        "cab" → length = 3, set = {c, a, b}
...

Maximum length = 3
```

---

### 7.3 Minimum Window Substring

Find smallest window containing all characters of pattern.

```python
def min_window_substring(s, t):
    """
    Find minimum window in s containing all characters of t
    """
    from collections import Counter
    
    if not t or not s:
        return ""
    
    # Character frequency in pattern
    dict_t = Counter(t)
    required = len(dict_t)
    
    # Sliding window
    left, right = 0, 0
    formed = 0  # Characters matched
    window_counts = {}
    
    # Result: (window length, left, right)
    ans = float("inf"), None, None
    
    while right < len(s):
        # Add character from right
        char = s[right]
        window_counts[char] = window_counts.get(char, 0) + 1
        
        if char in dict_t and window_counts[char] == dict_t[char]:
            formed += 1
        
        # Try to shrink window from left
        while left <= right and formed == required:
            char = s[left]
            
            # Update result if smaller window found
            if right - left + 1 < ans[0]:
                ans = (right - left + 1, left, right)
            
            # Remove from left
            window_counts[char] -= 1
            if char in dict_t and window_counts[char] < dict_t[char]:
                formed -= 1
            
            left += 1
        
        right += 1
    
    # Return minimum window or empty string
    return "" if ans[0] == float("inf") else s[ans[1]:ans[2] + 1]

# Example
s = "ADOBECODEBANC"
t = "ABC"
print(min_window_substring(s, t))  # "BANC"
```

---

## <a name="practice-questions"></a>8. Practice Questions

### Question 1: Array Basics

**What is the time complexity of accessing an element in an array by index?**

<details>
<summary>Click for answer</summary>

**Answer: O(1)**

Arrays store elements in contiguous memory. The address of any element can be calculated directly:
```
address = base_address + (index × element_size)
```
No iteration needed, hence constant time.
</details>

---

### Question 2: Linear Search

**Find the target value 23 in array [5, 12, 18, 23, 29, 34]. How many comparisons are needed using linear search?**

<details>
<summary>Click for answer</summary>

**Answer: 4 comparisons**

Linear search checks each element sequentially:
1. Compare with 5 (not found)
2. Compare with 12 (not found)
3. Compare with 18 (not found)
4. Compare with 23 (found! ✓)

Total comparisons = 4
</details>

---

### Question 3: Binary Search

**For the same array [5, 12, 18, 23, 29, 34] and target 23, how many comparisons using binary search?**

<details>
<summary>Click for answer</summary>

**Answer: 2 comparisons**

Binary search process:
1. Mid = index 2 (value 18), 18 < 23, search right half [23, 29, 34]
2. Mid = index 3 (value 23), found! ✓

Total comparisons = 2

Binary search is much more efficient than linear search for sorted arrays!
</details>

---

### Question 4: Bubble Sort

**Sort [5, 2, 8, 1] using bubble sort. How many swaps?**

<details>
<summary>Click for answer</summary>

**Answer: 4 swaps**

```
Initial: [5, 2, 8, 1]

Pass 1:
  5 > 2, swap → [2, 5, 8, 1]  (swap 1)
  5 < 8, no swap
  8 > 1, swap → [2, 5, 1, 8]  (swap 2)

Pass 2:
  2 < 5, no swap
  5 > 1, swap → [2, 1, 5, 8]  (swap 3)

Pass 3:
  2 > 1, swap → [1, 2, 5, 8]  (swap 4)

Pass 4:
  No swaps needed, sorted!

Total swaps = 4
```
</details>

---

### Question 5: Palindrome

**Is "A man, a plan, a canal: Panama" a palindrome?**

<details>
<summary>Click for answer</summary>

**Answer: Yes**

Removing spaces and punctuation, and converting to lowercase:
```
"amanaplanacanalpanama"
```

Reading forward: "amanaplanacanalpanama"
Reading backward: "amanaplanacanalpanama"

They match, so it's a palindrome! ✓
</details>

---

### Question 6: Anagrams

**Are "listen" and "silent" anagrams?**

<details>
<summary>Click for answer</summary>

**Answer: Yes**

Character frequency analysis:
```
"listen": {l:1, i:1, s:1, t:1, e:1, n:1}
"silent": {s:1, i:1, l:1, e:1, n:1, t:1}
```

Both have the same characters with same frequencies! ✓

Alternative check: Sort both strings
- sorted("listen") = "eilnst"
- sorted("silent") = "eilnst"

They match, so they're anagrams!
</details>

---

### Question 7: Sliding Window

**Find maximum sum of subarray of size 3 in [2, 1, 5, 1, 3, 2]**

<details>
<summary>Click for answer</summary>

**Answer: 9 (from subarray [5, 1, 3])**

Using sliding window:
```
Window 1: [2, 1, 5] → sum = 8
Window 2: [1, 5, 1] → sum = 7
Window 3: [5, 1, 3] → sum = 9 ✓ Maximum
Window 4: [1, 3, 2] → sum = 6

Maximum sum = 9
```

**Time Complexity:** O(n) using sliding window
(vs O(n×k) using naive approach)
</details>

---

### Question 8: Substring Without Repeats

**Find length of longest substring without repeating characters in "abcabcbb"**

<details>
<summary>Click for answer</summary>

**Answer: 3 (substring "abc")**

Process:
```
a → length 1, chars: {a}
ab → length 2, chars: {a, b}
abc → length 3, chars: {a, b, c}  ✓ Max so far
abca → 'a' repeats, remove first 'a'
  → bca, length 3
bcab → 'b' repeats, remove 'b'
  → cab, length 3
...
```

Maximum length = 3
Possible substrings: "abc", "bca", "cab"
</details>

---

### Question 9: Binary Search Prerequisite

**Can you use binary search on the array [12, 5, 23, 8, 15]? Why or why not?**

<details>
<summary>Click for answer</summary>

**Answer: No**

Binary search requires a **sorted array**. The given array [12, 5, 23, 8, 15] is **not sorted**.

**What to do:**
1. First sort the array: [5, 8, 12, 15, 23]
2. Then apply binary search

**Alternative:** Use linear search on unsorted arrays.
</details>

---

### Question 10: Algorithm Selection

**You need to search for an element in an array 1000 times. The array has 1 million elements. Should you use:**
- A) Linear search
- B) Sort once, then binary search
- C) Use hash table

<details>
<summary>Click for answer</summary>

**Answer: C) Hash table (or B if hash table not available)**

**Analysis:**

**Option A - Linear Search:**
- Each search: O(n) = O(1,000,000)
- Total: 1000 × O(n) = O(1,000,000,000)
- Very slow! ❌

**Option B - Sort + Binary Search:**
- Sort once: O(n log n) ≈ O(20,000,000)
- Each search: O(log n) ≈ O(20)
- Total: O(20,000,000) + 1000 × O(20) = O(20,020,000)
- Much better! ✓

**Option C - Hash Table:**
- Build hash table: O(n) = O(1,000,000)
- Each search: O(1)
- Total: O(1,000,000) + 1000 × O(1) = O(1,001,000)
- Best option! ✓✓✓

**Conclusion:** Use hash table for frequent lookups!
</details>

---

## 🎯 Key Takeaways

### Arrays
1. **Random access** in O(1) time
2. **Insertion/Deletion** in middle is O(n) due to shifting
3. **Fixed size** in most languages (dynamic in Python, Java ArrayList)

### Searching
1. **Linear Search:** O(n), works on unsorted arrays
2. **Binary Search:** O(log n), requires sorted array
3. Binary search is much faster for large sorted datasets

### Sorting
1. **Simple sorts** (Bubble, Selection, Insertion): O(n²)
2. **Efficient sorts** (Merge, Quick, Heap): O(n log n)
3. Choose based on: data size, already sorted?, stable needed?

### Strings
1. **Palindrome:** Use two pointers, O(n) time
2. **Anagrams:** Sort or frequency count
3. **Substring search:** Naive O(n×m), advanced algorithms available

### Sliding Window
1. **Technique:** Maintain window, slide instead of recalculating
2. **Saves time:** O(n×k) → O(n)
3. **Use cases:** Fixed/variable size windows, optimization problems

---

## 📚 Practice Resources

- **LeetCode:** Arrays and Strings tagged problems
- **HackerRank:** Arrays, Strings sections
- **GeeksforGeeks:** Sliding Window problems

---

**Next Steps:** 
- Practice implementing each algorithm
- Solve 5-10 problems from each category
- Focus on optimization using appropriate techniques
- Master sliding window for interview success!

**Remember:** Understanding the logic is more important than memorizing code. Practice until the patterns become natural!
