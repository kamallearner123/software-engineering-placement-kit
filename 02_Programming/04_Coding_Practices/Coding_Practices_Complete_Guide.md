# Coding Practices: Complete Guide

> **Module:** Programming - C/C++/Python Efficient Coding
> **Topic:** Clean Code, Debugging, Testing, and Optimization
> **Duration:** 2 hours

## 📚 Table of Contents

1. [Introduction to Clean Code](#introduction)
2. [Naming Conventions](#naming)
3. [Writing Better Functions](#functions)
4. [Error Handling](#error-handling)
5. [Testing & TDD](#testing)
6. [Debugging Techniques](#debugging)
7. [Code Optimization](#optimization)
8. [Interview Questions](#interview-questions)
9. [Multiple Choice Questions](#mcqs)
10. [Practice Challenges](#challenges)
11. [References](#references)

---

## <a name="introduction"></a>1. Introduction to Clean Code

### What is Clean Code?

Clean code is code that is easy to understand, easy to change, and follows standard conventions. It is written for **humans** to read, not just for computers to execute.

> "Any fool can write code that a computer can understand. Good programmers write code that humans can understand." — Martin Fowler

### Principles of Clean Code (KISS, DRY, YAGNI)

1.  **KISS (Keep It Simple, Stupid):** Avoid complexity. Simple solutions are easier to maintain and debug.
2.  **DRY (Don't Repeat Yourself):** Every piece of knowledge/logic should have a single representation. Avoid code duplication.
3.  **YAGNI (You Ain't Gonna Need It):** Don't add functionality until it is necessary. Avoid over-engineering.

### Code Readability

-   **Indentation:** Consistent indentation (tabs vs spaces).
-   **Formatting:** Use linters (e.g., `black` for Python, `clang-format` for C++).
-   **Comments:** Use comments to explain *why* something is done, not *what* is done (code should explain *what*).

---

## <a name="naming"></a>2. Naming Conventions

### Meaningful Names

Choose names that reveal intent.

**Bad:**
```python
d = 12  # elapsed time in days
```

**Good:**
```python
elapsed_days = 12
days_since_creation = 12
```

### Conventions by Language

| Feature | Python (PEP 8) | C++ | Java |
| :--- | :--- | :--- | :--- |
| **Variables** | `snake_case` | `camelCase` or `snake_case` | `camelCase` |
| **Functions** | `snake_case` | `camelCase` | `camelCase` |
| **Classes** | `PascalCase` | `PascalCase` | `PascalCase` |
| **Constants** | `UPPER_CASE` | `UPPER_CASE` | `UPPER_CASE` |
| **Private** | `_private_var` | `m_variable` or `variable_` | `privateVariable` |

### Booleans

Quantify boolean variables with `is`, `has`, `can`, or `should`.

-   `is_valid`
-   `has_children`
-   `can_write`

---

## <a name="functions"></a>3. Writing Better Functions

### Single Responsibility Principle (SRP)

A function should do **one thing** and do it well.

**Bad:**
```python
def process_user(user):
    # Validate user
    if not user.email: return False
    # Save to DB
    db.save(user)
    # Send email
    smtp.send(user.email, "Welcome")
```

**Good:**
```python
def register_user(user):
    if is_valid_user(user):
        save_user(user)
        send_welcome_email(user)
```

### Function Arguments

Limit the number of arguments (ideal: 0-2, max: 3-4). If you need more, consider passing a configuration object or structure.

### Side Effects

Avoid side effects. A function should ideally not change the state of the system unexpectedly.

---

## <a name="error-handling"></a>4. Error Handling

### Fail Fast

Report errors immediately rather than continuing with invalid state.

### Exceptions vs Return Codes

**Python (Exceptions):**
```python
try:
    result = divide(a, b)
except ZeroDivisionError:
    log_error("Division by zero")
```

**C/C++ (Return Codes & Exceptions):**
```cpp
// Return code
if (open_file() != SUCCESS) {
    return ERROR_FILE_OPEN;
}

// Exception
try {
    process_data();
} catch (const std::exception& e) {
    std::cerr << e.what();
}
```

### Best Practices

-   Don't catch generic exceptions (`except Exception:` in Python) unless logging/crashing.
-   Provide meaningful error messages.
-   Clean up resources (use `finally` or `with` statement in Python, RAII in C++).

---

## <a name="testing"></a>5. Testing & TDD

### Types of Testing

1.  **Unit Testing:** Testing individual components/functions in isolation.
2.  **Integration Testing:** Testing how modules work together.
3.  **System Testing:** Testing the complete system.

### Test Driven Development (TDD)

Cycle: **Red -> Green -> Refactor**

1.  **Red:** Write a failing test.
2.  **Green:** Write minimal code to pass the test.
3.  **Refactor:** Improve code while keeping tests passing.

### Python Example (`unittest`)

```python
import unittest

def add(a, b):
    return a + b

class TestMath(unittest.TestCase):
    def test_add(self):
        self.assertEqual(add(2, 3), 5)
        self.assertEqual(add(-1, 1), 0)

if __name__ == '__main__':
    unittest.main()
```

---

## <a name="debugging"></a>6. Debugging Techniques

### Rubber Duck Debugging

Explain your code line-by-line to an inanimate object (like a rubber duck). This forces you to slow down and verify your logic.

### Print Debugging vs Debugger

-   **Print:** Quick, but messy. Good for simple flow checks.
-   **Debugger (GDB, PDB, IDE Debuggers):** Powerful. Allows stepping through code, inspecting variables, setting breakpoints.

### Root Cause Analysis

-   Reproduce the bug reliably.
-   Isolate the component causing the issue.
-   Fix the root cause, not just the symptom.
-   Add a regression test to ensure it doesn't come back.

---

## <a name="optimization"></a>7. Code Optimization

> "Premature optimization is the root of all evil." — Donald Knuth

### Steps to Optimize

1.  **Profile:** Measure where the code is slow (Time Complexity).
2.  **Analyze:** Is it an algorithm issue (O(n^2) vs O(n))?
3.  **Optimize:** Change algorithm or data structure first.
4.  **Micro-optimize:** Language-specific tricks (only if necessary).

### Common Bottlenecks

-   **I/O Operations:** Disk/Network access is slow.
-   **Loops:** Nested loops leading to high complexity.
-   **Memory Allocation:** Frequent allocation/deallocation.

---

## <a name="interview-questions"></a>8. Interview Questions

### Q1: What is the "DRY" principle?

**Answer:**
DRY stands for **Don't Repeat Yourself**. It means that logic should adhere to a single source of truth. Duplicating code leads to maintenance nightmares because if you need to change logic, you have to change it in multiple places, increasing the risk of bugs.

### Q2: Explain the difference between Unit Testing and Integration Testing.

**Answer:**
-   **Unit Testing:** Validates that each unit of the software (e.g., a single function or class) performs as designed. It isolates the code from external dependencies (mocking DBs, APIs).
-   **Integration Testing:** Verifies that different modules or services used by the application work well together.

### Q3: How do you handle exceptions in Python/C++ properly?

**Answer:**
The key is to handle specific exceptions rather than catching everything.
-   **Python:** Use `try-except-else-finally`. Catch specific errors like `ValueError` or `KeyError` before a general `Exception`. Use the `finally` block for cleanup.
-   **C++:** Use `try-catch` blocks. Catch by reference (`const std::exception& e`) to avoid object slicing. Use RAII for resource management to ensure cleanup even if exceptions are thrown.

### Q4: What is refactoring?

**Answer:**
Refactoring is the process of restructuring existing computer code—changing the factoring—without changing its external behavior. It improves readability, reduces complexity, and facilitates code maintenance. Steps include renaming variables, extracting functions, and removing duplicate code.

### Q5: What is a code review and why is it important?

**Answer:**
A code review is a systematic examination of computer source code. It is intended to find bugs, ensure coding standards are met, and share knowledge among team members. It is crucial for maintaining code quality in a collaborative environment.

### Q6: What are meaningful names in programming? Provide examples.

**Answer:**
Meaningful names clearly communicate the variable's intent, units, and scope.
-   **Bad:** `t`, `val`, `data`, `func1()`
-   **Good:** `elapsed_time_ms`, `customer_id`, `input_buffer`, `calculate_total_tax()`

### Q7: Explain the concept of "Technical Debt".

**Answer:**
Technical debt reflects the implied cost of additional rework caused by choosing an easy solution now instead of using a better approach that would take longer. Like financial debt, if not paid back (by refactoring), it accumulates interest (making future changes harder).

### Q8: What is "Defensive Programming"?

**Answer:**
Defensive programming is intended to ensure the continuing function of a piece of software under unforeseen circumstances. It typically involves:
-   Validating all inputs.
-   Using assertions.
-   Handling potential error conditions gracefully.
-   Expecting the unexpected.

### Q9: What tools can you use for static code analysis?

**Answer:**
Static analysis tools check code without running it for potential errors and coding standard violations.
-   **Python:** Pylint, Flake8, Mypy.
-   **C++:** Cppcheck, Clang-tidy.
-   **General:** SonarQube.

### Q10: Why should you avoid global variables?

**Answer:**
-   **State Unpredictability:** Any part of the code can change a global variable, making it hard to track state changes.
-   **Testing:** Makes unit testing difficult (introduces hidden dependencies).
-   **Concurrency:** Causes race conditions in multi-threaded applications.
-   **Namespace Pollution:** Increases risk of naming collisions.

---

## <a name="mcqs"></a>9. Multiple Choice Questions

### MCQ 1
**What does KISS stand for?**
A) Keep It Secure, Safe
B) Keep It Simple, Stupid
C) Keep It Standard, Simple
D) Key Instruction Set Standard

<details>
<summary>Answer</summary>
**B) Keep It Simple, Stupid**
</details>

### MCQ 2
**Which naming convention is standard for Python variables?**
A) camelCase
B) PascalCase
C) snake_case
D) kebab-case

<details>
<summary>Answer</summary>
**C) snake_case**
</details>

### MCQ 3
**What is the primary goal of refactoring?**
A) To add new features
B) To fix bugs
C) To improve internal structure without changing external behavior
D) To make the code run faster

<details>
<summary>Answer</summary>
**C) To improve internal structure without changing external behavior**
</details>

### MCQ 4
**In TDD, what is the first step?**
A) Write the code
B) Write a failing test
C) Refactor
D) Document

<details>
<summary>Answer</summary>
**B) Write a failing test**
</details>

### MCQ 5
**Which comment is considered "bad" practice?**
A) Explaining *why* a complex algorithm was chosen.
B) Explaining *what* `i = i + 1` does.
C) Marking a TODO for future improvement.
D) Documenting public API parameters.

<details>
<summary>Answer</summary>
**B) Explaining *what* `i = i + 1` does.** (Code already says what it does; comments should explain why.)
</details>

### MCQ 6
**Which is NOT a benefit of code reviews?**
A) Finding bugs
B) Knowledge sharing
C) Shifting blame
D) Ensuring consistency

<details>
<summary>Answer</summary>
**C) Shifting blame**
</details>

### MCQ 7
**What is a "Magic Number"?**
A) A number that makes code run faster
B) A hard-coded numeric value with no context or explanation
C) A memory address
D) A return code for success

<details>
<summary>Answer</summary>
**B) A hard-coded numeric value with no context or explanation**
</details>

### MCQ 8
**Which complexity is generally considered "bad" for a simple lookup?**
A) O(1)
B) O(log n)
C) O(n)
D) O(n^2)

<details>
<summary>Answer</summary>
**D) O(n^2)** (Assuming a simple list search is usually O(n) or O(log n), O(n^2) is very inefficient for unrelated lookups).
</details>

### MCQ 9
**What is a Race Condition?**
A) Code running too fast.
B) Two threads accessing shared data concurrently leading to unpredictable results.
C) A loop that never ends.
D) Network timeout.

<details>
<summary>Answer</summary>
**B) Two threads accessing shared data concurrently leading to unpredictable results.**
</details>

### MCQ 10
**Which tool is a Python Linter?**
A) GDB
B) PyTest
C) Flake8
D) GCC

<details>
<summary>Answer</summary>
**C) Flake8**
</details>

---

## <a name="challenges"></a>10. Practice Challenges

### Challenge 1: Code Cleanup
**Difficulty:** Easy
Refactor the following Python code to follow naming conventions and clean code principles.

**Bad Code:**
```python
def c(x,y):
 return x*y
a=10
b=20
print(c(a,b))
```

<details>
<summary>Solution</summary>

```python
def calculate_area(length, width):
    return length * width

length = 10
width = 20
area = calculate_area(length, width)
print(area)
```
</details>

### Challenge 2: Handling Edge Cases
**Difficulty:** Medium
Write a function `get_element(arr, index)` that safely returns an element from a list. It should handle:
- Index out of bounds (Return None)
- Invalid index type (Return None)
- Empty list

<details>
<summary>Solution</summary>

```python
def get_element(arr, index):
    if not isinstance(arr, list):
        return None
    if not isinstance(index, int):
        return None
    
    if 0 <= index < len(arr):
        return arr[index]
    
    return None
```
</details>

### Challenge 3: Optimize Logic
**Difficulty:** Medium
Optimize this code snippet.
```python
# Check if numbers in list1 exist in list2
found = []
for n1 in list1:
    if n1 in list2:  # list2 has 1 million items
        found.append(n1)
```

<details>
<summary>Solution</summary>

```python
# Convert list2 to a set for O(1) lookups
set2 = set(list2)
found = [n1 for n1 in list1 if n1 in set2]
```
</details>

### Challenge 4: Write Tests
**Difficulty:** Hard
Write a `unittest` class for a function `is_palindrome(s)` that returns True if a string is a palindrome. Test cases:
- Normal palindrome ("racecar")
- Not a palindrome ("hello")
- Empty string
- Case sensitivity ("Racecar")

<details>
<summary>Solution</summary>

```python
import unittest

def is_palindrome(s):
    if not s:
        return True
    clean_s = s.lower()
    return clean_s == clean_s[::-1]

class TestPalindrome(unittest.TestCase):
    def test_normal(self):
        self.assertTrue(is_palindrome("racecar"))
    
    def test_not(self):
        self.assertFalse(is_palindrome("hello"))
        
    def test_empty(self):
        self.assertTrue(is_palindrome(""))
        
    def test_case(self):
        self.assertTrue(is_palindrome("Racecar"))
```
</details>

### Challenge 5: Eliminate Magic Numbers
**Difficulty:** Easy
Refactor this code to remove magic numbers.
```python
if status == 5:
    time.sleep(86400)
```

<details>
<summary>Solution</summary>

```python
STATUS_COMPLETED = 5
SECONDS_IN_A_DAY = 86400

if status == STATUS_COMPLETED:
    time.sleep(SECONDS_IN_A_DAY)
```
</details>

---

## <a name="references"></a>11. References

-   **"Clean Code"** by Robert C. Martin (Uncle Bob)
-   **"The Pragmatic Programmer"** by Andrew Hunt and David Thomas
-   **"Refactoring"** by Martin Fowler
-   **Google Style Guides** (Python/C++)
-   [PEP 8 -- Style Guide for Python Code](https://www.python.org/dev/peps/pep-0008/)

---

## 🎯 Key Takeaways

1.  **Readability is King:** Code is read more often than it is written.
2.  **Test Early, Test Often:** Bugs are cheaper to fix when found early.
3.  **Refactor Mercilessly:** Improve code quality continuously.
4.  **Use Tools:** Linters, debuggers, and profilers are your friends.
5.  **Be Consistent:** Follow the established style guide of your project/team.
