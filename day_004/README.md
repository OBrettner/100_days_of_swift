# Complex Data Types pt 2

## Type annotation

Before this point we used variable declarations like this

```swift
var surName = "Nick"
let number = 72
```

In this case swift will figure out the type by the value
but we could create empty variables as well with
just passing the type to the variable.

```swift
var albums: [String] = ["Red", "Fearles"]
var user: [String: String] = ["id": "@someone"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])
```

But like I said we could use it to create empty stuff

```swift
var array: [String] = []
```

It could be a dictionary and a, array as well but we declared the type
so swift will know exactly which one is it.

One other interesting thing what is good to know is that
we can actually create constants (`let`) with no value at first

```swift
let username: String
username = "@Someone"
print(username)
```

After the first init it will behave as a constant
