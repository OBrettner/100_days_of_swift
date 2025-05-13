# Structs pt 1
structs will work like in any other language
at hte high level.
```swift
struct Album {
    let title: String
    let artist: String
    let year: Int

    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}
```
The constructor will be auto generated and the input parameters will be the 
variables inside the struct.

If there is a function what will modify a value in a struct
we need to tag it with the `mutating` keyword.
```swift
struct Vacations {
    var daysRemaining: Int

    mutating func takeDay() {
        daysremaining -= 1
    }
}
```
From now on we can't create an instance of `Vacations`
with `let` (const) and call takeDay() because that function is mutating.

We can have computed properties in structs.
```swift
struct Vacations {
    var daysLeft: Int
    let originalDayCount: Int
    var daysSpend {
        originalDayCount - daysLeft
    }
}
```

This will be a lambda basically what will run whenever we 
call a getter to that variable.

But we can have custom setters and getters for such thing.
```swift
struct Vacations {
    var daysLeft = 14
    var originalDays = 25
    
    var daysSpent: Int {
        get {
            originalDays - daysLeft
        }
        set {
            daysLeft = originalDays - newValue
        }
    }
}

```
`newValue` will be the value what the setter gets.

And we can listen for changes, both before and after it cahnged.
```swift
struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")
```

and we can create custom initializer 
for a struct with the init keysord.
```swift
struct Player {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}
```
