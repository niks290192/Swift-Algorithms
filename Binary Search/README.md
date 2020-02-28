# Binary Search

Goal: Quickly find an element in an array. 

Let's say you have an array of numbers and you want to determine whether a specific number is in that array, and if so, at which index. 

In most cases, Swift's `Collection.index(of:)` function is good enough for that:

```swift
let numbers = [11, 59, 3, 2, 53, 17, 31, 7, 19, 67, 47, 13, 37, 61, 29, 43, 5, 41, 23]

numbers.index(of: 43) // returns 15
```

The built-in `Collection.index(of: )` function performs a [linear search](../Linear%20Search/). In code that looks something like this:

```swift
func linearSearch<T: Equatable>(_ a: [T], _ key: T) -> Int? {
    for i in 0 ..< a.count {
        if a[i] == key {
            return i
        }
    }
    return nil
}
```

And you'd use it like this:

```swift
linearSearch(numbers, 43) // returns 15
```
So what's the problem? `linearSearch()` loops through the entire array from the beginning, until it finds the element you're looking for. In the worst case, the value isn't event in the array and all that work is done for nothing.

On average, the linear search algorithm needs to look at the half the values in the array. if your array is large enough, this starts to become very slow!

## Divide and conquer

The classic way to speed this up is to use a *binary search*. The trick is to keep splitting the array in half until the value is found.

For an array of size `n`, the performance is not **O(n)** as with linear search but only **O(log n)**. To put that in perspective, binary search on an array with 1,000,000 elements only takes about 20 steps to find what you're looking for, because `log_2(1,000,000) = 19.9`. And for any array with a billion elements it only takes 30 steps. (Then again, when was the last time you used an array with a billion items?)

Sounds great, but there is a downside to using binary search: the array must be sorted. 
In practice, this usually isn't a problem.

Here's how binary search works:

- Split the array in half and determine whether the thing you're looking for, known as the *search key*, is in the left half or in the right half.
- How do you determine in which half the search key is? This is why you sorted the array first, so you can do a simple `>` or `<` comparison.
- If the search key is in the left half, you repeat the process there: split the left half into even smaller pieces and look in which piece the search key must lie. (Likewise for when it's the right half.)
- This repeats until the search key is found. If the array cannot be split up any further, you must regrettably conclude that the search key is not present in the array. 

Now you know why it's called a "binary" search: in every step it splits the array into two halfs. This process of *divide-and-conquer* is what allows it to quickly narrow down where the search key must be.

## The code

Here is a recursive implementation of binary search in Swift:

```swift
func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        // If we get here, then the search key is not present in the array.
        return nil
    } else {
        // Calculate where to split the array.
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        // Is the search key in the left half?
        if a[midIndex] > key {
            return binarySearch(a, key: key, range: range.lowerBound ..< midIndex)
        
        // Is the search key in the right half?    
        } else if a[midIndex] < key {
            return binarySearch(a, key: key, range: midIndex + 1 .. < range.upperBound)
            
        // If we get here, then we've found the search key!
        } else {
            return midIndex
        }
    }
}
```

To try this out, copy the code to a playground and do:

```swift
let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]

binarySearch(number, key: 43, range: 0 ..< numbers.count) //gives 13
```

Note that the `numbers` array is sorted. The binary search algorithm does not work otherwise!

I said that binary search works by splitting the array in half, but we don't actually create two new arrays. Instead, we keep track of there splits using a Swift `Range` object. 
Initially, this range covers the entire array, `0 ..< numbers.count`. As we split the array, the range becomes smaller and smaller. 

>**Note:** One thing to be aware of is that  `range.upperBound` always points one beyond the last element, In the example, the range is `0..<19` because there are 19 numbers in the array, and so `range.lowerBound = 0` and `range.upperBound = 19`. But in our array the last element is at index 18,not 19, since we start counting from 0. Just keep this in mind when working the ranges: the `upperBound` is always one move than the index of the last element. 

## Stepping through the example 

It might be useful to look at how the algorithm works in detail. 

The array from the above example consists of 19 numbers and looks like this when sorted:

    [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
    
We're trying to determine if the number `43` is in this array.

To split the array in half, we need to know the index of the object in the middle. That's determined by this line:

```swift
let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
```

Initially, the range has `lowerBound = 0`  and `upperBound = 19`. Filling in these values, we find that `midIndex` is `0 + (19 - 0)/2 = 19/2 = 9`. It's actually `9.5` but because we're using integers, the answer is rounded down.

In the next figure, the `*` shows the middle item. As you can see, the number of items on each side is the same, so we're split right down the middle. 

    [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
    
                                    *
    
