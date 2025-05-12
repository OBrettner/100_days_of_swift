# Closures 
First of all we need to understand that in swift
every function will have a type atached to it
and can work as a variable.
```swift
func greetUser() {
    print("Hello there")
}

let greetCopy = greetUser
greetCopy() // Will print Hello there
```
therefore we can do a lot of interesting stuff with this 
lets see how we can set a variables value with a closure 
```swift
var sometnig {
    print("something")
}

something()
```
we just created a lambda function with this method.
But we can add return type and function parameters 
as well to the lambda.
```swift
var sayHello = { (name: String) -> String in
    print("Hello \(name)")
}

sayHello("Oliver")
```
also in closures we don't have to write out the parameter
name.

For shorter versions look at the playground file.
