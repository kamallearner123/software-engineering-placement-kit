# 💡 OOPs Interview Questions & Answers (Expanded)

Core Object-Oriented Programming (OOPs) interview questions (20+ total) covering design patterns and principles.

---

## 1. What are the 4 Pillars of OOP?
**Answer**: Encapsulation, Abstraction, Inheritance, Polymorphism.

---

## 2. Abstract Class vs Interface
**Answer**: Abstract ("is-a"); Interface ("can-do").

---

## 3. Overloading vs Overriding
**Answer**: Overloading (Compile-time, different params); Overriding (Runtime, same params, inheritance).

```python
# Overloading (Simulated in Python with defaults)
def add(a, b, c=0):
    return a + b + c

# Overriding
class Animal:
    def speak(self): print("Voice")
class Dog(Animal):
    def speak(self): print("Bark") # Overriding
```

---

## 4. Singleton Pattern
**Answer**: Only one instance exists. See System Design module.

---

## 5. SOLID Principles
**Answer**: Single Responsibility, Open/Closed, Liskov Substitution, Interface Segregation, Dependency Inversion.

---

## 6. Composition vs Inheritance
**Answer**: Inheritance ("is-a") can lead to brittle hierarchies; Composition ("has-a") offers more flexibility.

```python
# Composition Example
class Engine: pass
class Car:
    def __init__(self):
        self.engine = Engine() # Car HAS AN engine
```

---

## 7. Constructors and Destructors
**Answer**:
- **Constructor**: Initializes an object (`__init__` in Python).
- **Destructor**: Cleans up resources (`__del__` in Python).

---

## 8. Static Methods vs Class Methods
**Answer**:
- **Static**: No access to instance or class (`@staticmethod`).
- **Class**: Access to class itself (`@classmethod`).

---

## 9. What is the Diamond Problem?
**Answer**: Occurs in multiple inheritance when a class inherits from two classes that have a common base class. Python uses **MRO** (Method Resolution Order) and Java uses **Interfaces** to solve this.

---

## 10. Private, Public, and Protected Access
**Answer**:
- **Public**: Accessible from anywhere.
- **Private**: Accessible only within the class.
- **Protected**: Accessible within its class and subclasses.

---

## 11. Final vs Finally vs Finalize
**Answer**:
- **Final**: Constant (No override/inherit).
- **Finally**: (Try/Catch) Code block that always runs.
- **Finalize**: Clean up method before GC.

---

## 12. Shallow vs Deep Copy
**Answer**:
- **Shallow**: Copy only pointers to original memory.
- **Deep**: Recursively copies all nested objects to new memory.

```python
import copy
arr1 = [[1, 2], [3, 4]]
arr2 = copy.deepcopy(arr1) # Deep Copy
```

---

## 13. Dependency Injection
**Answer**: Supplying an object its dependencies rather than letting it create its own.

---

## 14. This vs Super
**Answer**:
- **This (`self` in Python)**: Refers to the current object instance.
- **Super**: Refers to the parent class.

```python
class Parent:
    def __init__(self): self.val = 10
class Child(Parent):
    def __init__(self):
        super().__init__() # Refers to Parent
```

---

## 15. Association, Aggregation, and Composition
**Answer**:
- **Association**: Relationship between two objects.
- **Aggregation**: (Weak) Part-whole relationship ("HAS-A").
- **Composition**: (Strong) Death of whole means death of parts.

---

## 16. Multiple Inheritance
**Answer**: A class inheriting from more than one parent class.

---

## 17. Duck Typing
**Answer**: (Python specific) "If it looks like a duck and quacks like a duck, it's a duck." (Behavior matters more than type).

---

## 18. Encapsulation (Why?)
**Answer**: To protect internal data from external corruption and simplify complex interactions.

---

## 19. Procedural vs OOP
**Answer**: Procedural (Logical steps/functions); OOP (Real-world entities/objects).

---

## 20. Garbage Collection
**Answer**: Automated process of reclaiming memory occupied by objects that are no longer being used.

---

## 🎓 Summary Table: SOLID

| Principle | Key Rule |
| :--- | :--- |
| **S**RP | One reason to change. |
| **O**CP | Extend, don't modify. |
| **L**SP | Subtypes must fit parent roles. |
| **I**SP | Don't force unused methods. |
| **D**IP | Abstractions over concretions. |
