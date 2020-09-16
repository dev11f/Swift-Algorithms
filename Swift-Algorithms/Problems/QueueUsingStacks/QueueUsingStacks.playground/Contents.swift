import Foundation
// https://hyerios.tistory.com/48?category=826514

struct Stack {
  private var array = [Int]()
  
  var isEmpty: Bool {
    return array.isEmpty
  }
  
  mutating func push(_ element: Int) {
    array.append(element)
  }
  
  mutating func pop() -> Int? {
    return array.popLast()
  }
}


var inBox = Stack()
var outBox = Stack()

func enqueue(_ element: Int) {
  inBox.push(element)
}

func dequeue() -> Int? {
  if outBox.isEmpty {
    while inBox.isEmpty {
      outBox.push(inBox.pop()!)
    }
  }
  return outBox.pop()
}

