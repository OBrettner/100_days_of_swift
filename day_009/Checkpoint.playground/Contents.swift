import Cocoa

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let res = luckyNumbers.filter {
    return !$0.isMultiple(of: 2)
}.sorted {
    return $0 < $1
}.map {
    return "\($0) is a lucky number"
}

for item in res {
    print(item)
}
