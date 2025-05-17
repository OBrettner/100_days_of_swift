import Cocoa

class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    init() {
        super.init(legs: 4)
    }
    
    func speak() {
        print("GENERIC WOF")
    }
}

class Corgi: Dog {
    override func speak() {
        print("CORGI ASS")
    }
}

class Poodle: Dog {
    override func speak() {
        print("WÜF WÜF")
    }
}

class Cat: Animal {
    var isTame: Bool
    
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
    
    func speak() {
        print("MEW")
    }
}

class Persian: Cat {
    override func speak() {
        print("Meöwww")
    }
}

class Lion: Cat {
    override func speak() {
        print("ZOO")
    }
}
