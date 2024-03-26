import UIKit

protocol Worker {
    func work()
}

protocol EatingWorker: Worker {
    func eat()
}

protocol NonEatingWorker: Worker {

}

class Robot: NonEatingWorker {
    func work() {
        // Робот работает
    }
}

