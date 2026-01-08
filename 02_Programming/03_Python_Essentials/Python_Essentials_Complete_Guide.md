# Python Essentials: Complete Guide

> **Module:** Programming - C/C++/Python Efficient Coding  
> **Topic:** Python for Coding Interviews and Efficient Problem Solving  
> **Duration:** 2 hours

## 📚 Table of Contents

1. [Why Python for Interviews](#why-python)
2. [Python Basics](#basics)
3. [Data Structures](#data-structures)
4. [List Comprehensions](#comprehensions)
5. [String Operations](#strings)
6. [Built-in Functions](#built-ins)
7. [File Handling](#files)
8. [Command Line Arguments](#cli)
9. [Interview Questions](#interview-questions)
10. [MCQs](#mcqs)
11. [Practice Challenges](#challenges)
12. [References](#references)

---

## <a name="why-python"></a>1. Why Python for Interviews?

✅ **Concise syntax** - Write less, do more  
✅ **Rich standard library** - Built-in data structures  
✅ **Dynamic typing** - Focus on logic, not types  
✅ **Interviewer-friendly** - Easy to read and understand  
✅ **Fast prototyping** - Quick to implement solutions

---

## <a name="basics"></a>2. Python Basics

### 2.1 Variables and Data Types

```python
# Dynamic typing - no type declaration needed
x = 10              # int
y = 3.14            # float
name = "Alice"      # str
is_valid = True     # bool
items = [1, 2, 3]   # list

# Multiple assignment
a, b, c = 1, 2, 3
x = y = z = 0

# Type checking
type(x)             # <class 'int'>
isinstance(x, int)  # True
```

### 2.2 Input/Output

```python
# Input
name = input("Enter name: ")        # Returns string
age = int(input("Enter age: "))     # Convert to int

# Output
print("Hello", name)
print(f"Age: {age}")                # f-string (Python 3.6+)
print("Value: {}".format(age))      # format()
print("x=%d, y=%d" % (x, y))        # old style
```

### 2.3 Operators

```python
# Arithmetic
10 + 3    # 13
10 - 3    # 7
10 * 3    # 30
10 / 3    # 3.333... (float division)
10 // 3   # 3 (integer division)
10 % 3    # 1 (modulo)
10 ** 3   # 1000 (power)

# Comparison
==, !=, <, >, <=, >=

# Logical
and, or, not

# Membership
'a' in 'abc'        # True
2 in [1, 2, 3]       # True

# Identity
x is y              # Same object
x is not y
```

### 2.4 Control Flow

```python
# if-elif-else
if score >= 90:
    grade = 'A'
elif score >= 80:
    grade = 'B'
else:
    grade = 'C'

# for loop
for i in range(5):          # 0,1,2,3,4
    print(i)

for item in [1, 2, 3]:
    print(item)

# while loop
while condition:
    # code

# break, continue
for i in range(10):
    if i == 5:
        break               # Exit loop
    if i % 2 == 0:
        continue            # Skip to next iteration
```

---

## <a name="data-structures"></a>3. Data Structures

### 3.1 Lists (Mutable, Ordered)

```python
# Creation
nums = [1, 2, 3, 4, 5]
mixed = [1, "hello", True, 3.14]
empty = []

# Access
nums[0]        # 1 (first)
nums[-1]       # 5 (last)
nums[1:3]      # [2, 3] (slice)
nums[:3]       # [1, 2, 3]
nums[2:]       # [3, 4, 5]

# Methods
nums.append(6)              # Add to end
nums.insert(0, 0)           # Insert at index
nums.remove(3)              # Remove first occurrence
nums.pop()                  # Remove and return last
nums.pop(0)                 # Remove at index
nums.sort()                 # Sort in place
sorted(nums)                # Return sorted copy
nums.reverse()              # Reverse in place
len(nums)                   # Length
nums.count(2)               # Count occurrences
nums.index(3)               # Find index

# List operations
[1, 2] + [3, 4]            # [1, 2, 3, 4]
[1, 2] * 3                 # [1, 2, 1, 2, 1, 2]
```

### 3.2 Tuples (Immutable, Ordered)

```python
# Creation
point = (10, 20)
single = (1,)              # Note comma
empty = ()

# Access (same as lists)
point[0]                   # 10

# Unpacking
x, y = point

# Methods
point.count(10)
point.index(20)

# Use case: Multiple return values
def get_coordinates():
    return (10, 20)

x, y = get_coordinates()
```

### 3.3 Sets (Mutable, Unordered, Unique)

```python
# Creation
s = {1, 2, 3, 3}          # {1, 2, 3} - duplicates removed
empty_set = set()          # {} creates dict, not set!

# Operations
s.add(4)                   # Add element
s.remove(2)                # Remove (raises error if not found)
s.discard(2)               # Remove (no error)

# Set operations
a = {1, 2, 3}
b = {3, 4, 5}
a | b                      # {1, 2, 3, 4, 5} union
a & b                      # {3} intersection
a - b                      # {1, 2} difference
a ^ b                      # {1, 2, 4, 5} symmetric difference

# Membership testing (Fast - O(1))
3 in s                     # True
```

### 3.4 Dictionaries (Mutable, Key-Value Pairs)

```python
# Creation
person = {"name": "Alice", "age": 25}
empty_dict = {}

# Access
person["name"]             # "Alice"
person.get("name")         # "Alice"
person.get("city", "NYC")  # "NYC" (default if key not found)

# Methods
person["age"] = 26         # Update
person["city"] = "NYC"     # Add new key
del person["age"]          # Delete
person.pop("city")         # Remove and return

person.keys()              # dict_keys(['name'])
person.values()            # dict_values(['Alice'])
person.items()             # dict_items([('name', 'Alice')])

# Iteration
for key in person:
    print(key, person[key])

for key, value in person.items():
    print(key, value)

# Checking membership
"name" in person           # True
```

### List vs Tuple vs Set vs Dict

| Feature | List | Tuple | Set | Dict |
|---------|------|-------|-----|------|
| **Mutable** | Yes | No | Yes | Yes |
| **Ordered** | Yes | Yes | No | Yes (3.7+) |
| **Duplicates** | Yes | Yes | No | Keys: No |
| **Indexing** | Yes | Yes | No | By key |
| **Use Case** | General collection | Fixed data | Unique items | Key-value mapping |

---

## <a name="comprehensions"></a>4. List Comprehensions

### 4.1 Basic List Comprehension

```python
# Traditional way
squares = []
for i in range(10):
    squares.append(i ** 2)

# List comprehension (Better!)
squares = [i ** 2 for i in range(10)]
# [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
```

### 4.2 With Conditions

```python
# Even numbers
evens = [x for x in range(20) if x % 2 == 0]
# [0, 2, 4, 6, 8, 10, 12, 14, 16, 18]

# If-else
result = [x if x % 2 == 0 else -x for x in range(5)]
# [0, -1, 2, -3, 4]
```

### 4.3 Nested Loops

```python
# Flatten 2D list
matrix = [[1, 2], [3, 4], [5, 6]]
flat = [num for row in matrix for num in row]
# [1, 2, 3, 4, 5, 6]

# Combinations
pairs = [(x, y) for x in [1, 2] for y in ['a', 'b']]
# [(1, 'a'), (1, 'b'), (2, 'a'), (2, 'b')]
```

### 4.4 Dictionary and Set Comprehensions

```python
# Dictionary comprehension
squares_dict = {x: x**2 for x in range(5)}
# {0: 0, 1: 1, 2: 4, 3: 9, 4: 16}

# Set comprehension
unique_squares = {x**2 for x in [-2, -1, 0, 1, 2]}
# {0, 1, 4}
```

---

## <a name="strings"></a>5. String Operations

### 5.1 String Basics

```python
s = "Hello World"

# Access
s[0]                  # 'H'
s[-1]                 # 'd'
s[0:5]                # 'Hello'

# Immutable
s[0] = 'h'            # Error! Strings are immutable

# Methods
s.lower()             # 'hello world'
s.upper()             # 'HELLO WORLD'
s.capitalize()        # 'Hello world'
s.title()             # 'Hello World'
s.strip()             # Remove whitespace
s.split()             # ['Hello', 'World']
s.replace('World', 'Python')  # 'Hello Python'
s.find('World')       # 6 (index)
s.count('l')          # 3
s.startswith('Hello') # True
s.endswith('World')   # True

# String operations
'Hello' + ' World'    # 'Hello World'
'Ha' * 3              # 'HaHaHa'
'World' in s          # True
```

### 5.2 String Formatting

```python
name = "Alice"
age = 25

# f-strings (Python 3.6+, Recommended)
f"Name: {name}, Age: {age}"
f"{age * 2}"                    # Expressions allowed

# format()
"Name: {}, Age: {}".format(name, age)
"Name: {0}, Age: {1}".format(name, age)
"Name: {n}, Age: {a}".format(n=name, a=age)

# % operator (old style)
"Name: %s, Age: %d" % (name, age)
```

### 5.3 Character Operations

```python
# Checking
'a'.isalpha()         # True
'1'.isdigit()         # True
' '.isspace()         # True
'abc'.isalnum()       # True
'ABC'.isupper()       # True
'abc'.islower()       # True

# Conversion
ord('A')              # 65 (ASCII)
chr(65)               # 'A'
```

---

## <a name="built-ins"></a>6. Built-in Functions for Interviews

### 6.1 Essential Functions

```python
# Length
len([1, 2, 3])        # 3
len("hello")          # 5

# Min/Max/Sum
min([5, 2, 8])        # 2
max([5, 2, 8])        # 8
sum([1, 2, 3])        # 6

# Range
range(5)              # 0, 1, 2, 3, 4
range(1, 6)           # 1, 2, 3, 4, 5
range(0, 10, 2)       # 0, 2, 4, 6, 8

# Enumerate
for i, val in enumerate(['a', 'b', 'c']):
    print(i, val)     # 0 a, 1 b, 2 c

# Zip
names = ['Alice', 'Bob']
ages = [25, 30]
for name, age in zip(names, ages):
    print(name, age)

# Map
nums = [1, 2, 3]
squares = list(map(lambda x: x**2, nums))  # [1, 4, 9]

# Filter
evens = list(filter(lambda x: x % 2 == 0, nums))

# Sorted
sorted([3, 1, 2])                 # [1, 2, 3]
sorted([3, 1, 2], reverse=True)   # [3, 2, 1]
sorted(['banana', 'apple'], key=len)  # ['apple', 'banana']

# Reversed
list(reversed([1, 2, 3]))         # [3, 2, 1]

# All/Any
all([True, True, False])          # False
any([False, False, True])         # True
```

### 6.2 Counter (from collections)

```python
from collections import Counter

# Count frequencies
text = "hello"
freq = Counter(text)              # Counter({'l': 2, 'h': 1, 'e': 1, 'o': 1})

# Most common
freq.most_common(2)               # [('l', 2), ('h', 1)]

# Operations
Counter([1, 2]) + Counter([2, 3]) # Counter({2: 2, 1: 1, 3: 1})
```

### 6.3 DefaultDict

```python
from collections import defaultdict

# Automatically initialize missing keys
dd = defaultdict(int)             # Default value: 0
dd['a'] += 1                      # No KeyError!

dd_list = defaultdict(list)
dd_list['key'].append(1)          # No need to initialize
```

---

## <a name="files"></a>7. File Handling

### 7.1 Reading Files

```python
# Read entire file
with open('file.txt', 'r') as f:
    content = f.read()

# Read line by line
with open('file.txt', 'r') as f:
    for line in f:
        print(line.strip())

# Read all lines into list
with open('file.txt', 'r') as f:
    lines = f.readlines()
```

### 7.2 Writing Files

```python
# Write (overwrite)
with open('file.txt', 'w') as f:
    f.write("Hello\n")
    f.write("World\n")

# Append
with open('file.txt', 'a') as f:
    f.write("New line\n")

# Write list
lines = ["Line 1\n", "Line 2\n"]
with open('file.txt', 'w') as f:
    f.writelines(lines)
```

---

## <a name="cli"></a>8. Command Line Arguments

```python
import sys

# sys.argv[0] is script name
# sys.argv[1], sys.argv[2], ... are arguments

# Example: python script.py arg1 arg2
print(sys.argv[0])    # script.py
print(sys.argv[1])    # arg1
print(sys.argv[2])    # arg2

# Check arguments
if len(sys.argv) != 3:
    print("Usage: python script.py <arg1> <arg2>")
    sys.exit(1)

# Convert to int
num = int(sys.argv[1])
```

---

## <a name="interview-questions"></a>9. Interview Questions

### Q1: What is the difference between list and tuple?

**Answer:**

| Feature | List | Tuple |
|---------|------|-------|
| **Mutability** | Mutable (can change) | Immutable (cannot change) |
| **Syntax** | `[1, 2, 3]` | `(1, 2, 3)` |
| **Performance** | Slower | Faster |
| **Methods** | More methods (append, remove) | Fewer methods |
| **Use case** | Dynamic data | Fixed data, dict keys |

**Example:**
```python
# List
lst = [1, 2, 3]
lst[0] = 10      # OK
lst.append(4)    # OK

# Tuple
tup = (1, 2, 3)
tup[0] = 10      # Error!
tup.append(4)    # Error!

# Tuple as dict key (lists can't be)
d = {(1, 2): "value"}  # OK
d = {[1, 2]: "value"}  # Error!
```

---

### Q2: Explain list comprehension with an example.

**Answer:**

List comprehension provides a concise way to create lists.

**Syntax:** `[expression for item in iterable if condition]`

**Example 1: Squares**
```python
# Traditional
squares = []
for i in range(10):
    squares.append(i**2)

# List comprehension (Better!)
squares = [i**2 for i in range(10)]
```

**Example 2: Filter evens**
```python
nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
evens = [x for x in nums if x % 2 == 0]
# [2, 4, 6, 8, 10]
```

**Example 3: Transform strings**
```python
words = ['hello', 'world']
upper_words = [w.upper() for w in words]
# ['HELLO', 'WORLD']
```

---

### Q3: What is a dictionary? How is it different from a list?

**Answer:**

A **dictionary** is a collection of key-value pairs.

**Differences:**

| Feature | List | Dictionary |
|---------|------|------------|
| **Access** | By index (0, 1, 2...) | By key |
| **Ordering** | Ordered | Ordered (Python 3.7+) |
| **Keys** | Integer indices | Any immutable type |
| **Lookup** | O(n) search | O(1) average |

**Example:**
```python
# List - access by index
students = ['Alice', 'Bob', 'Charlie']
students[0]  # 'Alice'

# Dictionary - access by key
ages = {'Alice': 25, 'Bob': 30, 'Charlie': 28}
ages['Alice']  # 25
```

**Use cases:**
- List: Sequential data, order matters
- Dict: Mappings, fast lookups, configuration

---

### Q4: How do you take input from command line in Python?

**Answer:**

**Method 1: input() function**
```python
name = input("Enter name: ")  # Returns string
age = int(input("Enter age: "))  # Convert to int
```

**Method 2: Command line arguments**
```python
import sys

# python script.py 10 20
num1 = int(sys.argv[1])  # 10
num2 = int(sys.argv[2])  # 20
```

**Method 3: argparse (Advanced)**
```python
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--name', type=str, required=True)
parser.add_argument('--age', type=int, default=0)
args = parser.parse_args()

print(args.name, args.age)
```

---

### Q5: Implement a function to check if a number is even.

**Answer:**

```python
def is_even(n):
    """Check if number is even"""
    return n % 2 == 0

# Usage
print(is_even(4))   # True
print(is_even(7))   # False

# One-liner using lambda
is_even = lambda n: n % 2 == 0
```

---

### Q6: How to iterate through a list in Python?

**Answer:**

**Method 1: Direct iteration**
```python
numbers = [1, 2, 3, 4, 5]
for num in numbers:
    print(num)
```

**Method 2: With index (enumerate)**
```python
for i, num in enumerate(numbers):
    print(f"Index {i}: {num}")
```

**Method 3: Using range**
```python
for i in range(len(numbers)):
    print(numbers[i])
```

**Method 4: While loop**
```python
i = 0
while i < len(numbers):
    print(numbers[i])
    i += 1
```

**Best Practice:** Use direct iteration or enumerate!

---

### Q7: How to convert string to lowercase in Python?

**Answer:**

```python
text = "Hello WORLD"

# Method 1: lower()
lowercase = text.lower()           # 'hello world'

# Method 2: casefold() (aggressive)
lowercase = text.casefold()        # 'hello world'

# Difference: casefold is more aggressive
'ß'.lower()      # 'ß'
'ß'.casefold()   # 'ss'

# For interviews, use lower()
```

---

### Q8: How to read a file in Python?

**Answer:**

**Method 1: Read entire file**
```python
with open('file.txt', 'r') as f:
    content = f.read()
    print(content)
```

**Method 2: Read line by line**
```python
with open('file.txt', 'r') as f:
    for line in f:
        print(line.strip())  # strip() removes newline
```

**Method 3: Read all lines into list**
```python
with open('file.txt', 'r') as f:
    lines = f.readlines()  # List of strings
```

**Why use `with`?** Automatically closes file, even if error occurs!

---

### Q9: How to define a function in Python?

**Answer:**

**Basic Function:**
```python
def greet(name):
    """This is a docstring"""
    return f"Hello, {name}!"

result = greet("Alice")
```

**Default Parameters:**
```python
def power(base, exponent=2):
    return base ** exponent

power(5)     # 25 (uses default exponent=2)
power(5, 3)  # 125
```

**Variable Arguments:**
```python
def sum_all(*args):
    return sum(args)

sum_all(1, 2, 3, 4)  # 10
```

**Keyword Arguments:**
```python
def person_info(**kwargs):
    for key, value in kwargs.items():
        print(f"{key}: {value}")

person_info(name="Alice", age=25)
```

**Lambda (Anonymous Function):**
```python
square = lambda x: x ** 2
square(5)  # 25
```

---

### Q10: Explain function overloading in Python.

**Answer:**

Python **does NOT support traditional function overloading** (multiple functions with same name but different parameters) like C++.

**Why?** Python uses dynamic typing and default/variable arguments instead.

**Alternatives:**

**1. Default Arguments:**
```python
def add(a, b=0, c=0):
    return a + b + c

add(1)           # 1
add(1, 2)        # 3
add(1, 2, 3)     # 6
```

**2. Variable Arguments:**
```python
def add(*args):
    return sum(args)

add(1)           # 1
add(1, 2)        # 3
add(1, 2, 3)     # 6
```

**3. Type Checking (Manual):**
```python
def process(data):
    if isinstance(data, int):
        return data * 2
    elif isinstance(data, str):
        return data.upper()
```

**Note:** If you define two functions with same name, the second overwrites the first!

---

## <a name="mcqs"></a>10. MCQs

### MCQ 1
**What is the output?**
```python
x = [1, 2, 3]
y = x
y.append(4)
print(x)
```

A) [1, 2, 3]  
B) [1, 2, 3, 4]  
C) Error  
D) None

<details>
<summary>Answer</summary>
**B) [1, 2, 3, 4]**

`y = x` creates a reference, not a copy. Both point to same list.
</details>

---

### MCQ 2
**Which is mutable?**

A) tuple  
B) string  
C) list  
D) int

<details>
<summary>Answer</summary>
**C) list**

Lists are mutable. Tuples, strings, and numbers are immutable.
</details>

---

### MCQ 3
**What is the output?**
```python
print(len("Hello"))
```

A) 4  
B) 5  
C) 6  
D) Error

<details>
<summary>Answer</summary>
**B) 5**

String "Hello" has 5 characters.
</details>

---

### MCQ 4
**What does `range(5)` return?**

A) [0, 1, 2, 3, 4]  
B) [1, 2, 3, 4, 5]  
C) range(0, 5)  
D) Error

<details>
<summary>Answer</summary>
**C) range(0, 5)**

`range()` returns a range object, not a list. Use `list(range(5))` to get [0,1,2,3,4].
</details>

---

### MCQ 5
**Output of:**
```python
d = {'a': 1, 'b': 2}
print(d.get('c', 0))
```

A) None  
B) 0  
C) KeyError  
D) 'c'

<details>
<summary>Answer</summary>
**B) 0**

`get()` with default value returns 0 when key 'c' doesn't exist.
</details>

---

### MCQ 6
**List comprehension equivalent to:**
```python
result = []
for i in range(5):
    if i % 2 == 0:
        result.append(i**2)
```

A) `[i**2 for i in range(5)]`  
B) `[i**2 for i in range(5) if i % 2 == 0]`  
C) `[i for i in range(5) if i**2 % 2 == 0]`  
D) `[i**2 if i % 2 == 0 for i in range(5)]`

<details>
<summary>Answer</summary>
**B) `[i**2 for i in range(5) if i % 2 == 0]`**

Squares of even numbers: [0, 4, 16]
</details>

---

### MCQ 7
**Which is fastest for membership testing?**

A) list  
B) tuple  
C) set  
D) dict

<details>
<summary>Answer</summary>
**C) set (or D) dict**

Both set and dict use hash tables: O(1) average. List/tuple need O(n) search.
</details>

---

### MCQ 8
**What happens?**
```python
tup = (1, 2, 3)
tup[0] = 5
```

A) tup becomes (5, 2, 3)  
B) TypeError  
C) IndexError  
D) ValueError

<details>
<summary>Answer</summary>
**B) TypeError**

Tuples are immutable - cannot modify elements.
</details>

---

### MCQ 9
**Output:**
```python
print("Hello" * 3)
```

A) HelloHelloHello  
B) Error  
C) Hello 3  
D) 3

<details>
<summary>Answer</summary>
**A) HelloHelloHello**

String repetition operator.
</details>

---

### MCQ 10
**What does `enumerate()` do?**

A) Counts elements  
B) Returns (index, value) pairs  
C) Enumerates all values  
D) Creates a numbered list

<details>
<summary>Answer</summary>
**B) Returns (index, value) pairs**

```python
for i, val in enumerate(['a','b']):
    # i=0, val='a'
    # i=1, val='b'
```
</details>

---

## <a name="challenges"></a>11. Practice Challenges

### Challenge 1: Count Frequency ⭐
**Difficulty:** Easy

Write a function to count character frequencies in a string using a dictionary.

```python
def char_frequency(s):
    """Count frequency of each character"""
    # Your code here

# Test
print(char_frequency("hello"))  # {'h':1, 'e':1, 'l':2, 'o':1}
```

<details>
<summary>Solution</summary>

```python
def char_frequency(s):
    freq = {}
    for char in s:
        freq[char] = freq.get(char, 0) + 1
    return freq

# Using Counter
from collections import Counter
def char_frequency(s):
    return dict(Counter(s))

# Using dict comprehension
def char_frequency(s):
    return {char: s.count(char) for char in set(s)}
```
</details>

---

### Challenge 2: Flatten List ⭐⭐
**Difficulty:** Medium

Flatten a 2D list using list comprehension.

```python
# Input: [[1, 2], [3, 4], [5, 6]]
# Output: [1, 2, 3, 4, 5, 6]
```

<details>
<summary>Solution</summary>

```python
def flatten(matrix):
    return [num for row in matrix for num in row]

# Alternative
def flatten(matrix):
    result = []
    for row in matrix:
        result.extend(row)
    return result
```
</details>

---

### Challenge 3: Word Count ⭐⭐
**Difficulty:** Medium

Count words in a file. Read from command line argument.

```python
# Usage: python word_count.py filename.txt
```

<details>
<summary>Solution</summary>

```python
import sys

def word_count(filename):
    try:
        with open(filename, 'r') as f:
            text = f.read()
            words = text.split()
            return len(words)
    except FileNotFoundError:
        print(f"File {filename} not found")
        return -1

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python word_count.py <filename>")
        sys.exit(1)
    
    filename = sys.argv[1]
    count = word_count(filename)
    print(f"Word count: {count}")
```
</details>

---

### Challenge 4: Group Anagrams ⭐⭐⭐
**Difficulty:** Hard

Group anagrams together from a list of strings.

```python
# Input: ["eat", "tea", "tan", "ate", "nat", "bat"]
# Output: [["eat","tea","ate"], ["tan","nat"], ["bat"]]
```

<details>
<summary>Solution</summary>

```python
from collections import defaultdict

def group_anagrams(words):
    groups = defaultdict(list)
    
    for word in words:
        # Sort letters as key
        key = ''.join(sorted(word))
        groups[key].append(word)
    
    return list(groups.values())

# Test
words = ["eat", "tea", "tan", "ate", "nat", "bat"]
print(group_anagrams(words))
```
</details>

---

### Challenge 5: Top K Frequent ⭐⭐⭐
**Difficulty:** Hard

Find k most frequent elements in a list.

```python
# Input: nums = [1,1,1,2,2,3], k = 2
# Output: [1, 2]
```

<details>
<summary>Solution</summary>

```python
from collections import Counter

def top_k_frequent(nums, k):
    # Count frequencies
    freq = Counter(nums)
    
    # Get k most common
    return [num for num, count in freq.most_common(k)]

# Alternative without Counter
def top_k_frequent(nums, k):
    freq = {}
    for num in nums:
        freq[num] = freq.get(num, 0) + 1
    
    # Sort by frequency
    sorted_items = sorted(freq.items(), key=lambda x: x[1], reverse=True)
    return [num for num, count in sorted_items[:k]]
```
</details>

---

## <a name="references"></a>12. References

### Official Documentation
- [Python.org Documentation](https://docs.python.org/3/)
- [Python Tutorial](https://docs.python.org/3/tutorial/)
- [Python Standard Library](https://docs.python.org/3/library/)

### Books
- "Python Crash Course" - Eric Matthes
- "Automate the Boring Stuff with Python" - Al Sweigart
- "Fluent Python" - Luciano Ramalho

### Practice
- [LeetCode](https://leetcode.com/) - Python problems
- [HackerRank Python](https://www.hackerrank.com/domains/python)
- [Python Exercises](https://www.w3 resource.com/python-exercises/)

---

## 🎯 Key Takeaways

1. **Lists** - Mutable, use for dynamic data
2. **Tuples** - Immutable, use for fixed data
3. **Sets** - Unique elements, O(1) membership
4. **Dicts** - Key-value pairs, O(1) lookup
5. **List comprehensions** - Concise and Pythonic
6. **Built-ins** - Know len, sum, min, max, sorted, enumerate
7. **String methods** - lower, upper, split, join, strip
8. **File handling** - Always use `with` statement

**Remember:** Python is about readability and simplicity. Write clean, Pythonic code!
