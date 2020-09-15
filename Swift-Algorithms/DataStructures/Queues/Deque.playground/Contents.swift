import Foundation
// https://github.com/raywenderlich/swift-algorithm-club/tree/master/Deque

// Double-ended queue
struct SimpleDeque<T> {
  private var array = [T]()
  
  var isEmpty: Bool {
    return array.isEmpty
  }
  
  var count: Int {
    return array.count
  }
  
  // Methods
  func peekFront() -> T? {
    return array.first
  }
  
  func peekLast() -> T? {
    return array.last
  }
  
  mutating func enqueue(_ element: T) {
    array.append(element)
  }
  
  mutating func enqueueFront(_ element: T) {
    array.insert(element, at: 0)
  }
  
  mutating func dequeue() -> T? {
    guard !isEmpty else { return nil }
    return array.removeFirst()
  }
  
  mutating func dequeueBack() -> T? {
    guard !isEmpty else { return nil }
    return array.removeLast()
  }
}


struct OptimizedDeque<T> {
  private var array: [T?]
  private var head: Int
  private var capacity: Int
  private let originalCapacity: Int
  
  init(_ capacity: Int = 10) {
    self.capacity = max(capacity, 1)
    originalCapacity = self.capacity
    array = [T?](repeating: nil, count: capacity)
    head = capacity
  }
  
  var isEmpty: Bool {
    return count == 0
  }
  
  var count: Int {
    return array.count - head
  }
  
  // Methods
  func peekFront() -> T? {
    guard !isEmpty else { return nil }
    return array[head]
  }
  
  func peekBack() -> T? {
    guard !isEmpty else { return nil }
    return array.last!
  }
  
  mutating func enqueue(_ element: T) {
    array.append(element)
  }
  
  mutating func enqueueFront(_ element: T) {
    if head == 0 {
      capacity *= 2
      let emptySpace = [T?](repeating: nil, count: capacity)
      array.insert(contentsOf: emptySpace, at: 0)
      head = capacity
    }
    
    head -= 1
    array[head] = element
  }
  
  mutating func dequeue() -> T? {
    guard head < array.count, let element = array[head] else { return nil }
    
    array[head] = nil
    head += 1
    
    if capacity >= originalCapacity, head >= capacity * 2 {
      let amountToRemove = capacity + capacity/2
      array.removeFirst(amountToRemove)
      head -= amountToRemove
      capacity /= 2
    }
    return element
  }
  
  mutating func dequeueBack() -> T? {
    guard !isEmpty else { return nil }
    // removeLast : array가 비어있으면 crash난다.
    // popLast: array가 비어있으면 nil을 리턴한다.
    return array.removeLast()
  }
  
}
