import Foundation
// https://github.com/raywenderlich/swift-algorithm-club/tree/master/Queue

// First-In First-Out (FIFO)
struct SimpleQueue<T> {
  private var array = [T]()
  
  var isEmpty: Bool {
    return array.isEmpty
  }
  
  var count: Int {
    return array.count
  }
  
  var front: T? {
    return array.first
  }
  
  // Methods
  mutating func enqueue(_ element: T) {
    array.append(element)
  }
  
  mutating func dequeue() -> T? {
    guard !isEmpty else { return nil }
    return array.removeFirst()
  }
}

/*
 * Array의 첫 번째에 element를 넣거나 빼는 시간 복잡도는 O(n)이다. 메모리 상에서 Array의 모든 element를 옮겨줘야 하기 때문이다.
 * 따라서 SimpleQueue에서 dequeue의 시간 복잡도는 O(n)이다.
 * 이를 O(1)로 만들어주면 더 효율적일 것이다.
 */

struct OptimizedQueue<T> {
  private var array = [T?]()
  private var head = 0
  
  var isEmpty: Bool {
    return count == 0
  }
  
  var count: Int {
    return array.count - head
  }
  
  var front: T? {
    return isEmpty ? nil : array[head]
  }
  
  // Methods
  mutating func enqueue(_ element: T) {
    array.append(element)
  }
  
  mutating func dequeue() -> T? {
    guard head < array.count, let element = array[head] else { return nil }
    
    array[head] = nil
    head += 1
    
    let percentage = Double(head) / Double(array.count)
    if array.count > 50 && percentage > 0.25 {
      array.removeFirst(head)
      head = 0
    }
    
    return element
  }
}
