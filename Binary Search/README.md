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
