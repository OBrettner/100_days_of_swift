import Cocoa

enum NumberError: Error {
    case tooLow, tooHigh, noRoot
}

func sqrt(_ num: Int) throws -> Int {
    if num < 1 { throw NumberError.tooLow }
    if num > 10_000 { throw NumberError.tooHigh }
    
    var root: Int = 0
    for rootCandidate in 1...100 {
        if rootCandidate * rootCandidate == num {
            root = rootCandidate
        }
    }
    
    if root == 0 { throw NumberError.noRoot }
    
    return root
}


do {
    let root = try sqrt(10000)
    print ("The root is: \(root)")
    
} catch NumberError.tooLow {
    print("Number was too low")
} catch NumberError.tooHigh {
    print("Number was too high")
} catch NumberError.noRoot {
    print("There was no root found")
} catch {
    print("Unknown error occured")
}
