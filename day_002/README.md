# Simple Data Types pt 2

## Booleans

Booleans are like in any other language can be `true` or `false`
a lot of function what we covered used them under the hood for example this one:

```swift
var fileName = "paris.jpeg"
var booleanValue = filename.hasSuffix(".jpeg")
```

In this case the `booleanValue` is a boolean what was returned by `hasSufix`

But we can assign them simply like this:

```swift
let goodDog = true
let gameOver = false
```

And of course here we can flip the value with `!` operator like in other languages as well

```swift
let isMutiple = 120.isMultiple(of: 3)
print(!isMultiple) // !true -> false
```

We can change the state of a Boolean one other way tho and this is `toggle()`

```swift
var gameOver = false
gameOver.toggle()
print(gameOver) // true
```

## Joining Strings Together

We can do this 2 ways in swift, we can use the `+` operator
and we can use string interpolation.
Lets see the fist one in action:

```swift
let hello = "Hello, "
let world = "World!"
print(hello + world) // "Hello, World!\n"
```

This is the least used one we use this usually when we are constructing
a string what we don't have every item of, for example in a list.

For the most part we are using interpolation to do simple things

```swift
print("5 X 5 is \(5*5)") // "5 X 5 is 25\n"

// we can use variables as well
let dobName = "Stephen"
let dogAge = 2
print("\(dobName) will be \(dogAge) next sumer")
```
