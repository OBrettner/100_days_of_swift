# Functions pt 1
Functions will work like they does in other languages on the high level
but thew will have some interesting caveats.
To declare a function you will need to use the `func` keyword
Something like this: 
```swift
func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}
```
We can use function parameters as well.
```swift
func printTimesTables(number: Int) {
  for i in 0...12 {
    print("\(i) * \(number) is \(i * number)")
  }
}

printTimesTables(number: 5)
```
We can have return types as well with the 
`-> [return type]` syntax after the function parameters
```swift
func sqare(num: Int) -> Int {
  return num * num
}
```

We can return multiple values from a function 
with touples. 
And wit that lets see an example for a case when we don't need 
the return keyword (only if the function is one line)
```swift
func gerUser() -> (firstName: String, lastName: String) {
  (firstName: "Taylor", lastName: "Swift")
}
```

But we don't have to add a name to the elements
```swift
func getUser() -> (String, String) {
  ("Taylor", "Swift")
}
```

In this case we ill refer it with indexes.
`getUser().0 // "Taylor"`
And we have a handy trick for assigning return values as well
```swift
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let (firstName, lastName) = getUser()
print("Name: \(firstName) \(lastName)")
```

In swift if a function parameter has a different name it is a 
unique function. 
```swift
func hireEmployee(name: String) { }
func hireEmployee(title: String) { }
func hireEmployee(location: String) { }
```
and we can actually have different names for the outside world and inside the 
function, if you name a parameter you can give it 2 names
the first one will be the one what will be referenced on call 
and the second one will be used inside the function,
therefore if the first name is `_` then you don't have to name it outside.
```swift 
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result = isUppercase(string)

func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)
```
