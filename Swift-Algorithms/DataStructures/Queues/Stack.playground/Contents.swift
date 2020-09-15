import Foundation
// https://github.com/raywenderlich/swift-algorithm-club/tree/master/Stack

// Last-In First-Out (LIFO)
struct Stack<T> {
  private var array = [T]()
  
  var isEmpty: Bool {
    return array.isEmpty
  }
  
  var count: Int {
    return array.count
  }
  
  var top: T? {
    return array.last
  }
  
  // Methods
  mutating func push(_ element: T) {
    array.append(element)
  }
  
  mutating func pop() -> T? {
    return array.popLast()
  }
  
}

// For in 구문을 위해 필요
extension Stack: Sequence {
  func makeIterator() -> AnyIterator<T> {
    var curr = self
    return AnyIterator {
      return curr.pop()
    }
  }
}
