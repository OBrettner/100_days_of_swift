# Protocols and extensions 
In swift we can't inherit from 2 different 
struct or class, but we can use protocols, 
protocols are easy to understand sup logic modules
what we can use to inject functionalities in classes 
and structs, they are an amazing tool for creating 
maintainable code.
Protocols will be interfaces in swift, kindof the same 
way as in Java for example.
```swift
protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}
```
We can say that if something is a Vehicle it should have these 
functions present.
And after we inherit from one we need to declare these functions.
```swift 
struct Car: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}
```
After this we can refer to the `Car` as a `Vehicle`
```swift
func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}
```

## Opaque return types
We can return with a Protocol type but because 
Protocols can't be initialized we will need to
have a bit of work to do so, in swift
we can tell the compiler that we want something with this 
protocol on it with the `some` keyword, this will mean that 
swift will keep the original type of the variable what we returned with
but it will make sure that it has the protocol attached what we need.
```swift
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}
```
swift will know what type we returned with so 
we still need to look out to the types.

## Extensions
In swift we can add functions to a type or class 
after it was created, for example we can expand the functionality
of the basic `String` type with extensions.
```swift
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
```
now we will have our new function attached to the String type
and we can use it.

With extensions we can set the default versions 
of protocol functions.
```swift
protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}
```
