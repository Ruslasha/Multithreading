import UIKit
// Нарушение LSR, необходимо собирать сущности из необходимой функциональности
protocol Birds {}

protocol FlyingBird: Birds {
    func fly()
}

protocol UnflyingBird: Birds {
    func swim()
}

class Bird: Birds, FlyingBird {
    func fly() {
        // Реализация полета
    }
}

class Penguin: Birds, UnflyingBird {
    func swim() {

    }
}

let myBird: UnflyingBird = Penguin()
myBird.swim()
