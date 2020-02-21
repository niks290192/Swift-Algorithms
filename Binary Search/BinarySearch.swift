/*
 Binary Search
 
 Recursively splits the array in half until the value is found
 
 If there is more than one occurrence of the search key in the array,
 then is no guarantee which one it finds.
 
 Note: The array must be sorted!
 */

import Foundation

// The recursive version of binary search.

public func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        return nil
    } else {
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        if a[midIndex] > key {
            return binarySearch(a, key: key, range: range.lowerBound ..< midIndex)
        } else if a[midIndex] < key {
            return binarySearch(a, key: key, range: midIndex + 1 ..< range.upperBound)
        } else {
            return midIndex
        }
    }
}

