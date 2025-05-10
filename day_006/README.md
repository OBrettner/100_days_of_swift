# Loops

## For Loops

Loops in swift are quite different,
but lets see an example first.

```swift
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]
for os in platforms {
  print(os)
}
```

The `in` keyword can be used to iterate through a list of items
But we can create lists with the `...` operator

```swift
for i in 1...12 {
  print(i)
}
```

Obviously we can nest loops as well

```swift
for i in 1...12 {
    print("The \(i) times table:")

    for j in 1...12 {
        print("  \(j) x \(i) is \(j * i)")
    }

    print()
}
```

In this scenario the 1 and 12 is a part of the items as well.
But we can make so the last number isn't a part of the items like so:

```swift
for i in 1..<12 {
  print("i is \(i)")
}
```

With the `..<` operator we can go through the list except the last element
This can be used and usually used in arrays when we need the index

```swift
for i in 0..<platforms.count {
  print(platforms[i])
}
```

With this method we won't get an overflow

There are times when you don't really need the variable from the loop
in these times you can use `_` operator

```swift
for _ in 1..12 {
  print("Puppy")
}
```

## While Loops

While loops works just as they are in other languages

```swift
// create an integer to store our roll
var roll = 0

// carry on looping until we reach 20
while roll != 20 {
    // roll a new dice and print what it was
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

// if we're here it means the loop ended – we got a 20!
print("Critical hit!")
```

The only difference is you don't have to use `()` after the while
