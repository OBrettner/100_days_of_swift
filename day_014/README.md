# Optionals
In swift we won't have to worry about pointers
but we will have a concept what will be practically the same,
these will be the optional values,
every optional value can be something or can be `nil`
We need to unwrap these types, it is done usually by an if 
statement.
```swift
let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}
```
in this case we want to get a value from a dictionary 
if we do that we always will get an optional.
We can fast unwrap an optional with the `!` but it is not safe
and finally we can declare one with the `?` character
```swift
var name: String? = nil
```
We have one other method to unwrap something.
We can do it with guards.
```swift
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }

    print("\(number) x \(number) is \(number * number)")
}
```
In this case we have to handle a fail safe when we assign the variable.
in this case if `number` is `nil` then in the else statement runs.
We need to exit the scome in the return function, eighter return or throw.

OCF we have a one liner solution for nils as well.
```swift
let input = ""
let number = Int(input) ?? 0
```
in this case the first one before the `??` is the optional,
and if it is nil it will give back the second value after them.

We can chain optional values as well.
```swift
let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")
```

We can get if a function throwed an error or not with a try? syntax
```swift
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}
```

