import Foundation
//https://github.com/raywenderlich/swift-algorithm-club/tree/master/Linear%20Search

// Time: 최선 O(1) 최악 O(n)
func linearSearch_1<T: Equatable>(_ array: [T], _ object: T) -> Int? {
  for (index, obj) in array.enumerated() where obj == object {
    return index
  }
  return nil
}

func linearSearch_2<T: Equatable>(_ array: [T], _ object: T) -> Array<T>.Index? {
  return array.firstIndex { $0 == object }
}
