# 🧠 Dynamic Programming (DP)

Dynamic Programming is a method for solving complex problems by breaking them down into simpler subproblems. It's about remembering answers to subproblems so you don't have to re-evaluate them.

## 🎓 Core Concepts

### 1. Two Components
- **Optimal Substructure**: The optimal solution to the problem contains optimal solutions to its subproblems.
- **Overlapping Subproblems**: The same subproblems are solved multiple times.

### 2. Two Approaches
- **Memoization (Top-Down)**: Solve recursive problems by storing results in a cache.
- **Tabulation (Bottom-Up)**: Build the solution from the base cases up using a 1D or 2D table.

### 3. Common DP Patterns
- **0/1 Knapsack**.
- **Longest Common Subsequence (LCS)**.
- **Longest Increasing Subsequence (LIS)**.
- **Coin Change**.
- **Unbounded Knapsack**.

---

## 🏆 Top 10 Interview Problems

1.  **Climbing Stairs**.
2.  **Longest Increasing Subsequence**.
3.  **Longest Common Subsequence**.
4.  **Edit Distance**.
5.  **Subset Sum Problem**.
6.  **Unbounded Knapsack**.
7.  **Palindromic Substrings**.
8.  **Maximum Subarray (Kadane's)**.
9.  **Word Break**.
10. **Unique Paths**.

---

## 💻 Sample Code (Fibonacci using Tabulation - Python)

```python
def fib(n):
    if n <= 1:
        return n
    
    # Table to store results
    dp = [0] * (n + 1)
    dp[1] = 1
    
    for i in range(2, n + 1):
        dp[i] = dp[i-1] + dp[i-2]
        
    return dp[n]

print(fib(10)) # Output: 55
```

## 🛠️ Practice Resources
- [LeetCode: DP Tag](https://leetcode.com/tag/dynamic-programming/)
- [InterviewBit: DP Track](https://www.interviewbit.com/courses/programming/topics/dynamic-programming/)
