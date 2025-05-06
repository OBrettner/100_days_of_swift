# Complex Data Types pt 1

We will call data types complex when they store more than one data at once.
The hardest thing about them will be when to use which.

## Arrays

This is the most simple type it basically stores multiple instances of
one type of data, it will work pretty much like a vector in c++
In swift this is how we can create an array:

```swift
var folks = ["Charly", "James", "Aron", "Diana"]
var nums = [2, 3, 4, 5, 21]
```

Like any other language the indexing starts at 0.
We can get data back with the [] operators like this: `folks[1] // "James"`
If the index is more than the length of the array the app will crash.
This is how you can add element to an array after creation

```swift
var folks = ["Charly", "Josh"]
folks.append("Diana")
```

But what if we want to create a specialized empty array?

```swift
var score = Array<Int>()
score.append(21)
score.append(2)
```

In this case I created an empty array and started to filling up
note that the Array had a type when we created the first time.
But we have another syntax for them which is this:

```swift
var score = [Int]()
score.append(21)
score.append(2)
```

It is exactly the same it is just shorter, when we created it with data inside it
swift could figure out what kind of array it will be.

But lets see some useful functionality about arrays:

```swift
var albums = ["Folklore", "Red", Fearless]

// This is how we can get a length of an array
print(albums.count)

// This will remove the first element of the array
albums.remove(at: 0)

// This is how we can remove all of the items from an array
albums.removeAll()

let movies = ["Batman", "Frozen", "Dune"]

// This is how we can get if something is in a list or not, this is case sensitive
print(movies.contains("Frozen"))

// This returns a new array which will be the sorted version of the original
print(movies.sorted())

// This will give back a new array with a reverse order
print(movies.reversed())
```

## Dictionaries

This is the swift version of an UnorderedMap from C++,
so a dictionary is basically an array of keys and values connected to them

```swift
let employee = [
    "name":     "Taylor Swift",
    "job":      "Singer",
    "location": "Nashville"
]
```

if we want to get a value from it we can use `[]` to do so,
but like in other languages we need to give the key between the two brace
something like this: `employee["job"] // Singer`
It has a trick tho, it will return optionals, which means it either have value or not,
this is like in C++ with `std::optional` but this is a bit more integrated into the language
we will learn this later in the course.
For now we have a handy syntax what we can use to negate this:

```swift
print(employee["name", default: "Unknown"]) // "Taylor Swift"
print(employee["password", default: "Unknown"]) // "Unknown"
```

This type of usage will return a String at the end in this case instead of
an optional value.

And we can declare an empty one as well

```swift
var heights = [String: Int]()
heights["Terry"] = 176
heights["Jenny"] = 157

// This will override the value
heights["Terry"] = 165
```

## Sets

They are pretty much the same as arrays but
it can't hold duplicate values, and it is not ordered,
or better say, it does not remember it's order.
Lets see how we Init one:

```swift
let presidents = Set(["Baiden", "Obama", "Washington"])
```

The duplicated values are filtered in Init time
But what happens when we want to create an empty one and fill it up later?

```swift
var actors = Set<String>()
actors.insert("Danzel Washington")
actors.insert("Tom Cruise")
```

It is a good idea to use Sets when it is possible,
because they are much faster than regular arrays.

## Enums

Enums are working like in every other language for the most part
at least what was covered in this episode high level
they are int based tags basically with names.
This is how they can be initialized:

```swift
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}
```

But unlike other languages we get the value like this:

```swift
// We use the . to get the enum item
let monday = Weekday.monday

// And we don't even need the enum type if swift already knows it
let tuesday : Weekday = .tuesday
```
