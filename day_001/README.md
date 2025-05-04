# Variables, Constants and simple data types

## Variables

We have 2 types of variables `var` and `let`

### Var

```swift
var name = "Rebeca"
name = "George"
name = "Luciel"
```

As you can see var used to create a new variable,
we can then re assign this variable as we like,
until we don't want to change the type of it of course.

## Let

```swift
let name = "Rebeca"
// This will cause a syntax error
name = "George"
```

`let` is the const variable in swift, it does the same as `var` but it can not be re assigned

> Note: ALWAYS use let whenever if is possible it makes the compiler happy :>

## Types

### Multi line string

It is easy to create a one line string variable, you can see examples for that in the `var` and `let` sections,
But what if I want to have a multi lined string? well in that case I have to use `"""` to do that like this:

```swift
var movie = """
  This is
  a multi lined
  string declaration
"""
```

### Integers

Integers works just like in any other language bu swift has some
syntactical sugar in the mix
for example lets look at this integer:

```swift
let bigInteger = 1000000
```

it is really hard to tell for the first glance,
but in swift we can use `_` to separate the integers to be more readable
something like this:

```swift
let bigInteger = 1_000_000
```

It is important to mention that we are not bound to just one of those characters

```swift
let bigInteger = 1___000___000
```

Usually it does not have any benefit to do this but there are certain cases where it can be useful.

Other than that we have our handy operators what works most like in other languages

```swift
let score = 10

let addedScore = score + 5
let negatedScore = score - 2
let multipliedScore = score * score
let dividedScore = score / 2
```

And of course we have the easier syntax as well with the `=` operator

```swift
var score = 10
score =+ 10
score -= 5
score *= 2
score /= 5
```

This won't work with constants because it will modify the original variable

We have some pretty usable utility functions connected to them as well

```swift
let number = 120
print(number.isMultiple(of: 3))
```

For example this will get if 120 can be divided by 3
And the funny part is in swift you can call these functions on raw values as well

```swift
print(120.isMultiple(of: 3))
```

This essentially will mean the same as it meant before

### Doubles

I won't write any specifics about these types because they are working just like integers
the only mentionable thing is that swift is a type safe language witch means
it won't convert Doubles to Integers automatically, if you want to make that happen you have to cast one of them
