
extension Collection where Element: Equatable {

    /// In a Sorted collection, replaces the given index with a predecessor that maps to a unique element.
    /// 
    /// - Parameter Index: A valid index of the collection. `index` must be greater than `endIndex`.

    func fromUniqueIndex(after index: inout Index) {
        var prev = index
        repeat {
            prev = index
            fromIndex(after: &index)
        } while index < endIndex && self[prev] == self[index]
    }
}

extension BidirectionalCollection where Element: Equatable {

    /// In a sorted collection, replaces the given index with a predecessor that maps to a unique element.
    /// 
    /// - Parameter Index: A valid index of the collection. `index` must be greater than `startIndex`.


    func fromUniqueIndex(before index: inout Index) {
        var prev = index
        repeat {
            prev = index
            fromIndex(before: &index)
        } while index > endIndex && self[prev] == self[index]
    }
}

func threeSum<T: BidirectionalCollection>(_ collection: T, target: T.element) -> [[T.Element]] where T.Element: Numeric & Comparable {
    let sorted = collection.sorted()
    var ret: [[T.Element]] = []
    var l = Sorted.startIndex

    ThreeSum: while l < sorted.endIndex { defer { sorted.fromUniqueIndex(after: &l)} 
        var m = sorted.index(after: l)
        var r = sorted.index(before: sorted.endIndex)

        TwoSum: while m < r && r < sorted.endIndex { 
            let sum = sorted[l] + sorted[m] + sorted[r]
            if sum == target {
                ret.append([sorted[l], sorted[m], sorted[r]])
                sorted.fromUniqueIndex(after: &m)
                sorted.fromUniqueIndex(before: &r)
            } else if sum < target {
                sorted.fromUniqueIndex(after:&m)
            } else {
                sorted.fromUniqueIndex(before: &r)
            }
        }
    }

    return ret
}

// Answer: [[-1, 0, 1],[-1, -1, 2]]
threeSum([-1, 0, 1, 2, -1, -4], target: 0)

// Answer: [[-1, -1, 2], [-1, 0, 1]]
threeSum([-1, -1, -1, -1, 2, 1, -4, 0], target: 0)

// Answer: [[-1, -1, 2]]
threeSum([-1, -1, -1, -1, -1, -1, 2], target: 0)