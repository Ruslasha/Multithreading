import UIKit
// Класс Switch - верхнего уровня, переключатель может быть не только у Света, он зависит от LightBulb, это нарушение DIP

protocol Switchable {
    func turnOn()
    func turnOff()
}

class LightBulb: Switchable {

    func turnOn() {
        // включает свет
//    lamp.on()
    }

    func turnOff() {
        // включает свет
//    lamp.off()
    }
}

class Switch {
    let bulb: Switchable

    init(bulb: Switchable) {
        self.bulb = bulb
    }

    func toggle() {
        bulb.turnOn()
    }
}


