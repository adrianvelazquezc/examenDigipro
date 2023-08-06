import Foundation

//Protocol
protocol CarStatus {
    func turnOn()
    func turnOff()
}

//Inheritance
class Car: CarStatus {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func turnOn() {
        print("\(name) encendido.")
    }
    
    func turnOff() {
        print("\(name) apagado.")
    }
}

let subaru = Car(name: "Subaru")
subaru.turnOn()
subaru.turnOff()
