import Cocoa

func getRandom(numbers: [Int]?) -> Int {
    return numbers?.randomElement() ?? Int.random(in: 1...100)
}

let nums1 = [2, 3, 4]
print(getRandom(numbers: nums1))
print(getRandom(numbers: nil))
