#  A note on Big-O notation


It's useful to know how fast an algorithm is and how much space it needs. This allows you to pick the right algorithm for the job. 

Big-O notation gives you a rough indication of the running time of an algorithm and the amount of memory it uses. When someone says, "This algorithm has worst-case running time of **O(n^2)** and uses **O(n)** space," they mean it's kinda slow but doesn't need lots of extra memory.

Figuring out the Big-O of an algorithm is usually done through mathematical analysis. We're skipping the math here, but it's useful to know what the different values mean, so here's a handy table. **n** refers to the number of data items that you're processing. For example, when sorting an array of 100 items, **n = 100**.

Big-O | Name | Description
------| ---- | -----------
**O(1)** | constant | **This is the best.** The algorithm always takes the same amount of time, regardless of how much data there is. Example: looking up an element of an array by its index.
**O(log n)** | logarithmic | **Pretty great.** These kinds of algorithms halve the amount of data with each iteration. If you have 100 items, it takes about 7 steps to find the answer. With 1,000 items, it takes 10 steps. And 1,000,000 items only take 20 steps. This is super fast even for large amounts of data. Example: binary search.
**O(n)** | linear | **Good performance.** If you have 100 items, this does 100 units of work. Doubling the number of items makes the algorithm take exactly twice as long (200 units of work). Example: sequential search.
**O(n log n)** | "linearithmic" | **Decent performance.** This is slightly worse than linear but not too bad. Example: the fastest general-purpose sorting algorithms.
**O(n^2)** | quadratic | **Kinda slow.** If you have 100 items, this does 100^2 = 10,000 units of work. Doubling the number of items makes it four times slower (because 2 squared equals 4). Example: algorithms using nested loops, such as insertion sort.
**O(n^3)** | cubic | **Poor performance.** If you have 100 items, this does 100^3 = 1,000,000 units of work. Doubling the input size makes it eight times slower. Example: matrix multiplication.
**O(2^n)** | exponential | **Very poor performance.** You want to avoid these kinds of algorithms, but sometimes you have no choice. Adding just one bit to the input doubles the running time. Example: traveling salesperson problem.
**O(n!)** | factorial | **Intolerably slow.** It literally takes a million years to do anything.

Below are some examples for each category of performance:

**O(1)**

The most common example with O(1) complexity is accessing an array index. 

```swift
let value = array[5]
``` 

Another example of O(1) is pushing and popping from Stack. 


**O(log n)**

```swift
var j = 1
while j< n {
    // do constant time stuff
    j *= 2
}
```

Instead of simply incementing, 'j' is increaded by 2 times itself in each run. 

Binary Search Algorithm is an example of O(log n) complexity.

**O(n)**

```swift
    for i in stride(from:0, to: n, by: 1) {
        print(array[i])
    }
```

Array Traversal and Linear Search are examples of O(n) complexity.


**O(n log n)**

```swift
for i in stride(from: 0, to: n, by: 1) {
    var j = 1
        while j < n {
            j *= 2
            // do constant time stuff
    }
}

```

OR 

```swift
    for i in stride(for:0, to: n, by: 1) {
        func index(after i: int) -> Int? { // multiplies `i` by 2 until `i` >= `n`
            return i < n ? i * 2 : nil 
        }
        for j in sequence(first: 1, next: index(after:)) {
            // do constant time stuff
        }        
    }
```

Merge Sort and Heap Sort are examples of o(n log n) complexity.
