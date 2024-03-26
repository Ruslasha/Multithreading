import UIKit
// Нарушает принцип OCP, при добавлении нового животного придется изменять класс animal
//class Animal {
//    let name: String
//
//    init(name: String) {
//        self.name = name
//    }
//
//    func makeSound() {
//        if name == "Dog" {
//            print("Woof")
//        } else if name == "Cat" {
//            print("Meow")
//        }
//    }
//}

class Animal {
    let name: String

    init(name: String) {
        self.name = name
    }

    func makeSound() {
        print("Woof")
    }
}

class Dog: Animal {
    override func makeSound() {
        print("Woof")
    }
}

class Cat: Animal {
    override func makeSound() {
        print("Meow")
    }
}

