# Conditions

## The if statement

The if statement works like in any other language with the exception that
here we don't need braces after the if keyword.

```swift
let age = 23
if age > 18 {
  print("Adult!")
} else if age < 5 {
  print("Baby!")
} else {
  print("Kid!")
}
```

We can check for multiple conditions with
the `&&` operator, this means AND, and we have the
`||` operator that means OR

```swift
let andOperator = true && false // this is false because both side should be true
let orOperator = true || false // this is true because only one should be true
```

And we can use this in if statements as well

```swift
var loggedIn = true
var incognito = true

if loggedIn && incognito {
  print("The user is logged in from an incognito window")
}
```

## Switch statement

it works like in any other language for the most part

```swift
enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

if forecast == .sun {
    print("It should be a nice day.")
} else if forecast == .rain {
    print("Pack an umbrella.")
} else if forecast == .wind {
    print("Wear something warm")
} else if forecast == .rain {
    print("School is cancelled.")
} else {
    print("Our forecast generator is broken!")
}
```

But it can work for String values as well

```swift
let place = "Metropolis"

switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
default:
    print("Who are you?")
}
```

in swift every switch statement has to be exhaustive so
it has to cover all cases.
In swift the cases does not fall through by default but you can make it do so with
the `fallthrough` keyword.

## Ternary Conditions

This is the favourite one liner if statement

```swift
var a = true
var b = a ? "Day" : "Night"
```

this is just the same as in any other language.
