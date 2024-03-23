//
//  EightTaskController.swift
//  Multithreading
//
//  Created by Руслан Абрамов on 20.03.2024.
//

import UIKit

class EightTaskController: UIViewController {

    private lazy var name = "I love RM"
    var lock = NSLock()

    override func viewDidLoad() {
        super.viewDidLoad()

        updateName()
    }

    func updateName() {
        DispatchQueue.global().async {
            self.lock.lock()
            print(self.name) // Считываем имя из global
            self.lock.unlock()
            print(Thread.current)
        }
        lock.lock()
        print(self.name) // Считываем имя из main
        lock.unlock()
    }

}
// Data race, к lazy обращаются одновременно из разных потоков
