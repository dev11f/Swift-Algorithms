import Foundation

// https://the-brain-of-sic2.tistory.com/33
// https://medium.com/@stevenpcurtis.sc/fibonacci-series-in-depth-using-swift-4699e940e89f

func processTime(blockFunction: () -> Void) -> Float {
  let startTime = CFAbsoluteTimeGetCurrent()
  blockFunction()
  let processtime = CFAbsoluteTimeGetCurrent() - startTime
  return Float(processtime)
}


//MARK: - 재귀 호출
// Time: O(2^n), Space: O(n)
func fibonacciRecur(n: Int) -> Int {
  guard n > 1 else { return n }
  return fibonacciRecur(n: n-1) + fibonacciRecur(n: n-2)
}


//MARK: - 반복문
// Time: O(n), Space: O(1)
func fibonacciLoop_1(n: Int) -> Int {
  guard n > 1 else { return n }

  var result = 0
  var left = 0
  var right = 1

  for _ in 2...n {
    result = left + right
    left = right
    right = result
  }
  return result
}

func fibonacciLoop_2(n: Int) -> Int {
  guard n > 1 else { return n }
  
  var left = 0
  var right = 1
  (2...n).forEach { (_) in
    (left, right) = (right, left + right)
  }
  return right
}


//MARK: - Dynamic Programming
// Time: O(n), Space: O(n)

// Top-Down
var cache: [Int] = [0]
func fibonacciDynamic(n: Int) -> Int {
  guard n > 1 else { return n }
  
  if cache.count > n { return cache[n] }
  
  let result = fibonacciDynamic(n: n-1) + fibonacciDynamic(n: n-2)
  cache.append(result)
  return result
}

// Bottom-Up
func fibomacciDynamicBottomUp(n: Int) -> Int {
  guard n > 1 else { return n }
  var cache: [Int] = Array(repeating: 0, count: n)
  cache[0] = 0
  cache[1] = 1
  for i in 2..<n {
    cache[i] = cache[i-1] + cache[i-2]
  }
  return cache[n-1] + cache[n-2]
}
