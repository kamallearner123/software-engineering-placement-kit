# C/C++ Essentials: Complete Guide

> **Module:** Programming - C/C++/Python Efficient Coding  
> **Topic:** C/C++ Fundamentals, Pointers, and Memory Management  
> **Duration:** 2 hours

## 📚 Table of Contents

1. [Introduction to C/C++](#introduction)
2. [Basic Syntax and Data Types](#basics)
3. [Pointers and References](#pointers)
4. [Memory Management](#memory)
5. [Arrays and Strings](#arrays-strings)
6. [Structures and Unions](#structures)
7. [Common Pitfalls and Best Practices](#pitfalls)
8. [Interview Questions](#interview-questions)
9. [Multiple Choice Questions](#mcqs)
10. [Practice Challenges](#challenges)
11. [References](#references)

---

## <a name="introduction"></a>1. Introduction to C/C++

### Why Learn C/C++?

✅ **System programming** - Operating systems, embedded systems  
✅ **Performance** - Direct hardware access, minimal overhead  
✅ **Foundation** - Understanding how computers work  
✅ **Industry demand** - Used in game dev, systems, high-performance computing  
✅ **Interview essential** - Core concepts tested heavily

### C vs C++

| Feature | C | C++ |
|---------|---|-----|
| **Paradigm** | Procedural | Multi-paradigm (OOP + Procedural) |
| **Classes** | No | Yes |
| **Function Overloading** | No | Yes |
| **References** | No | Yes |
| **STL** | No | Yes |
| **Memory** | malloc/free | new/delete + RAII |
| **Compilation** | gcc | g++ |

---

## <a name="basics"></a>2. Basic Syntax and Data Types

### 2.1 Basic Program Structure

**C Program:**
```c
#include <stdio.h>

int main() {
    printf("Hello, World!\n");
    return 0;
}
```

**C++ Program:**
```cpp
#include <iostream>
using namespace std;

int main() {
    cout << "Hello, World!" << endl;
    return 0;
}
```

---

### 2.2 Data Types

#### Primitive Types

```cpp
// Integer types
int age = 25;              // 4 bytes, -2^31 to 2^31-1
short num = 100;           // 2 bytes
long big = 1000000L;       // 4 or 8 bytes
long long huge = 1000000000000LL;  // 8 bytes

// Unsigned versions
unsigned int count = 100;

// Floating point
float price = 99.99f;      // 4 bytes, ~7 decimal digits
double precise = 3.14159;  // 8 bytes, ~15 decimal digits

// Character
char grade = 'A';          // 1 byte

// Boolean (C++)
bool isValid = true;       // C++
int flag = 1;              // C (0 = false, non-zero = true)
```

#### Checking Size

```cpp
#include <iostream>
using namespace std;

int main() {
    cout << "int: " << sizeof(int) << " bytes" << endl;
    cout << "char: " << sizeof(char) << " bytes" << endl;
    cout << "float: " << sizeof(float) << " bytes" << endl;
    cout << "double: " << sizeof(double) << " bytes" << endl;
    cout << "pointer: " << sizeof(int*) << " bytes" << endl;
    return 0;
}
```

---

### 2.3 Input/Output

**C Style:**
```c
int age;
scanf("%d", &age);        // Input
printf("Age: %d\n", age); // Output
```

**C++ Style:**
```cpp
int age;
cin >> age;               // Input
cout << "Age: " << age << endl;  // Output
```

---

### 2.4 Operators

```cpp
// Arithmetic
int a = 10, b = 3;
a + b;   // 13
a - b;   // 7
a * b;   // 30
a / b;   // 3 (integer division)
a % b;   // 1 (modulo)

// Comparison
a == b;  // false
a != b;  // true
a > b;   // true
a < b;   // false

// Logical
bool x = true, y = false;
x && y;  // false (AND)
x || y;  // true (OR)
!x;      // false (NOT)

// Bitwise
int c = 5, d = 3;
c & d;   // 1 (AND)
c | d;   // 7 (OR)
c ^ d;   // 6 (XOR)
c << 1;  // 10 (left shift)
c >> 1;  // 2 (right shift)
```

---

## <a name="pointers"></a>3. Pointers and References

### 3.1 What is a Pointer?

A **pointer** is a variable that stores the memory address of another variable.

```cpp
int x = 10;
int* ptr = &x;  // ptr stores address of x

cout << x;      // 10 (value of x)
cout << &x;     // 0x7ffd... (address of x)
cout << ptr;    // 0x7ffd... (address stored in ptr)
cout << *ptr;   // 10 (value at address ptr points to)
```

**Visual Representation:**
```
Memory:
Address    Variable    Value
0x1000     x          10
0x2000     ptr        0x1000
```

---

### 3.2 Pointer Operations

```cpp
int x = 10;
int* ptr = &x;

// Dereferencing - access value
cout << *ptr;        // 10

// Modifying through pointer
*ptr = 20;
cout << x;           // 20 (x changed!)

// Pointer arithmetic
int arr[] = {10, 20, 30};
int* p = arr;
cout << *p;          // 10
cout << *(p + 1);    // 20
cout << *(p + 2);    // 30
```

---

### 3.3 Null Pointers

```cpp
int* ptr = nullptr;  // C++11 (recommended)
int* ptr = NULL;     // C style
int* ptr = 0;        // Old C++ style

// Always check before dereferencing
if (ptr != nullptr) {
    cout << *ptr;
}
```

---

### 3.4 Pointer to Pointer

```cpp
int x = 10;
int* ptr = &x;
int** pptr = &ptr;

cout << x;           // 10
cout << *ptr;        // 10
cout << **pptr;      // 10
```

---

### 3.5 References (C++ Only)

A **reference** is an alias for another variable.

```cpp
int x = 10;
int& ref = x;  // ref is another name for x

cout << x;     // 10
cout << ref;   // 10

ref = 20;      // Changes x
cout << x;     // 20
```

#### Pointer vs Reference

| Feature | Pointer | Reference |
|---------|---------|-----------|
| **Syntax** | `int* ptr` | `int& ref` |
| **Can be null** | Yes | No |
| **Can be reassigned** | Yes | No |
| **Requires dereferencing** | Yes (`*ptr`) | No |
| **Use case** | Flexibility | Function parameters |

**Example:**
```cpp
void swap(int* a, int* b) {  // Using pointers
    int temp = *a;
    *a = *b;
    *b = temp;
}

void swap(int& a, int& b) {  // Using references
    int temp = a;
    a = b;
    b = temp;
}
```

---

## <a name="memory"></a>4. Memory Management

### 4.1 Stack vs Heap

**Stack Memory:**
- Automatic allocation/deallocation
- Limited size
- Fast access
- Variables go out of scope automatically

```cpp
void function() {
    int x = 10;  // Allocated on stack
}  // x automatically destroyed
```

**Heap Memory:**
- Manual allocation/deallocation
- Large size
- Slower access
- Must be explicitly freed

---

### 4.2 Dynamic Memory Allocation

#### C Style (malloc/free)

```c
#include <stdlib.h>

// Allocate
int* ptr = (int*)malloc(sizeof(int));
if (ptr == NULL) {
    // Allocation failed
    return -1;
}

*ptr = 10;

// Free
free(ptr);
ptr = NULL;  // Good practice

// Array allocation
int* arr = (int*)malloc(5 * sizeof(int));
free(arr);

// Using calloc (initialized to 0)
int* arr2 = (int*)calloc(5, sizeof(int));
free(arr2);
```

#### C++ Style (new/delete)

```cpp
// Single variable
int* ptr = new int;
*ptr = 10;
delete ptr;
ptr = nullptr;

// With initialization
int* x = new int(10);
delete x;

// Array
int* arr = new int[5];
delete[] arr;  // Note: delete[] for arrays

// 2D array
int** matrix = new int*[3];
for (int i = 0; i < 3; i++) {
    matrix[i] = new int[4];
}

// Free 2D array
for (int i = 0; i < 3; i++) {
    delete[] matrix[i];
}
delete[] matrix;
```

---

### 4.3 Memory Leaks

**What is a Memory Leak?**

When dynamically allocated memory is not freed.

**Bad Example:**
```cpp
void function() {
    int* ptr = new int(10);
    return;  // Memory leak! ptr not deleted
}
```

**Good Example:**
```cpp
void function() {
    int* ptr = new int(10);
    // Use ptr
    delete ptr;  // Memory freed
}
```

**Detection Tools:**
- Valgrind (Linux)
- AddressSanitizer
- Visual Studio Memory Profiler

---

### 4.4 Smart Pointers (C++11)

Automatic memory management using RAII.

```cpp
#include <memory>

// unique_ptr - exclusive ownership
std::unique_ptr<int> ptr1(new int(10));
// Or better:
auto ptr2 = std::make_unique<int>(10);

// shared_ptr - shared ownership
std::shared_ptr<int> sp1 = std::make_shared<int>(10);
std::shared_ptr<int> sp2 = sp1;  // Both point to same object

// No need to delete - automatic cleanup!
```

---

## <a name="arrays-strings"></a>5. Arrays and Strings

### 5.1 Arrays

```cpp
// Declaration and initialization
int arr[5];  // Uninitialized
int arr2[5] = {1, 2, 3, 4, 5};
int arr3[] = {1, 2, 3};  // Size inferred as 3

// Access
arr2[0] = 10;
cout << arr2[0];

// Size
int size = sizeof(arr2) / sizeof(arr2[0]);

// 2D arrays
int matrix[3][4] = {
    {1, 2, 3, 4},
    {5, 6, 7, 8},
    {9, 10, 11, 12}
};
cout << matrix[1][2];  // 7
```

---

### 5.2 Array and Pointers

```cpp
int arr[] = {10, 20, 30};
int* ptr = arr;  // arr decays to pointer

cout << arr[0];    // 10
cout << *ptr;      // 10
cout << *(ptr+1);  // 20
cout << ptr[1];    // 20 (equivalent to *(ptr+1))
```

---

### 5.3 Strings in C

```c
// Character array
char str[10] = "Hello";  // Null-terminated: 'H','e','l','l','o','\0'

// Operations
#include <string.h>

strlen(str);           // Length
strcpy(dest, src);     // Copy
strcat(dest, src);     // Concatenate
strcmp(str1, str2);    // Compare (0 if equal)
```

**Example:**
```c
char str1[20] = "Hello";
char str2[] = " World";

strcat(str1, str2);    // str1 becomes "Hello World"
printf("%s\n", str1);
```

---

### 5.4 Strings in C++

```cpp
#include <string>

// std::string
std::string str = "Hello";

// Operations
str.length();          // Length
str + " World";        // Concatenation
str[0];                // Access
str.substr(0, 3);      // Substring
str.find("ll");        // Find

// Comparison
str == "Hello";        // true
str < "World";         // Lexicographic

// Conversion
int num = std::stoi("123");
string s = std::to_string(123);
```

---

## <a name="structures"></a>6. Structures and Unions

### 6.1 Structures

```cpp
struct Student {
    int id;
    char name[50];
    float gpa;
};

// Usage
Student s1;
s1.id = 101;
strcpy(s1.name, "John");
s1.gpa = 3.8;

// Pointer to struct
Student* ptr = &s1;
ptr->id = 102;  // arrow operator
```

**C++ Class Style:**
```cpp
struct Point {
    int x, y;
    
    // Constructor
    Point(int a, int b) : x(a), y(b) {}
    
    // Method
    void print() {
        cout << "(" << x << ", " << y << ")" << endl;
    }
};

Point p(10, 20);
p.print();
```

---

### 6.2 Unions

All members share the same memory location.

```cpp
union Data {
    int i;
    float f;
    char str[20];
};

Data data;
data.i = 10;
cout << data.i;     // 10

data.f = 220.5;
cout << data.f;     // 220.5
cout << data.i;     // Garbage (overwritten)

// Size = size of largest member
cout << sizeof(Data);  // 20 bytes
```

---

### 6.3 Typedef

Create aliases for types.

```cpp
typedef unsigned long ulong;
typedef struct Student Student;  // C style

ulong x = 1000000;
Student s;

// C++11: using (preferred)
using uint = unsigned int;
using StudentPtr = Student*;
```

---

## <a name="pitfalls"></a>7. Common Pitfalls and Best Practices

### 7.1 Common Pitfalls

#### 1. Array Index Out of Bounds
```cpp
int arr[5];
arr[10] = 5;  // ❌ Undefined behavior
```

#### 2. Null Pointer Dereference
```cpp
int* ptr = nullptr;
*ptr = 10;  // ❌ Crash!

// Always check
if (ptr != nullptr) {
    *ptr = 10;  // ✓ Safe
}
```

#### 3. Memory Leak
```cpp
void function() {
    int* ptr = new int(10);
}  // ❌ Memory leak

void function() {
    int* ptr = new int(10);
    delete ptr;  // ✓ Good
}
```

#### 4. Double Free
```cpp
int* ptr = new int(10);
delete ptr;
delete ptr;  // ❌ Undefined behavior!
```

#### 5. Dangling Pointer
```cpp
int* ptr = new int(10);
delete ptr;
*ptr = 20;  // ❌ Accessing freed memory
```

#### 6. Buffer Overflow
```cpp
char str[5];
strcpy(str, "Hello World");  // ❌ Buffer overflow
```

---

### 7.2 Best Practices

✅ **Initialize variables**
```cpp
int x = 0;  // Good
int x;      // Uninitialized - dangerous
```

✅ **Use const for constants**
```cpp
const int SIZE = 100;
const int* ptr = &x;  // Can't modify *ptr
```

✅ **Prefer references over pointers for parameters**
```cpp
void process(const string& str) {  // Good
    // Can't modify str, no copy
}
```

✅ **Check allocation success**
```cpp
int* ptr = new(std::nothrow) int[1000000];
if (!ptr) {
    // Handle allocation failure
}
```

✅ **Use smart pointers (C++11+)**
```cpp
auto ptr = std::make_unique<int>(10);
// Automatic cleanup
```

✅ **Avoid magic numbers**
```cpp
const int MAX_STUDENTS = 100;
int students[MAX_STUDENTS];  // Good

int students[100];  // Bad
```

---

## <a name="interview-questions"></a>8. Interview Questions

### Question 1: What is a pointer? Explain with an example.

**Answer:**

A **pointer** is a variable that stores the memory address of another variable.

**Example:**
```cpp
int x = 10;           // Regular variable
int* ptr = &x;        // Pointer to x

cout << x;            // 10 (value of x)
cout << &x;           // 0x7ffd5467 (address of x)
cout << ptr;          // 0x7ffd5467 (same address)
cout << *ptr;         // 10 (dereference - value at address)
```

**Key Operations:**
- `&` - Address-of operator
- `*` - Dereference operator (when used with pointer)
- `*` - Declaration (when declaring pointer type)

---

### Question 2: Difference between pointer and reference?

**Answer:**

| Aspect | Pointer | Reference |
|--------|---------|-----------|
| **Syntax** | `int* ptr` | `int& ref` |
| **Null value** | Can be NULL | Cannot be NULL |
| **Reassignment** | Can point to different variables | Cannot be rebound |
| **Memory** | Occupies memory | May not occupy memory |
| **Dereferencing** | Required (`*ptr`) | Not required |
| **Initialization** | Can be uninitialized | Must be initialized |

**Example:**
```cpp
int x = 10, y = 20;

// Pointer
int* ptr = &x;
*ptr = 15;      // x becomes 15
ptr = &y;       // Can reassign

// Reference
int& ref = x;
ref = 15;       // x becomes 15
ref = y;        // This copies y's value to x, doesn't rebind ref!
```

**When to use:**
- **Pointer**: Need null values, reassignment, optional parameters
- **Reference**: Function parameters (cleaner syntax), must refer to valid object

---

### Question 3: Explain malloc vs new.

**Answer:**

| Feature | malloc | new |
|---------|--------|-----|
| **Language** | C | C++ |
| **Type** | Function | Operator |
| **Constructor** | No | Yes |
| **Return type** | void* | Typed pointer |
| **Failure** | Returns NULL | Throws exception |
| **Deallocation** | free() | delete |
| **Syntax** | Cast required | No cast |

**Examples:**
```cpp
// malloc (C style)
int* ptr1 = (int*)malloc(sizeof(int));
if (ptr1 == NULL) {
    // Handle error
}
*ptr1 = 10;
free(ptr1);

// new (C++ style)
int* ptr2 = new int(10);  // Initialized to 10
delete ptr2;

// Arrays
int* arr1 = (int*)malloc(5 * sizeof(int));
free(arr1);

int* arr2 = new int[5];
delete[] arr2;  // Note: delete[]
```

**Recommendation:** Use `new`/`delete` in C++, or better, use smart pointers!

---

### Question 4: What is a memory leak and how to prevent it?

**Answer:**

A **memory leak** occurs when dynamically allocated memory is not freed, causing the program to consume increasing amounts of memory.

**Example of Memory Leak:**
```cpp
void function() {
    int* ptr = new int[1000];
    // Forgot to delete
}  // ptr goes out of scope, memory lost!
```

**Prevention Methods:**

**1. Manual Management:**
```cpp
void function() {
    int* ptr = new int[1000];
    // Use ptr
    delete[] ptr;  // Always delete
}
```

**2. RAII (Resource Acquisition Is Initialization):**
```cpp
class MyClass {
    int* data;
public:
    MyClass() : data(new int[1000]) {}
    ~MyClass() { delete[] data; }  // Automatic cleanup
};
```

**3. Smart Pointers (Recommended):**
```cpp
void function() {
    auto ptr = std::make_unique<int[]>(1000);
    // Automatic cleanup when ptr goes out of scope
}
```

**4. Use Tools:**
- Valgrind (Linux)
- AddressSanitizer
- Static analyzers

---

### Question 5: Explain function overloading in C++.

**Answer:**

**Function overloading** allows multiple functions with the same name but different parameters.

**Rules:**
- Same name
- Different number of parameters OR different types
- Return type alone is NOT sufficient

**Example:**
```cpp
// Overloaded functions
int add(int a, int b) {
    return a + b;
}

double add(double a, double b) {
    return a + b;
}

int add(int a, int b, int c) {
    return a + b + c;
}

// Usage
cout << add(5, 3);           // Calls first (int, int)
cout << add(5.5, 3.2);       // Calls second (double, double)
cout << add(1, 2, 3);        // Calls third (int, int, int)
```

**Compile-time Polymorphism:**
- Compiler determines which function to call based on arguments
- Resolved at compile time

**NOT Valid Overloading:**
```cpp
int func(int a);
double func(int a);  // ❌ Only return type different
```

---

### Question 6: What is the difference between struct and class in C++?

**Answer:**

| Feature | struct | class |
|---------|--------|-------|
| **Default access** | public | private |
| **Usage convention** | Plain data | OOP with behavior |
| **Inheritance** | public by default | private by default |

**structs are classes with different defaults!**

**Example:**
```cpp
struct Point {
    int x, y;  // Public by default
};

class Point2 {
    int x, y;  // Private by default
public:
    int getX() { return x; }
};

Point p;
p.x = 10;  // ✓ OK

Point2 p2;
p2.x = 10;  // ❌ Error: x is private
```

**Convention:**
- Use `struct` for passive data structures (POD types)
- Use `class` for active objects with invariants and behavior

---

### Question 7: Explain the const keyword with examples.

**Answer:**

**const** indicates that a value cannot be modified.

**1. Const Variable:**
```cpp
const int x = 10;
x = 20;  // ❌ Error
```

**2. Pointer to Const:**
```cpp
const int* ptr = &x;
*ptr = 20;  // ❌ Can't modify value
ptr = &y;   // ✓ Can change pointer
```

**3. Const Pointer:**
```cpp
int* const ptr = &x;
*ptr = 20;  // ✓ Can modify value
ptr = &y;   // ❌ Can't change pointer
```

**4. Const Pointer to Const:**
```cpp
const int* const ptr = &x;
*ptr = 20;  // ❌ Can't modify value
ptr = &y;   // ❌ Can't change pointer
```

**5. Const Function Parameter:**
```cpp
void print(const string& str) {
    // str cannot be modified
    // No copy made (reference)
}
```

**6. Const Member Function:**
```cpp
class MyClass {
    int value;
public:
    int getValue() const {  // Doesn't modify object
        return value;
    }
};
```

---

### Question 8: What is segmentation fault?

**Answer:**

A **segmentation fault** (segfault) occurs when a program tries to access memory it doesn't have permission to access.

**Common Causes:**

**1. Null Pointer Dereference:**
```cpp
int* ptr = nullptr;
*ptr = 10;  // Segfault!
```

**2. Array Out of Bounds:**
```cpp
int arr[5];
arr[100] = 10;  // Segfault!
```

**3. Dangling Pointer:**
```cpp
int* ptr = new int(10);
delete ptr;
*ptr = 20;  // Segfault!
```

**4. Stack Overflow:**
```cpp
void recurse() {
    recurse();  // Infinite recursion - Segfault!
}
```

**Prevention:**
- Always initialize pointers
- Check for nullptr before dereferencing
- Respect array bounds
- Don't use freed memory
- Avoid deep recursion

**Debugging:**
- Use debugger (gdb, lldb)
- Enable core dumps
- Use AddressSanitizer
- Add assertions and checks

---

### Question 9: Explain static keyword in C/C++.

**Answer:**

**static** has different meanings in different contexts:

**1. Static Local Variable:**
```cpp
void function() {
    static int count = 0;  // Initialized once
    count++;
    cout << count << endl;
}

function();  // Prints 1
function();  // Prints 2
function();  // Prints 3
```
- Retains value between function calls
- Initialized only once

**2. Static Global Variable:**
```c
// file1.c
static int x = 10;  // File scope only

// file2.c
extern int x;  // ❌ Error: x not visible
```
- Limits scope to current file

**3. Static Member Variable (C++):**
```cpp
class MyClass {
    static int count;  // Shared by all objects
public:
    MyClass() { count++; }
};

int MyClass::count = 0;  // Definition

MyClass obj1;  // count = 1
MyClass obj2;  // count = 2
```

**4. Static Member Function (C++):**
```cpp
class Math {
public:
    static int add(int a, int b) {
        return a + b;
    }
};

Math::add(5, 3);  // Call without object
```

---

### Question 10: How to pass array to a function?

**Answer:**

Arrays decay to pointers when passed to functions.

**Methods:**

**1. As Pointer (most common):**
```cpp
void process(int* arr, int size) {
    for (int i = 0; i < size; i++) {
        cout << arr[i] << " ";
    }
}

int main() {
    int numbers[] = {1, 2, 3, 4, 5};
    process(numbers, 5);
}
```

**2. As Array with known size:**
```cpp
void process(int arr[5]) {  // Same as int* arr
    // size information lost
}
```

**3. As Reference to Array (C++):**
```cpp
void process(int (&arr)[5]) {  // Size preserved
    for (int i = 0; i < 5; i++) {
        cout << arr[i] << " ";
    }
}
```

**4. Using std::vector (C++):**
```cpp
void process(vector<int>& vec) {
    for (int x : vec) {
        cout << x << " ";
    }
}
```

**Note:** Array size is NOT preserved (except with reference to array)

---

## <a name="mcqs"></a>9. Multiple Choice Questions

### MCQ 1
**What is the output?**
```cpp
int x = 5;
int* ptr = &x;
*ptr = 10;
cout << x;
```

A) 5  
B) 10  
C) Address of x  
D) Compilation error

<details>
<summary>Answer</summary>
**B) 10**

ptr points to x, so modifying *ptr modifies x.
</details>

---

### MCQ 2
**What is the size of a pointer on a 64-bit system?**

A) 4 bytes  
B) 8 bytes  
C) Depends on pointed type  
D) 16 bytes

<details>
<summary>Answer</summary>
**B) 8 bytes**

Pointer size depends on system architecture, not on the type it points to. On 64-bit systems, pointers are 8 bytes.
</details>

---

### MCQ 3
**Which is correct?**

A) `delete arr;` for `int* arr = new int[10];`  
B) `delete[] arr;` for `int* arr = new int[10];`  
C) `free(arr);` for `int* arr = new int[10];`  
D) No need to delete

<details>
<summary>Answer</summary>
**B) `delete[] arr;`**

Arrays allocated with `new[]` must be freed with `delete[]`.
</details>

---

### MCQ 4
**What is the output?**
```cpp
int arr[] = {10, 20, 30};
cout << *(arr + 1);
```

A) 10  
B) 20  
C) 30  
D) Address

<details>
<summary>Answer</summary>
**B) 20**

arr + 1 points to second element, *(arr + 1) dereferences it.
</details>

---

### MCQ 5
**Which is NOT a valid pointer declaration?**

A) `int* ptr;`  
B) `int *ptr;`  
C) `int * ptr;`  
D) `int ptr*;`

<details>
<summary>Answer</summary>
**D) `int ptr*;`**

The asterisk must come before the variable name.
</details>

---

### MCQ 6
**What happens?**
```cpp
char str[5] = "Hello";
```

A) Compilation error  
B) Buffer overflow  
C) Runtime error  
D) Works fine

<details>
<summary>Answer</summary>
**A) Compilation error**

"Hello" requires 6 bytes (5 characters + '\0'). Array only has 5.
</details>

---

### MCQ 7
**Difference between malloc and calloc?**

A) malloc is faster  
B) calloc initializes to zero  
C) malloc for arrays, calloc for variables  
D) No difference

<details>
<summary>Answer</summary>
**B) calloc initializes to zero**

calloc initializes allocated memory to zero, malloc doesn't.
</details>

---

### MCQ 8
**What is the output?**
```cpp
int x = 5;
int& ref = x;
ref++;
cout << x;
```

A) 5  
B) 6  
C) Compilation error  
D) Undefined

<details>
<summary>Answer</summary>
**B) 6**

ref is a reference to x, incrementing ref increments x.
</details>

---

### MCQ 9
**Which is true about function overloading?**

A) Return type must be different  
B) Parameters must be different  
C) Function name must be different  
D) Not allowed in C++

<details>
<summary>Answer</summary>
**B) Parameters must be different**

Overloaded functions have same name but different parameters.
</details>

---

### MCQ 10
**What is the default access specifier in struct?**

A) private  
B) public  
C) protected  
D) No default

<details>
<summary>Answer</summary>
**B) public**

In struct, members are public by default. In class, they're private by default.
</details>

---

## <a name="challenges"></a>10. Practice Challenges

### Challenge 1: Pointer Swap ⭐
**Difficulty:** Easy

Write a function to swap two integers using pointers.

```cpp
void swap(int* a, int* b);

int main() {
    int x = 10, y = 20;
    swap(&x, &y);
    // x should be 20, y should be 10
}
```

<details>
<summary>Solution</summary>

```cpp
void swap(int* a, int* b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}
```
</details>

---

### Challenge 2: Dynamic Array ⭐⭐
**Difficulty:** Medium

Create a dynamic array class that:
- Allocates memory dynamically
- Supports push_back
- Supports access by index
- Automatically frees memory

<details>
<summary>Solution Hint</summary>

```cpp
class DynamicArray {
private:
    int* data;
    int size;
    int capacity;
    
public:
    DynamicArray() : data(nullptr), size(0), capacity(0) {}
    
    ~DynamicArray() {
        delete[] data;
    }
    
    void push_back(int value) {
        if (size == capacity) {
            // Double capacity
            capacity = (capacity == 0) ? 1 : capacity * 2;
            int* newData = new int[capacity];
            for (int i = 0; i < size; i++) {
                newData[i] = data[i];
            }
            delete[] data;
            data = newData;
        }
        data[size++] = value;
    }
    
    int operator[](int index) {
        return data[index];
    }
    
    int getSize() { return size; }
};
```
</details>

---

### Challenge 3: String Reverse ⭐⭐
**Difficulty:** Medium

Reverse a C-style string in-place using pointers.

```cpp
void reverse(char* str);
// Input: "hello"
// Output: "olleh"
```

<details>
<summary>Solution</summary>

```cpp
void reverse(char* str) {
    char* start = str;
    char* end = str;
    
    // Find end
    while (*end != '\0') {
        end++;
    }
    end--;  // Move back from '\0'
    
    // Swap
    while (start < end) {
        char temp = *start;
        *start = *end;
        *end = temp;
        start++;
        end--;
    }
}
```
</details>

---

### Challenge 4: Memory Leak Detector ⭐⭐⭐
**Difficulty:** Hard

Implement a simple memory leak detector that tracks allocations and deallocations.

<details>
<summary>Solution Hint</summary>

```cpp
#include <map>
#include <iostream>

class MemoryTracker {
private:
    static std::map<void*, size_t> allocations;
    
public:
    static void* allocate(size_t size) {
        void* ptr = malloc(size);
        allocations[ptr] = size;
        return ptr;
    }
    
    static void deallocate(void* ptr) {
        auto it = allocations.find(ptr);
        if (it != allocations.end()) {
            allocations.erase(it);
            free(ptr);
        }
    }
    
    static void report() {
        if (allocations.empty()) {
            std::cout << "No memory leaks!" << std::endl;
        } else {
            std::cout << "Memory leaks detected:" << std::endl;
            for (auto& pair : allocations) {
                std::cout << "Address: " << pair.first 
                         << ", Size: " << pair.second << std::endl;
            }
        }
    }
};

std::map<void*, size_t> MemoryTracker::allocations;
```
</details>

---

### Challenge 5: Smart Pointer Implementation ⭐⭐⭐
**Difficulty:** Hard

Implement a simple unique_ptr-like class.

<details>
<summary>Solution Hint</summary>

```cpp
template<typename T>
class UniquePtr {
private:
    T* ptr;
    
public:
    explicit UniquePtr(T* p = nullptr) : ptr(p) {}
    
    ~UniquePtr() {
        delete ptr;
    }
    
    // Delete copy constructor and assignment
    UniquePtr(const UniquePtr&) = delete;
    UniquePtr& operator=(const UniquePtr&) = delete;
    
    // Move constructor
    UniquePtr(UniquePtr&& other) : ptr(other.ptr) {
        other.ptr = nullptr;
    }
    
    // Move assignment
    UniquePtr& operator=(UniquePtr&& other) {
        if (this != &other) {
            delete ptr;
            ptr = other.ptr;
            other.ptr = nullptr;
        }
        return *this;
    }
    
    T& operator*() { return *ptr; }
    T* operator->() { return ptr; }
    T* get() { return ptr; }
};
```
</details>

---

## <a name="references"></a>11. References & Resources

### Official Documentation
- [C++ Reference](https://en.cppreference.com/)
- [C Reference](https://en.cppreference.com/w/c)
- [ISO C++ Standard](https://isocpp.org/)

### Books
- "The C Programming Language" - Kernighan & Ritchie
- "C++ Primer" - Stanley Lippman
- "Effective C++" - Scott Meyers
- "C++ Crash Course" - Josh Lospinoso

### Online Resources
- [LearnCpp.com](https://www.learncpp.com/)
- [GeeksforGeeks C/C++](https://www.geeksforgeeks.org/c-plus-plus/)
- [CPlusPlus.com](http://www.cplusplus.com/)

### Tools
- **Compiler:** g++, clang++, MSVC
- **Debugger:** gdb, lldb
- **Memory Tools:** Valgrind, AddressSanitizer
- **IDE:** VS Code, CLion, Visual Studio

---

## 🎯 Key Takeaways

1. **Pointers** store addresses - master pointer arithmetic
2. **References** are aliases - use for clean function parameters
3. **Memory management** is crucial - always free what you allocate
4. **Use smart pointers** in modern C++ - avoid manual memory management
5. **Understand const** - use it for safety and optimization
6. **Know your data types** - size matters for memory and performance
7. **Practice, practice, practice** - C/C++ requires hands-on experience

---

**Next Steps:**
1. Implement all code examples yourself
2. Complete all practice challenges
3. Debug programs using gdb/lldb
4. Read about C++11/14/17 features
5. Practice pointer problems daily

**Remember:** C/C++ gives you great power - use it responsibly. Always manage memory correctly and check for errors!
