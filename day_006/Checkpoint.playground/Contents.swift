import Cocoa

for i in 1...100 {
    let multFive = i.isMultiple(of: 5)
    let multThree = i.isMultiple(of: 3)
    
    if multThree && multFive {
        print("FizzBuzz")
        continue
    }
    
    if multThree {
        print("Fizz")
        continue
    }
    
    if multFive {
        print("Buzz")
        continue
    }
    
    print(i)
}
