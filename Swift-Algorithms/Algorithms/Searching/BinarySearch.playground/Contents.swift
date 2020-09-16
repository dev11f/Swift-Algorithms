import Foundation
//https://github.com/raywenderlich/swift-algorithm-club/tree/master/Binary%20Search

//MARK: - 재귀
func binarySearchRecur<T: Comparable>(_ array: [T], key: T, range: Range<Int>) -> Int? {
  guard range.lowerBound < range.upperBound else { return nil }
  
  let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
  if array[midIndex] > key {
    return binarySearchRecur(array, key: key, range: range.lowerBound ..< midIndex)
  } else if array[midIndex] < key {
    return binarySearchRecur(array, key: key, range: midIndex ..< range.upperBound)
  } else {
    return midIndex
  }
}

//MARK: - 반복
func binarySearchLoop<T: Comparable>(_ array: [T], key: T) -> Int? {
  var lowerBound = 0
  var upperBound = array.count
  
  while lowerBound < upperBound {
    let midIndex = lowerBound + (upperBound - lowerBound) / 2
    if array[midIndex] > key {
      upperBound = midIndex
    } else if array[midIndex] < key {
      lowerBound = midIndex + 1
    } else {
      return midIndex
    }
  }
  return nil
}
