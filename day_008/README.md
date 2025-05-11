# Functions pt 2
We can provide default values to function parameters like this
```swift
func someFunc(number: Int = 12) {
    print(number)
}

someFunc()
```
If we do this we don't need to provide it 
when we call the function.

Connected to this we can see an optimization to the 
`removeAll()` function, we can provide `keepingCapacity`
as a function parameter if we know that we want to 
repopulate the array, this way we won't deallocate memory.

```swift
var characters = ["Lana", "Pam", "Ray", "Sterling"]
characters.removeAll(keepCapacity: true)
characters = ["A", "B", "C", "D"]
```
This code will be faster because we did not reallocated any memory.

## Error Handling 
We have the `Error` type what we can use to 
inherit from to tell swift that what we are doing
is an error type.
```swift
enum PasswordError: Error {
    case short, obvious
}
```
And then we can use this to throw `PasswordError`s from a function
```swift
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.short }
    if password == "12345" { throw PasswordError.obvious }
    
    return "Passowrd is acceptable"
}
```
Lets investigate this function a bit, 
the `throws` keyword means that this functions can throw errors
if that isn't here the function won't be able to do that.
With the `throw` keyword we will send an error, this will cause the function
to exit and return with the error instead of the real return value / type.

But lets see how we can call this function safely.
```swift
let obviousPass = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}
```
We can see that we are using a `do` statement
this was created for handling errors, anything what can throw
should be called with `try` before it, and with `catch` we can catch errors
one type at a time if we put the type after it, or catch just any errors 
if we don't.

