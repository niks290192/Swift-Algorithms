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

Enqueuing is an **O(1)** operation because adding to the end of an array always takes the same amount of time regardless of the size of the array.

You might be wondering why appending items to an array is **O(1)** or an constant-time operation. That is because an array is Swift always has some empty space at the end. If we do the following:

```swift
var queue = Queue<String>()
queue.enqueue("Ada")
queue.enqueue("Steve")
queue.enqueue("Tim")
```

then the array might actually look like this:

    ["Ada", "Steve", "Tim", xxx, xxx, xxx]
    
where `xxx` is memory that is reserved but not filled in yet. Adding a new element to the array overwrites the next unused spot:

    ["Ada", "Steve", "Tim", "Grace", xxx, xxx ]
    
This results by copying memory from one place to another which is a constant-time operation. 

There are only a limited number of unused spots at the end of the array. When the last `xxx` get used, and you want to add another item, the array needs to resize to make more room. 


Resizing includes allocating new memory and copying all the existing data over to the new array. This is an **O(n)** process which is relatively slow. Since it happens occiasionally, the time for appending a new element to the end of the array is still **O(1)** on average or **O(1)** "amortized".

The story of dequeueing is different. To dequeue, we remove the element from the *beginning* of the array. This is always an **O(n)** operation because it requires all remaining array elements to be shifted in memory. 

In our example, dequeuing the first element `"Ada"` copies `"Steve"` in the place of `"Ada"`, `"Tim"` in the place of `"Steve"`, and `"Grace"` in the place of `"Tim"`:

    before   [ "Ada", "Steve", "Tim", "Grace", xxx, xxx ]
                       /       /      /
                      /       /      /
                     /       /      /
                    /       /      /
     after   [ "Steve", "Tim", "Grace", xxx, xxx, xxx ]
     
Moving all these elements in the memory is always an *O(n)* operation. So with our simple implementation of a queue, enqueue is efficient, but dequeueing leaves something to be desired...

## A more efficient queue

To make dequeuing efficient, we can also reserve some extra free space but tjis time at the front of the array. We must write this code ourselves because the built-in Swift array does not support it. 

The main idea is whenever we dequeue an item, we do not shift the contents of the array at the front (slow) but mark the item's position in the array as empty (fast). After dequeuing `"Ada"`, the array is: 

        [ xxx, "Steve", "Tim", "Grace", xxx, xxx ]
        
    After dequeuing `"Steve"`, the array is:
        [ xxx, xxx, "Tim", "Grace", xxx, xxx ]
        
    Because these empty spots at the front never get reused, you can preiodically trim the array by moving the remaining elements to the front:
    
        [ "Tim", "Grace", xxx, xxx, xxx, xxx ]
        
    This trimming procedure involves shifting memory which is an **O(n)** operation. Because this only happens once in a while, dequeuing is **O(1)** on average.
    
    Here is how you can implement this version of `Queue`: 
    
    
```swift
    public struct Queue<T> {
        fileprivate var array = [T?]()
        fileprivate var head = 0
        
        public var isEmpty: Bool {
            return count == 0
        }
        
        public var count: Int {
            return array.count - head
        }
        
        public mutating func enqueue(_ element: T) {
            array.append(element)
        }
        
        public mutating func dequeue() -> T? {
            guard head < array.count, let element = array[head] else { return nil }
            
            array[head] = nil
            head += 1
            
            let percentage = Double(head)/Double(array.count)
            if array.count > 50 && percentage > 0.25 {
                array.removeFirst(head)
                head = 0
            }
            
            return element
        }
        
        public var front: T? {
            if isEmpty {
                return nil
            } else {
                return array[head]
            }
        }
    }
```
