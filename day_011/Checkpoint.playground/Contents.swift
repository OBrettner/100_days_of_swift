import Cocoa

enum GearDirection {
    case up, down
}

struct Car {
    let model: String
    let seatCount: Int
    private(set) var gear: Int = 1
    
    init(model: String, seatCount: Int) {
        self.model = model
        self.seatCount = seatCount
    }
    
    mutating func changeGears(direction: GearDirection) {
        switch direction {
        case .up:
            if gear < 10
            {
                gear += 1
            }
            
        case .down:
            if gear > 1 {
                gear -= 1
            }
        }
    }
}

var car = Car(model: "Civic", seatCount: 4)
car.changeGears(direction: .up)
car.changeGears(direction: .up)
print(car.gear)
