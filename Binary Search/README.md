# Binary Search 

Goal: Quickly find an element in an array.

Let's say you have an array of numbers and you want to determine whether a specific number is in that array, and if so, at which index. 

In most cases, Swift's `Collection.index(of:)` function is good enough for that:

```swift
let numbers = [11, 59, 3, 2, 53, 17, 31, 7, 19, 67, 47, 13, 37, 61, 29, 43, 5, 41, 23]

numbers.index(of: 43) // returns 15
```

The built-in `Collection.index(of:)` function performs a [linear search](../Linear%20Search/). In code that looks something like this:

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

```
linearSearch(numbers, 43) // returns 15
```

So what's the problem? `linearSearch()` loops through the entire array from the beginning, until it finds the element you're looking for. In the worst case, the value isn't even in the array and all that work is done for nothing. 

On average, the linear search algorithm needs to look at half the values in the array. If your array is large enough, this starts to become very slow!


## Divide and conquer

The classic way to speed this up is to use a *binary search*. The trick is to keep splitting the array in half until the value is found. 

For an array of size `n`, the performance is not **O(n)** as with linear search but only **O(log n)**. To put that in perspective, binary search on an array with 1,000,000 elements only takes abbout 20 steps to find what you're looking for, because `log_2(1,000,000) = 19.9`. And for an array with a billion elements it only takes 30 steps. (Then again, when was the last time you used an array with a billion items?)

Sounds great, but there is a downside to using binary search: the array must be sorted. In practice, this usually isn't a problem. 

Here's how binary search works:

- Split the array in half and determine whether the thing you're looking for, known as the *search keys*, is the left half or in the right half. 
- How do you determine in which half the search key is? This is why you sorted the array first, so you can do simple `<` or `>` comparison. 
- If the search key is in the left half, you repeat the process there: split the left half into two even smaller pieces and look in which piece the search key must lie. (likewise for when it's the right half.)
- This repeats until the search key is found. If the array cannot be split up any further, you must regrettably conclude that the search key is not present in the array. 

Now you know why it's called a "binary" search: in every step it splits the array into two halves. This process of *divide-and-conquer* is what allows it to quickly narrow down where the search key must be. 
