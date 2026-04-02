# 💡 Programming Interview Questions & Answers (Expanded)

Core Programming interview questions (20+ total) for C, C++, and Python, including code snippets and logical steps.

---

## 1. malloc vs new
**Answer**: `malloc` (C function, no constructor); `new` (C++ operator, calls constructor).

---

## 2. Pointers vs References (C++)
**Answer**: Pointer (stores address, can be `NULL`); Reference (alias, must be initialized).

---

## 3. Python Memory Management
**Answer**: Reference counting + GC (Garbage Collector).

---

## 4. Memory Leak
**Answer**: Memory allocated but not freed. Use Smart Pointers in C++ to prevent.

---

## 5. What is the GIL in Python?
**Answer**: Global Interpreter Lock (GIL) is a mutex that allows only one thread to execute Python bytecode at a time, protecting memory but limiting multi-core CPU usage.

---

## 6. Shallow Copy vs Deep Copy (Code)
**Answer**: Shallow (copy references); Deep (copy actual objects).

```python
import copy
list1 = [[1, 2], [3, 4]]
list2 = copy.deepcopy(list1) # Deep Copy
```

---

## 7. Pass-by-Value vs Pass-by-Reference
**Answer**:
- **Pass-by-Value**: Function gets a copy.
- **Pass-by-Reference**: Function gets the actual address.

---

## 8. What are Smart Pointers in C++?
**Answer**: Objects that behave like pointers but automatically manage memory (RAII).
- `std::unique_ptr`: Sole ownership.
- `std::shared_ptr`: Reference counted.

---

## 9. Python List vs Tuple
**Answer**:
- **List**: Mutable (Changeable), uses `[]`.
- **Tuple**: Immutable (Unchangeable), uses `()`, slightly faster.

---

## 10. `static` keyword in C/C++
**Answer**: Keeps a variable's value between function calls or limits a variable's scope to its file.

---

## 11. What is an Abstract Class? (Programming perspective)
**Answer**: A class with at least one "pure virtual" function (`= 0` in C++).

```cpp
class Shape {
public:
    virtual void draw() = 0; // Pure Virtual
};
```

---

## 12. List Comprehension in Python
**Answer**: A concise way to create lists.

```python
squares = [x*x for x in range(10)]
```

---

## 13. C++ Standard Template Library (STL)
**Answer**: Collection of templates for data structures (`vector`, `map`, `set`) and algorithms.

---

## 14. What are Python Decorators?
**Answer**: Functions that modify the behavior of another function without changing its source code.

```python
def my_decorator(func):
    def wrapper():
        print("Something before.")
        func()
        print("Something after.")
    return wrapper
```

---

## 15. Inline Functions (C++)
**Answer**: A suggestion to the compiler to replace function calls with the actual function code to save overhead.

---

## 16. Python `*args` and `**kwargs`
**Answer**:
- `*args`: Variable number of positional arguments.
- `**kwargs`: Variable number of keyword (named) arguments.

---

## 17. Volatile Keyword in C
**Answer**: Tells the compiler that a variable's value may change at any time (e.g., from hardware), so do not optimize it.

---

## 18. Python Generators (`yield`)
**Answer**: Functions that return an iterator and save memory by yielding one value at a time.

```python
def count_to_ten():
    for i in range(1, 11):
        yield i
```

---

## 19. Friend Function in C++
**Answer**: A function that is not a member of a class but has access to its private and protected members.

---

## 20. Python `__init__` vs `__new__`
**Answer**:
- `__new__`: First step (Creates the instance).
- `__init__`: Second step (Initializes the instance).

---

## 🎓 Summary Table: Language Features

| Feature | C++ | Python |
| :--- | :--- | :--- |
| **Object** | Multi-paradigm. | Everything is an object. |
| **Type** | Statically Typed. | Dynamically Typed. |
| **Bells/Whistles** | Pointers / STL. | List Comp / Decorators. |
| **Memory** | Manual / Smart Pointers. | Automated GC. |
