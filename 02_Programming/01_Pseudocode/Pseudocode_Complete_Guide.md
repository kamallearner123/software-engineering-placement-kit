# Pseudocode: Complete Guide

> **Module:** Programming - C/C++/Python Efficient Coding  
> **Topic:** Pseudocode Writing and Algorithm Design  
> **Duration:** 2 hours

## 📚 Table of Contents

1. [Introduction to Pseudocode](#introduction)
2. [Pseudocode Conventions](#conventions)
3. [Control Structures](#control-structures)
4. [Common Patterns](#common-patterns)
5. [Examples from Curriculum](#examples)
6. [Interview Questions](#interview-questions)
7. [Multiple Choice Questions](#mcqs)
8. [Practice Challenges](#challenges)
9. [References](#references)

---

## <a name="introduction"></a>1. Introduction to Pseudocode

### What is Pseudocode?

**Pseudocode** is a high-level description of an algorithm that uses the structural conventions of programming language but is intended for **human reading** rather than machine reading.

### Why Use Pseudocode?

✅ **Language-independent** - Focus on logic, not syntax  
✅ **Easy to understand** - Clear for non-programmers  
✅ **Quick to write** - Faster than actual code  
✅ **Planning tool** - Design before coding  
✅ **Communication** - Discuss algorithms with team

### When to Use Pseudocode?

- **Interview preparation** - Explain approach before coding
- **Algorithm design** - Plan complex logic
- **Team collaboration** - Share ideas quickly
- **Documentation** - Explain algorithm behavior

---

## <a name="conventions"></a>2. Pseudocode Conventions

### Basic Syntax Rules

```
1. Use simple English statements
2. Indent for readability
3. Use CAPITAL LETTERS for keywords (optional)
4. Be consistent with your style
```

### Common Keywords

| Operation | Keywords |
|-----------|----------|
| **Input** | READ, GET, INPUT |
| **Output** | PRINT, DISPLAY, OUTPUT, WRITE |
| **Assignment** | SET, ← , = |
| **Comparison** | IF, THEN, ELSE, ENDIF |
| **Loops** | FOR, WHILE, DO, ENDFOR, ENDWHILE |
| **Functions** | FUNCTION, PROCEDURE, RETURN |
| **Arrays** | ARRAY, LIST |

### Variable Naming

- Use descriptive names: `counter`, `sum`, `maxValue`
- Avoid single letters except for loop counters: `i`, `j`, `k`
- Be consistent with naming style

---

## <a name="control-structures"></a>3. Control Structures

### 3.1 Sequential Statements

Statements executed one after another.

```
START
    SET total = 0
    SET count = 5
    READ number
    SET total = total + number
    PRINT total
END
```

---

### 3.2 IF-THEN-ELSE (Selection)

**Simple IF:**
```
IF condition THEN
    statement(s)
ENDIF
```

**IF-ELSE:**
```
IF condition THEN
    statement(s)
ELSE
    statement(s)
ENDIF
```

**Nested IF:**
```
IF condition1 THEN
    IF condition2 THEN
        statement(s)
    ENDIF
ENDIF
```

**IF-ELIF-ELSE:**
```
IF condition1 THEN
    statement(s)
ELSE IF condition2 THEN
    statement(s)
ELSE
    statement(s)
ENDIF
```

**Example:**
```
READ number
IF number > 0 THEN
    PRINT "Positive"
ELSE IF number < 0 THEN
    PRINT "Negative"
ELSE
    PRINT "Zero"
ENDIF
```

---

### 3.3 WHILE Loop (Repetition)

```
WHILE condition DO
    statement(s)
END WHILE
```

**Example:**
```
SET count = 1
WHILE count <= 10 DO
    PRINT count
    SET count = count + 1
END WHILE
```

---

### 3.4 FOR Loop

```
FOR variable FROM start TO end DO
    statement(s)
END FOR
```

**Example:**
```
FOR i FROM 1 TO 10 DO
    PRINT i
END FOR
```

---

### 3.5 DO-WHILE Loop

```
DO
    statement(s)
WHILE condition
```

**Example:**
```
DO
    READ number
    PRINT number
WHILE number != 0
```

---

### 3.6 Functions/Procedures

```
FUNCTION functionName(parameters)
    statement(s)
    RETURN value
END FUNCTION
```

**Example:**
```
FUNCTION calculateSum(a, b)
    SET sum = a + b
    RETURN sum
END FUNCTION
```

---

## <a name="common-patterns"></a>4. Common Patterns

### 4.1 Finding Maximum/Minimum

```
FUNCTION findMax(array, n)
    SET max = array[0]
    FOR i FROM 1 TO n-1 DO
        IF array[i] > max THEN
            SET max = array[i]
        ENDIF
    END FOR
    RETURN max
END FUNCTION
```

---

### 4.2 Sum of Elements

```
START
    SET sum = 0
    FOR each element in array DO
        SET sum = sum + element
    END FOR
    PRINT sum
END
```

---

### 4.3 Counting

```
START
    SET count = 0
    FOR each element in array DO
        IF element meets condition THEN
            SET count = count + 1
        ENDIF
    END FOR
    PRINT count
END
```

---

### 4.4 Swapping

```
PROCEDURE swap(a, b)
    SET temp = a
    SET a = b
    SET b = temp
END PROCEDURE
```

---

## <a name="examples"></a>5. Examples from Curriculum

### Example 1: Print All Even Numbers from 1 to 100

```
START
    FOR number FROM 1 TO 100 DO
        IF number MOD 2 == 0 THEN
            PRINT number
        ENDIF
    END FOR
END
```

**Alternative approach:**
```
START
    FOR number FROM 2 TO 100 STEP 2 DO
        PRINT number
    END FOR
END
```

---

### Example 2: Check if a Number is Prime

```
FUNCTION isPrime(number)
    IF number <= 1 THEN
        RETURN false
    ENDIF
    
    IF number == 2 THEN
        RETURN true
    ENDIF
    
    FOR i FROM 2 TO sqrt(number) DO
        IF number MOD i == 0 THEN
            RETURN false
        ENDIF
    END FOR
    
    RETURN true
END FUNCTION
```

---

### Example 3: Find the Largest Number in an Array

```
FUNCTION findLargest(array, n)
    IF n == 0 THEN
        RETURN null
    ENDIF
    
    SET largest = array[0]
    
    FOR i FROM 1 TO n-1 DO
        IF array[i] > largest THEN
            SET largest = array[i]
        ENDIF
    END FOR
    
    RETURN largest
END FUNCTION
```

---

### Example 4: Linear Search

```
FUNCTION linearSearch(array, n, target)
    FOR i FROM 0 TO n-1 DO
        IF array[i] == target THEN
            RETURN i  // Return index
        ENDIF
    END FOR
    RETURN -1  // Not found
END FUNCTION
```

---

### Example 5: First 10 Fibonacci Numbers

```
START
    SET first = 0
    SET second = 1
    
    PRINT first
    PRINT second
    
    FOR i FROM 3 TO 10 DO
        SET next = first + second
        PRINT next
        SET first = second
        SET second = next
    END FOR
END
```

---

### Example 6: Count Vowels in a String

```
FUNCTION countVowels(str)
    SET count = 0
    SET vowels = ['a', 'e', 'i', 'o', 'u']
    
    FOR each character in str DO
        SET char = toLowerCase(character)
        IF char IN vowels THEN
            SET count = count + 1
        ENDIF
    END FOR
    
    RETURN count
END FUNCTION
```

---

### Example 7: Calculate Student Grade

```
FUNCTION calculateGrade(marks)
    IF marks >= 90 THEN
        RETURN "A+"
    ELSE IF marks >= 80 THEN
        RETURN "A"
    ELSE IF marks >= 70 THEN
        RETURN "B"
    ELSE IF marks >= 60 THEN
        RETURN "C"
    ELSE IF marks >= 50 THEN
        RETURN "D"
    ELSE
        RETURN "F"
    ENDIF
END FUNCTION
```

---

### Example 8: Reverse a String

```
FUNCTION reverseString(str)
    SET left = 0
    SET right = length(str) - 1
    SET result = str
    
    WHILE left < right DO
        SWAP result[left] and result[right]
        SET left = left + 1
        SET right = right - 1
    END WHILE
    
    RETURN result
END FUNCTION
```

---

### Example 9: Check if Two Strings are Anagrams

```
FUNCTION areAnagrams(str1, str2)
    IF length(str1) != length(str2) THEN
        RETURN false
    ENDIF
    
    SORT str1
    SORT str2
    
    IF str1 == str2 THEN
        RETURN true
    ELSE
        RETURN false
    ENDIF
END FUNCTION
```

---

### Example 10: Sum of Digits of a Number

```
FUNCTION sumOfDigits(number)
    SET sum = 0
    
    WHILE number > 0 DO
        SET digit = number MOD 10
        SET sum = sum + digit
        SET number = number DIV 10
    END WHILE
    
    RETURN sum
END FUNCTION
```

---

### Example 11: Bubble Sort

```
PROCEDURE bubbleSort(array, n)
    FOR i FROM 0 TO n-2 DO
        FOR j FROM 0 TO n-i-2 DO
            IF array[j] > array[j+1] THEN
                SWAP array[j] and array[j+1]
            ENDIF
        END FOR
    END FOR
END PROCEDURE
```

---

### Example 12: Count Even and Odd Numbers

```
FUNCTION countEvenOdd(array, n)
    SET evenCount = 0
    SET oddCount = 0
    
    FOR i FROM 0 TO n-1 DO
        IF array[i] MOD 2 == 0 THEN
            SET evenCount = evenCount + 1
        ELSE
            SET oddCount = oddCount + 1
        ENDIF
    END FOR
    
    PRINT "Even: ", evenCount
    PRINT "Odd: ", oddCount
END FUNCTION
```

---

### Example 13: Print Star Pyramid Pattern

```
START
    SET n = 5  // Number of rows
    
    FOR i FROM 1 TO n DO
        // Print spaces
        FOR j FROM 1 TO n-i DO
            PRINT " "
        END FOR
        
        // Print stars
        FOR k FROM 1 TO 2*i-1 DO
            PRINT "*"
        END FOR
        
        PRINT newline
    END FOR
END
```

---

### Example 14: Check if Year is Leap Year

```
FUNCTION isLeapYear(year)
    IF year MOD 400 == 0 THEN
        RETURN true
    ELSE IF year MOD 100 == 0 THEN
        RETURN false
    ELSE IF year MOD 4 == 0 THEN
        RETURN true
    ELSE
        RETURN false
    ENDIF
END FUNCTION
```

---

### Example 15: Remove Duplicates from Array

```
FUNCTION removeDuplicates(array, n)
    SET result = []
    
    FOR i FROM 0 TO n-1 DO
        SET isDuplicate = false
        
        FOR j FROM 0 TO length(result)-1 DO
            IF array[i] == result[j] THEN
                SET isDuplicate = true
                BREAK
            ENDIF
        END FOR
        
        IF NOT isDuplicate THEN
            ADD array[i] to result
        ENDIF
    END FOR
    
    RETURN result
END FUNCTION
```

---

## <a name="interview-questions"></a>6. Interview Questions

### Question 1: What is pseudocode and why is it important?

**Answer:**

Pseudocode is a simplified, informal high-level description of an algorithm that uses structural conventions similar to programming languages but is intended for human reading.

**Importance:**
1. **Language-independent**: Can be understood regardless of programming language knowledge
2. **Focus on logic**: Emphasizes algorithm logic rather than syntax details
3. **Quick prototyping**: Faster to write and modify than actual code
4. **Communication tool**: Helps explain algorithms to non-technical stakeholders
5. **Planning aid**: Helps organize thoughts before implementing
6. **Interview preparation**: Used to explain approach before coding

---

### Question 2: Write pseudocode to find the second largest element in an array.

**Answer:**

```
FUNCTION findSecondLargest(array, n)
    IF n < 2 THEN
        RETURN "Array too small"
    ENDIF
    
    SET first = -infinity
    SET second = -infinity
    
    FOR i FROM 0 TO n-1 DO
        IF array[i] > first THEN
            SET second = first
            SET first = array[i]
        ELSE IF array[i] > second AND array[i] != first THEN
            SET second = array[i]
        ENDIF
    END FOR
    
    IF second == -infinity THEN
        RETURN "No second largest element"
    ENDIF
    
    RETURN second
END FUNCTION
```

**Explanation:**
- Track two variables: first (largest) and second (second largest)
- When finding new largest, old largest becomes second largest
- Handle edge cases: array too small, all elements same

---

### Question 3: Write pseudocode for binary search.

**Answer:**

```
FUNCTION binarySearch(array, target, left, right)
    WHILE left <= right DO
        SET mid = (left + right) / 2
        
        IF array[mid] == target THEN
            RETURN mid
        ELSE IF array[mid] < target THEN
            SET left = mid + 1
        ELSE
            SET right = mid - 1
        ENDIF
    END WHILE
    
    RETURN -1  // Not found
END FUNCTION
```

**Key Points:**
- Array must be sorted
- Time complexity: O(log n)
- Divide search space in half each iteration
- Return index if found, -1 if not found

---

### Question 4: How do you convert pseudocode to actual code?

**Answer:**

**Steps to convert pseudocode to code:**

1. **Choose programming language**: Based on requirements
2. **Translate keywords**: Map pseudocode keywords to language syntax
3. **Add syntax**: Include semicolons, braces, brackets
4. **Declare variables**: Add type declarations if needed
5. **Handle edge cases**: Add error checking
6. **Test**: Run and verify correctness

**Example - Pseudocode:**
```
FUNCTION sum(a, b)
    RETURN a + b
END FUNCTION
```

**Python:**
```python
def sum(a, b):
    return a + b
```

**C++:**
```cpp
int sum(int a, int b) {
    return a + b;
}
```

**Java:**
```java
public int sum(int a, int b) {
    return a + b;
}
```

---

### Question 5: Write pseudocode to check if a string is a palindrome.

**Answer:**

```
FUNCTION isPalindrome(str)
    SET left = 0
    SET right = length(str) - 1
    
    WHILE left < right DO
        IF str[left] != str[right] THEN
            RETURN false
        ENDIF
        
        SET left = left + 1
        SET right = right - 1
    END WHILE
    
    RETURN true
END FUNCTION
```

**Time Complexity:** O(n)  
**Space Complexity:** O(1)

---

### Question 6: Difference between pseudocode and flowchart?

**Answer:**

| Aspect | Pseudocode | Flowchart |
|--------|-----------|-----------|
| **Format** | Text-based | Graphical/Visual |
| **Detail Level** | More detailed | High-level overview |
| **Learning Curve** | Easy to write | Requires symbol knowledge |
| **Readability** | Better for complex logic | Better for simple flows |
| **Modification** | Easy to edit text | Requires redrawing |
| **Use Case** | Detailed algorithms | Process visualization |

**When to use:**
- **Pseudocode**: Complex algorithms, detailed logic, code planning
- **Flowchart**: Process overview, simple flows, presentations

---

### Question 7: Write pseudocode for insertion sort.

**Answer:**

```
PROCEDURE insertionSort(array, n)
    FOR i FROM 1 TO n-1 DO
        SET key = array[i]
        SET j = i - 1
        
        WHILE j >= 0 AND array[j] > key DO
            SET array[j+1] = array[j]
            SET j = j - 1
        END WHILE
        
        SET array[j+1] = key
    END FOR
END PROCEDURE
```

**How it works:**
1. Start from second element (index 1)
2. Compare with elements before it
3. Shift larger elements to the right
4. Insert current element in correct position

**Complexity:** O(n²) worst case, O(n) best case (sorted)

---

### Question 8: What are common mistakes when writing pseudocode?

**Answer:**

**Common Mistakes:**

1. **Too much detail**
   - ❌ Including language-specific syntax
   - ✓ Keep it high-level and language-independent

2. **Too vague**
   - ❌ "Process the data"
   - ✓ "FOR each element in array, calculate sum"

3. **Inconsistent style**
   - ❌ Mixing CAPS and lowercase randomly
   - ✓ Use consistent convention

4. **Missing edge cases**
   - ❌ Not handling empty arrays, null values
   - ✓ Check boundaries and special cases

5. **Unclear variable names**
   - ❌ Using `x`, `y`, `z` everywhere
   - ✓ Use descriptive names like `totalSum`, `maxValue`

6. **No indentation**
   - ❌ All statements at same level
   - ✓ Indent to show structure

**Best Practices:**
- Be clear and concise
- Use standard conventions
- Focus on logic, not syntax
- Include comments for clarity
- Handle edge cases

---

### Question 9: Write pseudocode to merge two sorted arrays.

**Answer:**

```
FUNCTION mergeSortedArrays(arr1, n1, arr2, n2)
    SET result = []
    SET i = 0, j = 0
    
    WHILE i < n1 AND j < n2 DO
        IF arr1[i] <= arr2[j] THEN
            ADD arr1[i] to result
            SET i = i + 1
        ELSE
            ADD arr2[j] to result
            SET j = j + 1
        ENDIF
    END WHILE
    
    // Add remaining elements from arr1
    WHILE i < n1 DO
        ADD arr1[i] to result
        SET i = i + 1
    END WHILE
    
    // Add remaining elements from arr2
    WHILE j < n2 DO
        ADD arr2[j] to result
        SET j = j + 1
    END WHILE
    
    RETURN result
END FUNCTION
```

**Time Complexity:** O(n1 + n2)  
**Space Complexity:** O(n1 + n2)

---

### Question 10: How does pseudocode help in interviews?

**Answer:**

**Benefits in Interviews:**

1. **Shows thought process**
   - Demonstrates problem-solving approach
   - Shows algorithmic thinking

2. **Catches errors early**
   - Identify logical flaws before coding
   - Easier to fix in pseudocode

3. **Saves time**
   - Quicker to write than actual code
   - Can iterate on approach faster

4. **Language-agnostic**
   - Works for any programming language
   - Focuses on algorithm, not syntax

5. **Communication**
   - Explain approach to interviewer
   - Get feedback before implementing

**Interview Strategy:**
1. Understand problem
2. Write pseudocode
3. Discuss with interviewer
4. Get approval
5. Convert to code
6. Test and optimize

---

## <a name="mcqs"></a>7. Multiple Choice Questions

### MCQ 1
**What is the primary purpose of pseudocode?**

A) To execute programs  
B) To design algorithms before coding  
C) To replace actual programming  
D) To compile into machine code

<details>
<summary>Answer</summary>
**B) To design algorithms before coding**

Pseudocode is a planning tool used to design and communicate algorithms in a language-independent way before writing actual code.
</details>

---

### MCQ 2
**Which of the following is NOT a valid pseudocode keyword?**

A) IF  
B) #include  
C) WHILE  
D) FOR

<details>
<summary>Answer</summary>
**B) #include**

`#include` is C/C++ specific syntax. Pseudocode should be language-independent and use generic keywords like IF, WHILE, FOR.
</details>

---

### MCQ 3
**What is the output of this pseudocode?**
```
SET x = 5
SET y = 10
SET x = x + y
SET y = x - y
SET x = x - y
PRINT x, y
```

A) 5, 10  
B) 10, 5  
C) 15, 5  
D) 5, 15

<details>
<summary>Answer</summary>
**B) 10, 5**

This is a classic swap without using a temporary variable:
- x = 5 + 10 = 15
- y = 15 - 10 = 5
- x = 15 - 5 = 10
Result: x=10, y=5 (values swapped)
</details>

---

### MCQ 4
**How many times will this loop execute?**
```
SET i = 0
WHILE i < 5 DO
    PRINT i
    SET i = i + 2
END WHILE
```

A) 2  
B) 3  
C) 4  
D) 5

<details>
<summary>Answer</summary>
**B) 3**

Loop executes when i < 5:
- i=0 (print), i=2
- i=2 (print), i=4
- i=4 (print), i=6
- i=6, condition false, stop

Total: 3 times (i=0, 2, 4)
</details>

---

### MCQ 5
**What does MOD operator return?**

A) Quotient of division  
B) Remainder of division  
C) Multiplication result  
D) Modulus of a number

<details>
<summary>Answer</summary>
**B) Remainder of division**

MOD (modulo) operator returns the remainder after division.
Examples:
- 10 MOD 3 = 1
- 15 MOD 4 = 3
- 20 MOD 5 = 0
</details>

---

### MCQ 6
**Which structure best describes a recursive algorithm in pseudocode?**

A) A function that calls itself  
B) A loop that never ends  
C) Multiple nested loops  
D) Sequential statements

<details>
<summary>Answer</summary>
**A) A function that calls itself**

Recursion is when a function calls itself with modified parameters until reaching a base case.

Example:
```
FUNCTION factorial(n)
    IF n == 0 THEN
        RETURN 1
    ENDIF
    RETURN n * factorial(n-1)
END FUNCTION
```
</details>

---

### MCQ 7
**What is the time complexity of this pseudocode?**
```
FOR i FROM 1 TO n DO
    FOR j FROM 1 TO n DO
        PRINT i, j
    END FOR
END FOR
```

A) O(n)  
B) O(n log n)  
C) O(n²)  
D) O(2^n)

<details>
<summary>Answer</summary>
**C) O(n²)**

Two nested loops, each running n times: n × n = n²
</details>

---

### MCQ 8
**Which pseudocode represents finding minimum in an array?**

A)
```
SET min = array[0]
FOR each element in array DO
    IF element > min THEN SET min = element
END FOR
```

B)
```
SET min = array[0]
FOR each element in array DO
    IF element < min THEN SET min = element
END FOR
```

C)
```
SET min = 0
FOR each element in array DO
    SET min = min + element
END FOR
```

D)
```
SORT array
RETURN array[length-1]
```

<details>
<summary>Answer</summary>
**B)**
```
SET min = array[0]
FOR each element in array DO
    IF element < min THEN SET min = element
END FOR
```

This correctly finds minimum by:
1. Starting with first element as min
2. Comparing each element
3. Updating min if smaller element found
</details>

---

### MCQ 9
**What does this pseudocode check?**
```
FUNCTION check(n)
    IF n <= 1 THEN RETURN false
    FOR i FROM 2 TO sqrt(n) DO
        IF n MOD i == 0 THEN RETURN false
    END FOR
    RETURN true
END FUNCTION
```

A) Even number  
B) Prime number  
C) Perfect square  
D) Palindrome

<details>
<summary>Answer</summary>
**B) Prime number**

This checks if n is prime:
- Returns false if n ≤ 1
- Checks if any number from 2 to √n divides n
- Returns true if no divisors found (prime)
</details>

---

### MCQ 10
**What is missing in this pseudocode?**
```
FUNCTION divide(a, b)
    RETURN a / b
END FUNCTION
```

A) Variable declarations  
B) Loop structure  
C) Error handling for division by zero  
D) Nothing, it's complete

<details>
<summary>Answer</summary>
**C) Error handling for division by zero**

Better version:
```
FUNCTION divide(a, b)
    IF b == 0 THEN
        PRINT "Error: Division by zero"
        RETURN null
    ENDIF
    RETURN a / b
END FUNCTION
```

Always handle edge cases!
</details>

---

## <a name="challenges"></a>8. Practice Challenges

### Challenge 1: Factorial Calculation ⭐
**Difficulty:** Easy

Write pseudocode to calculate the factorial of a number n. Include both iterative and recursive approaches.

**Requirements:**
- Handle n = 0 (returns 1)
- Handle negative numbers (return error)
- Compare both approaches

<details>
<summary>Solution Hint</summary>

**Iterative:**
```
FUNCTION factorial_iterative(n)
    IF n < 0 THEN RETURN error
    IF n == 0 THEN RETURN 1
    
    SET result = 1
    FOR i FROM 1 TO n DO
        SET result = result * i
    END FOR
    RETURN result
END FUNCTION
```

**Recursive:**
```
FUNCTION factorial_recursive(n)
    IF n < 0 THEN RETURN error
    IF n == 0 THEN RETURN 1
    RETURN n * factorial_recursive(n-1)
END FUNCTION
```
</details>

---

### Challenge 2: Password Validator ⭐⭐
**Difficulty:** Medium

Write pseudocode to validate a password based on these rules:
- At least 8 characters long
- Contains at least one uppercase letter
- Contains at least one lowercase letter
- Contains at least one digit
- Contains at least one special character

<details>
<summary>Solution Hint</summary>

```
FUNCTION validatePassword(password)
    IF length(password) < 8 THEN
        RETURN false, "Too short"
    ENDIF
    
    SET hasUpper = false
    SET hasLower = false
    SET hasDigit = false
    SET hasSpecial = false
    
    FOR each char in password DO
        IF char is uppercase letter THEN SET hasUpper = true
        IF char is lowercase letter THEN SET hasLower = true
        IF char is digit THEN SET hasDigit = true
        IF char is special character THEN SET hasSpecial = true
    END FOR
    
    IF hasUpper AND hasLower AND hasDigit AND hasSpecial THEN
        RETURN true, "Valid password"
    ELSE
        RETURN false, "Missing requirements"
    ENDIF
END FUNCTION
```
</details>

---

### Challenge 3: Matrix Transpose ⭐⭐
**Difficulty:** Medium

Write pseudocode to find the transpose of a matrix (rows become columns).

**Example:**
```
Input:  [1, 2, 3]        Output: [1, 4]
        [4, 5, 6]                [2, 5]
                                 [3, 6]
```

<details>
<summary>Solution Hint</summary>

```
FUNCTION transposeMatrix(matrix, rows, cols)
    CREATE transpose[cols][rows]
    
    FOR i FROM 0 TO rows-1 DO
        FOR j FROM 0 TO cols-1 DO
            SET transpose[j][i] = matrix[i][j]
        END FOR
    END FOR
    
    RETURN transpose
END FUNCTION
```
</details>

---

### Challenge 4: GCD Calculator ⭐⭐⭐
**Difficulty:** Hard

Write pseudocode to find the Greatest Common Divisor (GCD) of two numbers using Euclid's algorithm.

**Example:** GCD(48, 18) = 6

<details>
<summary>Solution Hint</summary>

**Iterative:**
```
FUNCTION gcd(a, b)
    WHILE b != 0 DO
        SET temp = b
        SET b = a MOD b
        SET a = temp
    END WHILE
    RETURN a
END FUNCTION
```

**Recursive:**
```
FUNCTION gcd_recursive(a, b)
    IF b == 0 THEN
        RETURN a
    ENDIF
    RETURN gcd_recursive(b, a MOD b)
END FUNCTION
```
</details>

---

### Challenge 5: Array Rotation ⭐⭐⭐
**Difficulty:** Hard

Write pseudocode to rotate an array to the right by k positions.

**Example:** 
- Input: [1,2,3,4,5], k=2
- Output: [4,5,1,2,3]

<details>
<summary>Solution Hint</summary>

```
FUNCTION rotateArray(array, n, k)
    SET k = k MOD n  // Handle k > n
    
    // Reverse entire array
    REVERSE array FROM 0 TO n-1
    
    // Reverse first k elements
    REVERSE array FROM 0 TO k-1
    
    // Reverse remaining elements
    REVERSE array FROM k TO n-1
    
    RETURN array
END FUNCTION

FUNCTION reverse(array, start, end)
    WHILE start < end DO
        SWAP array[start] and array[end]
        SET start = start + 1
        SET end = end - 1
    END WHILE
END FUNCTION
```

**Alternative: Using Extra Space**
```
FUNCTION rotateArray(array, n, k)
    SET k = k MOD n
    CREATE temp[n]
    
    FOR i FROM 0 TO n-1 DO
        SET newPos = (i + k) MOD n
        SET temp[newPos] = array[i]
    END FOR
    
    RETURN temp
END FUNCTION
```
</details>

---

## <a name="references"></a>9. References & Resources

### Books
- **"Introduction to Algorithms"** by Cormen, Leiserson, Rivest, and Stein (CLRS)
- **"The Algorithm Design Manual"** by Steven Skiena
- **"Pseudocode: A Tool for Planning and Documenting Program Logic**

### Online Resources
- [GeeksforGeeks Pseudocode Guide](https://www.geeksforgeeks.org/)
- [Khan Academy - Algorithms](https://www.khanacademy.org/computing/computer-science/algorithms)
- [MIT OpenCourseWare - Introduction to Algorithms](https://ocw.mit.edu/)

### Practice Platforms
- **LeetCode** - Algorithm practice
- **HackerRank** - Coding challenges
- **CodeChef** - Competitive programming
- **Codeforces** - Algorithm contests

### Video Tutorials
- Abdul Bari - Algorithm explanations
- MIT 6.006 Introduction to Algorithms
- CS Dojo - Programming tutorials

---

## 🎯 Key Takeaways

1. **Pseudocode is for humans** - Focus on clarity, not syntax
2. **Use consistent style** - Stick to conventions
3. **Think before coding** - Plan logic with pseudocode
4. **Language-independent** - Works for any programming language
5. **Include edge cases** - Handle special scenarios
6. **Keep it simple** - Don't overcomplicate
7. **Practice regularly** - Write pseudocode for all problems

---

## ✅ Checklist for Good Pseudocode

- [ ] Uses clear, descriptive variable names
- [ ] Properly indented for readability
- [ ] Includes comments where needed
- [ ] Handles edge cases
- [ ] Uses standard keywords consistently
- [ ] Logic is easy to follow
- [ ] Can be converted to any language
- [ ] Contains no language-specific syntax

---

**Next Steps:**
1. Practice writing pseudocode for new problems
2. Convert pseudocode examples to your preferred language
3. Use pseudocode in interviews to explain approach
4. Review the 15 curriculum examples regularly
5. Complete all practice challenges

**Remember:** The goal of pseudocode is communication and clarity. If someone else can understand your algorithm from your pseudocode, you've succeeded!
