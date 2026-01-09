# 20 Algorithm Code Samples (Beginner to Intermediate)

This document contains 20 sample code snippets for common algorithms, ranging from beginner to intermediate levels. These are implemented in **Python** for clarity.

## 1. Linear Search
Finds an element in a list by checking each element sequentially.

```python
def linear_search(arr, target):
    for i in range(len(arr)):
        if arr[i] == target:
            return i  # Return index if found
    return -1  # Return -1 if not found

# Example
numbers = [10, 50, 30, 70, 80, 20]
key = 30
result = linear_search(numbers, key)
print(f"Element found at index: {result}")
```

## 2. Binary Search
Efficiently finds an element in a **sorted** list by dividing the search interval in half.

```python
def binary_search(arr, target):
    low = 0
    high = len(arr) - 1

    while low <= high:
        mid = (low + high) // 2
        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            low = mid + 1
        else:
            high = mid - 1
    return -1

# Example
sorted_numbers = [10, 20, 30, 40, 50, 60, 70]
key = 40
result = binary_search(sorted_numbers, key)
print(f"Element found at index: {result}")
```

## 3. Bubble Sort
Sorts a list by repeatedly swapping adjacent elements if they are in the wrong order.

```python
def bubble_sort(arr):
    n = len(arr)
    for i in range(n):
        for j in range(0, n - i - 1):
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]

# Example
nums = [64, 34, 25, 12, 22, 11, 90]
bubble_sort(nums)
print(f"Sorted array: {nums}")
```

## 4. Selection Sort
Sorts an array by repeatedly finding the minimum element from the unsorted part and putting it at the beginning.

```python
def selection_sort(arr):
    n = len(arr)
    for i in range(n):
        min_idx = i
        for j in range(i + 1, n):
            if arr[j] < arr[min_idx]:
                min_idx = j
        arr[i], arr[min_idx] = arr[min_idx], arr[i]

# Example
nums = [64, 25, 12, 22, 11]
selection_sort(nums)
print(f"Sorted array: {nums}")
```

## 5. Insertion Sort
Builds the final sorted array one item at a time.

```python
def insertion_sort(arr):
    for i in range(1, len(arr)):
        key = arr[i]
        j = i - 1
        while j >= 0 and key < arr[j]:
            arr[j + 1] = arr[j]
            j -= 1
        arr[j + 1] = key

# Example
nums = [12, 11, 13, 5, 6]
insertion_sort(nums)
print(f"Sorted array: {nums}")
```

## 6. Merge Sort
A divide and conquer algorithm that divides the input array into two halves, calls itself for the two halves, and then merges the two sorted halves.

```python
def merge_sort(arr):
    if len(arr) > 1:
        mid = len(arr) // 2
        L = arr[:mid]
        R = arr[mid:]

        merge_sort(L)
        merge_sort(R)

        i = j = k = 0
        while i < len(L) and j < len(R):
            if L[i] < R[j]:
                arr[k] = L[i]
                i += 1
            else:
                arr[k] = R[j]
                j += 1
            k += 1

        while i < len(L):
            arr[k] = L[i]
            i += 1
            k += 1

        while j < len(R):
            arr[k] = R[j]
            j += 1
            k += 1

# Example
nums = [12, 11, 13, 5, 6, 7]
merge_sort(nums)
print(f"Sorted array: {nums}")
```

## 7. Quick Sort
Picks an element as pivot and partitions the given array around the picked pivot.

```python
def partition(arr, low, high):
    i = (low - 1)
    pivot = arr[high]

    for j in range(low, high):
        if arr[j] <= pivot:
            i = i + 1
            arr[i], arr[j] = arr[j], arr[i]
    arr[i + 1], arr[high] = arr[high], arr[i + 1]
    return (i + 1)

def quick_sort(arr, low, high):
    if low < high:
        pi = partition(arr, low, high)
        quick_sort(arr, low, pi - 1)
        quick_sort(arr, pi + 1, high)

# Example
nums = [10, 7, 8, 9, 1, 5]
quick_sort(nums, 0, len(nums) - 1)
print(f"Sorted array: {nums}")
```

## 8. Fibonacci Series (Recursive)
Calculates the nth Fibonacci number.

```python
def fibonacci(n):
    if n <= 1:
        return n
    else:
        return fibonacci(n - 1) + fibonacci(n - 2)

# Example
n_terms = 10
print(f"Fibonacci sequence up to {n_terms}:")
for i in range(n_terms):
    print(fibonacci(i), end=" ")
print()
```

## 9. Factorial (Iterative)
Calculates the factorial of a number.

```python
def factorial(n):
    res = 1
    for i in range(2, n + 1):
        res *= i
    return res

# Example
num = 5
print(f"Factorial of {num} is {factorial(num)}")
```

## 10. Check Prime Number
Checks if a number is prime.

```python
def is_prime(n):
    if n <= 1:
        return False
    for i in range(2, int(n**0.5) + 1):
        if n % i == 0:
            return False
    return True

# Example
num = 29
if is_prime(num):
    print(f"{num} is a prime number")
else:
    print(f"{num} is not a prime number")
```

## 11. Palindrome Check (String)
Checks if a string reads the same backwards as forwards.

```python
def is_palindrome(s):
    return s == s[::-1]

# Example
word = "radar"
if is_palindrome(word):
    print(f"{word} is a palindrome")
else:
    print(f"{word} is not a palindrome")
```

## 12. Reverse a String
Reverses a given string.

```python
def reverse_string(s):
    str_list = list(s)
    left, right = 0, len(s) - 1
    while left < right:
        str_list[left], str_list[right] = str_list[right], str_list[left]
        left += 1
        right -= 1
    return "".join(str_list)

# Example
text = "Hello World"
print(f"Reversed: {reverse_string(text)}")
```

## 13. Armstrong Number
Checks if a number is an Armstrong number (sum of its own digits each raised to the power of the number of digits).

```python
def is_armstrong(n):
    order = len(str(n))
    sum_val = 0
    temp = n
    while temp > 0:
        digit = temp % 10
        sum_val += digit ** order
        temp //= 10
    return n == sum_val

# Example
num = 153
if is_armstrong(num):
    print(f"{num} is an Armstrong number")
else:
    print(f"{num} is not an Armstrong number")
```

## 14. GCD of Two Numbers (Euclidean Algorithm)
Finds the Greatest Common Divisor of two numbers.

```python
def gcd(a, b):
    while b:
        a, b = b, a % b
    return a

# Example
num1 = 60
num2 = 48
print(f"GCD of {num1} and {num2} is {gcd(num1, num2)}")
```

## 15. Anagram Check
Checks if two strings are anagrams of each other.

```python
def are_anagrams(s1, s2):
    return sorted(s1) == sorted(s2)

# Example
str1 = "listen"
str2 = "silent"
if are_anagrams(str1, str2):
    print(f"{str1} and {str2} are anagrams")
else:
    print(f"{str1} and {str2} are not anagrams")
```

## 16. Find Duplicates in Array
Finds duplicate elements in a list.

```python
def find_duplicates(arr):
    seen = set()
    duplicates = set()
    for x in arr:
        if x in seen:
            duplicates.add(x)
        else:
            seen.add(x)
    return list(duplicates)

# Example
nums = [1, 2, 3, 2, 4, 5, 5, 6]
print(f"Duplicates: {find_duplicates(nums)}")
```

## 17. Second Largest Element
Finds the second largest number in an array without sorting.

```python
def second_largest(arr):
    if len(arr) < 2:
        return None
    first = second = float('-inf')
    for n in arr:
        if n > first:
            second = first
            first = n
        elif n > second and n != first:
            second = n
    return second

# Example
nums = [12, 35, 1, 10, 34, 1]
print(f"Second largest element is {second_largest(nums)}")
```

## 18. Matrix Addition
Adds two matrices.

```python
def add_matrices(A, B):
    result = [[0 for _ in range(len(A[0]))] for _ in range(len(A))]
    for i in range(len(A)):
        for j in range(len(A[0])):
            result[i][j] = A[i][j] + B[i][j]
    return result

# Example
X = [[1, 2, 3],
     [4, 5, 6],
     [7, 8, 9]]
Y = [[9, 8, 7],
     [6, 5, 4],
     [3, 2, 1]]
res = add_matrices(X, Y)
for r in res:
    print(r)
```

## 19. Pattern Printing (Pyramid)
Prints a pyramid pattern.

```python
def print_pyramid(n):
    for i in range(n):
        print(" " * (n - i - 1) + "*" * (2 * i + 1))

# Example
rows = 5
print_pyramid(rows)
```

## 20. Kadane's Algorithm (Maximum Subarray Sum)
Finds the contiguous subarray within a one-dimensional array of numbers which has the largest sum.

```python
def max_subarray_sum(arr):
    max_so_far = float('-inf')
    max_ending_here = 0
    
    for x in arr:
        max_ending_here = max_ending_here + x
        if max_so_far < max_ending_here:
            max_so_far = max_ending_here
        if max_ending_here < 0:
            max_ending_here = 0
    return max_so_far

# Example
nums = [-2, -3, 4, -1, -2, 1, 5, -3]
print(f"Maximum contiguous sum is {max_subarray_sum(nums)}")
```
