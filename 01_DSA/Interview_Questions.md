# 💡 DSA Interview Questions & Answers (Expanded)

This guide contains 20+ essential DSA questions for competitive interviews, complete with steps and code snippets.

---

## 1. How do you find the loop in a Singly Linked List?
**Answer**: Use Floyd’s Cycle-Finding Algorithm (Two Pointers).
**Steps**:
1. Initialize `slow` and `fast` pointers at head.
2. Move `slow` by 1 and `fast` by 2.
3. If they meet, there's a loop. If `fast` reaches `null`, there is no loop.

```python
def hasCycle(head):
    slow, fast = head, head
    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next
        if slow == fast: return True
    return False
```

---

## 2. Invert a Binary Tree
**Answer**: Swap left and right children recursively.
**Steps**:
1. Base case: If node is `None`, return.
2. Swap `node.left` and `node.right`.
3. Recurse on both children.

```python
def invertTree(root):
    if not root: return None
    root.left, root.right = invertTree(root.right), invertTree(root.left)
    return root
```

---

## 3. Find the Kth Largest Element in an Array
**Answer**: Use a Min-Heap of size K.
**Steps**:
1. Build a Min-Heap with the first K elements.
2. For the rest, if `element > heap_root`, replace root and heapify.
3. Root of the heap is the Kth largest.

```python
import heapq
def findKthLargest(nums, k):
    return heapq.nlargest(k, nums)[-1]
```

---

## 4. Shortest Path in an Unweighted Graph
**Answer**: Use Breadth-First Search (BFS).
**Steps**: Use a queue to explore level-by-level; the first time you reach the target, it's the shortest path.

---

## 5. 0/1 Knapsack Problem (DP)
**Answer**: Use a 2D table `dp[i][w]` to store max value for first `i` items and capacity `w`.
**Ref**: See Dynamic Programming module for details.

---

## 6. Two Sum Problem
**Answer**: Use a Hash Map to store `(target - num)`.
**Steps**: Iterate through the array; if current `num` is in the map, you found the pair.

```python
def twoSum(nums, target):
    prevMap = {} # val : index
    for i, n in enumerate(nums):
        diff = target - n
        if diff in prevMap: return [prevMap[diff], i]
        prevMap[n] = i
```

---

## 7. Check for Balanced Parentheses
**Answer**: Use a Stack.
**Steps**: Push opening brackets; for closing brackets, pop and check if they match.

```python
def isValid(s):
    stack = []
    closeToOpen = {")": "(", "]": "[", "}": "{"}
    for c in s:
        if c in closeToOpen:
            if stack and stack[-1] == closeToOpen[c]: stack.pop()
            else: return False
        else: stack.append(c)
    return True if not stack else False
```

---

## 8. Find the Middle of a Linked List
**Answer**: Use Slow and Fast pointers. When `fast` reaches the end, `slow` is at the middle.

```python
def middleNode(head):
    slow, fast = head, head
    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next
    return slow
```

---

## 9. Rotate an Array by K positions (Right)
**Answer**: Reverse the whole array, then reverse the first K, then the rest.

```python
def rotate(nums, k):
    k %= len(nums)
    def rev(l, r):
        while l < r:
            nums[l], nums[r] = nums[r], nums[l]
            l, r = l + 1, r - 1
    rev(0, len(nums) - 1)
    rev(0, k - 1)
    rev(k, len(nums) - 1)
```

---

## 10. Longest Substring Without Repeating Characters
**Answer**: Sliding Window with a Set.

```python
def lengthOfLongestSubstring(s):
    charSet = set()
    l, res = 0, 0
    for r in range(len(s)):
        while s[r] in charSet:
            charSet.remove(s[l])
            l += 1
        charSet.add(s[r])
        res = max(res, r - l + 1)
    return res
```

---

## 11. Merge Two Sorted Lists
**Answer**: Use a dummy node and iterate through both lists.

---

## 12. Lowest Common Ancestor (LCA)
**Answer**: Find node where `p` and `q` are on different sides (left/right).

---

## 13. Number of Islands (DFS)
**Answer**: Iterate through the grid; when you find '1', increment island count and DFS to mark all adjacent '1's as '0'.

---

## 14. Validate Binary Search Tree (BST)
**Answer**: Recursively check if `left < node < right` using a min/max range.

```python
def isValidBST(root):
    def validate(node, low, high):
        if not node: return True
        if not (low < node.val < high): return False
        return validate(node.left, low, node.val) and validate(node.right, node.val, high)
    return validate(root, float("-inf"), float("inf"))
```

---

## 15. Binary Search (Iterative)
**Answer**: Use two pointers `L` and `R`. Move `L/R` based on middle comparison.

```python
def search(nums, target):
    l, r = 0, len(nums) - 1
    while l <= r:
        m = (l + r) // 2
        if nums[m] == target: return m
        elif nums[m] < target: l = m + 1
        else: r = m - 1
    return -1
```

---

## 16. Implement Stack using Queues
**Answer**: Use one queue. When pushing, rotate the queue so the new element is at the front.

---

## 17. Find All Anagrams in a String
**Answer**: Sliding Window with two Frequency Maps (Hash Tables).

---

## 18. Longest Common Subsequence (LCS)
**Answer**: DP 2D table where `dp[i][j]` is LCS of `s1[i:]` and `s2[j:]`.

---

## 19. Coin Change Problem (DP)
**Answer**: Find min coins to reach amount `a` using `dp[a] = 1 + min(dp[a - coin])`.

```python
def coinChange(coins, amount):
    dp = [amount + 1] * (amount + 1)
    dp[0] = 0
    for a in range(1, amount + 1):
        for c in coins:
            if a - c >= 0:
                dp[a] = min(dp[a], 1 + dp[a - c])
    return dp[amount] if dp[amount] != amount + 1 else -1
```

---

## 20. Trapping Rain Water (Two Pointers)
**Answer**: Use two pointers from ends and keep track of `maxLeft` and `maxRight`.

```python
def trap(height):
    l, r = 0, len(height) - 1
    leftMax, rightMax = height[l], height[r]
    res = 0
    while l < r:
        if leftMax < rightMax:
            l += 1
            leftMax = max(leftMax, height[l])
            res += leftMax - height[l]
        else:
            r -= 1
            rightMax = max(rightMax, height[r])
            res += rightMax - height[r]
    return res
```

---

## 🎓 Summary Table for Revision

| Topic | Key Technique | Complexity |
| :--- | :--- | :--- |
| **Search** | Binary Search | O(log N) |
| **Sorting** | Quick/Merge Sort | O(N log N) |
| **Strings** | Sliding Window / Hashing | O(N) |
| **Linked List** | Two Pointers (Slow/Fast) | O(N) |
| **Trees** | Recursion / DFS / BFS | O(N) |
| **DP** | Table / Memoization | O(N*M) |
