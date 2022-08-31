# Binary Search Tree (BST)

> This topic has been tutorialized [here](https://www.raywenderlich.com/139821/swift-algorithm-club-swift-binary-search-tree-data-structure)


A binary search tree is a special kind of [binary tree](../Binary%20Tree/) (a tree in which each node has at most two children) that performs insertions and deletions such that the tree is always sorted. 

For more information about a tree, [read this first](../Tree/).

## "Always sorted" property

Here is an example of a valid binary search tree:

![A binary search tree](Images/Tree1.png)

Notice how each left child is smaller than its parent node, and each right child is greater than its parent node. This is the key feature of a binary search tree.

For example, `2` is smaller that `7`, so it goes on the left; `5` is greater than `2`, so it goes on the right. 

## Inserting new nodes

When performing an insertion, we first compare the new value to the root node. If the new value is smaller, we take the *left* branch; if greater, we take the *right* branch. We work our way down the tree this way until we find an empty spot where we can insert the new value. 

Suppose we want to insert the new values `9`:

- We start at the root of the tree (the node with value `7`) and compare it to the new value `9`.
- `9 > 7`, so we go down the right branch and repeat the same procedure but this time on node `10`.
- Because `9 < 10`, we go down the left branch.
- We now arrived at a point where there are no more values to compare with. A new node for `9` is inserted at that location. 

Here is the tree after inserting the new value `9`:

![After adding 9](Images/Tree2.png)

There is only one possible place where the new element can be inserted in the tree. Finding this place is usually quick. It takes **O(h)** time, where **h** is the height of the tree.

> **Note:** The *height* of a node is the number of steps it takes to go from that node to its lowest leaf. The height of the entire tree is the distance from the root of the lowest leaf. Many of the operations on a binary treeare expressed in terms of the tree's height.

By following this simple rule - smaller values on the left, larger values on the right -- we keep the tree sorted, so whenever we query it, we can check if a value is in the tree. 
