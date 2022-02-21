#  Queue

> This topic has topic tutorialized [here](https://www.raywenderlich.com/148141/swift-algorithm-club-swift-queue-data-structure)

A queue is a list where you can only insert new items at the back and remove items from the front. This ensures that the first item you enqueue is also the first items you dequeue. First come, first serve!

Why would you need this? Well, in many algorithms you want to add objects to temporary list and pull them off this list later. Often the order in whuch you add and remove these objects matters. 

A queue gives you a FIFO or first-in, first-out order. The element you interted first is the first one to come out. It is only fair! (A similar data structure, the [stack](../Stack/), is LIFO or last-in first-out.)

Here is an example to enqueue a number:

```swift
queue.enqueue(10)
```

The queue is now `[ 10 ]`. Add the next number to the queue:

```swift
queue.enqueue(3)
```

The queue is now ` [ 10, 3 ] `. Add one more numbers:

```swift
queue.enqueue(57)
```

The queue is now `[ 10, 3, 57 ]`. Let's dequeue to pull the first element off the front of the queue.

```swift
queue.dequeue()
```

This returns `10` because that was the first number we inserted. The queue is now `[ 3, 57 ]`. EVeryone moved up by one place.

```swift
queue.dequeue()
```

This returns `3`, the next dequeue returns `57`, and so on. If the queue is empty, dequeue returns `nil` or in some implementations it gives an error message. 

> **Note:** A queue is not always the best choice. If the order in which the items are added and removed from the list is not important, you can use a [stack](../Stack/) instead of a queue. Stacks are simpler and faster. 


## The Code

Here is a simplistic implementation of a queue in Swift. It is a wrapper around an array to enqueue, dequeue, and peek at the front-most item:

```swift
public struct Queue<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    public var front: T? {
        return array.first
    }
}
```  
This queue works well, but it is not optimal. 
