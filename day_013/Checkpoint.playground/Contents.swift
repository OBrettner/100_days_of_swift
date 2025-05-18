import Cocoa

protocol Building {
    var rooms: Int { get }
    var cost: Int { get set }
    var estateAgent: String { get set }
    
    func getInfo()
}


struct House: Building {
    func getInfo() {
        print("House")
    }

    let rooms: Int
    var cost: Int
    var estateAgent: String
}

struct Office: Building {
    func getInfo() {
        print("Office")
    }

    let rooms: Int
    var cost: Int
    var estateAgent: String
}
