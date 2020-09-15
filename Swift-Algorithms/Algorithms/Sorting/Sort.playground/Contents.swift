import Foundation


let arr = [4, 1, 5, 3, 6, 2, 7]

//MARK: - Bubble Sort
// 옆에 있는 값과 비교하는 정렬
// Time: O(n^2), Space: O(n)
// https://hyerios.tistory.com/68?category=826514
func bubbleSort_1<T: Comparable>(array: [T]) -> [T] {
  var arr = array
  
  for i in stride(from: arr.count - 1, to: 1, by: -1) {
    for j in 0 ..< i {
      if arr[j] > arr[j+1] {
        arr.swapAt(j, j+1)
      }
    }
  }
  return arr
}

// swap이 일어나지 않으면 뒤에는 정렬되었다는 의미이므로,
// 불필요한 for loop를 또 돌릴 필요 없이 중간에 break를 두어 탈출할 수도 있다.
func bubbleSort_2<T: Comparable>(array: [T]) -> [T] {
  var arr = array
  
  for i in stride(from: arr.count - 1, to: 1, by: -1) {
    var check = true
    for j in 0 ..< i {
      if arr[j] > arr[j+1] {
        arr.swapAt(j, j+1)
        check = false
      }
    }
    if check { break }
  }
  return arr
}


//MARK: - Selection Sort
// 가장 작은 값을 찾아서 앞으로 보내주는 정렬
// Time: O(n^2), Space: O(n)
// https://hyerios.tistory.com/66?category=826514
func selectionSort<T: Comparable>(array: [T]) -> [T] {
  var arr = array
  
  for i in 0 ..< arr.count - 1 {
    var min = i
    for j in i+1 ..< arr.count {
      if arr[j] < arr[min] {
        min = j
      }
    }
    if i != min {
      arr.swapAt(i, min)
    }
  }
  return arr
}


//MARK: - Insertion Sort
// 적절한 인덱스에 삽입해주는 정렬
// Time: 최선 O(n) 최악 O(n^2), Space: O(n)
// https://hyerios.tistory.com/67?category=826514
func insertionSort<T: Comparable>(array: [T]) -> [T] {
  var arr = array
  
  for i in 1 ..< arr.count {
    var j = i
    while j > 0, arr[j] < arr[j-1] {
      arr.swapAt(j, j-1)
      j -= 1
    }
  }
  return arr
}


//MARK: - Merge Sort
// 반으로 나누도 합치면서 정렬
// Time: O(nlogn)
// https://hyerios.tistory.com/69?category=826514
func mergeSort<T: Comparable>(array: [T]) -> [T] {
  guard !array.isEmpty else { return [] }
  let middleIndex = array.count / 2
  let leftArray = mergeSort(array: Array(array[0 ..< middleIndex]))
  let rightArray = mergeSort(array: Array(array[middleIndex ..< array.count]))
  
  return merge(left: leftArray, right: rightArray)
}

func merge<T: Comparable>(left: [T], right: [T]) -> [T] {
  var leftIndex = 0
  var rightIndex = 0
  var ordered = [T]()
  while leftIndex < left.count, rightIndex < right.count {
    if left[leftIndex] < right[rightIndex] {
      ordered.append(left[leftIndex])
      leftIndex + 1
    } else if left[leftIndex] > right[rightIndex] {
      ordered.append(right[rightIndex])
      rightIndex + 1
    } else {
      ordered.append(left[leftIndex])
      ordered.append(right[rightIndex])
      leftIndex += 1
      rightIndex += 1
    }
  }
  while leftIndex < left.count {
    ordered.append(left[leftIndex])
    leftIndex += 1
  }
  while rightIndex < right.count {
    ordered.append(right[rightIndex])
    rightIndex += 1
  }
  return ordered
}


//MARK: - Quick Sort
// Time: 기본 O(nlogn) 최악 O(n^2)
// https://hyerios.tistory.com/70
func quickSort<T: Comparable>(array: [T]) -> [T] {
  guard !array.isEmpty else { return [] }

  let pivot = array[array.count/2]
  let less = array.filter({ $0 < pivot })
  let equal = array.filter({ $0 == pivot })
  let greater = array.filter { $0 > pivot }
  
  return quickSort(array: less) + equal + quickSort(array: greater)
}


//MARK: - Heap Sort

