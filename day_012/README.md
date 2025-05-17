# Classes 
Classes are similar to structs, but they can be inherited
and they therefore have mor ecomplicated initialiyers.
```swift
class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)
```

In swift you can only reference a class which means if you 
want to copy it it won't work by default as copiing a whole another 
instance, for that to happen we need a helper function.
```swift
class User {
    var username = "Anonymous"

    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}
```
This case will create a new User every time we want to copy it.

And we can create deinitializers for them as well, 
it is uses just for what one is used in C++.
```swift 
class User {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
}
```

