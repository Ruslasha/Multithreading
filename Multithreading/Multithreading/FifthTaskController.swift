//
//  FifthTaskController.swift
//  Multithreading
//
//  Created by Руслан Абрамов on 20.03.2024.
//

import UIKit

class FifthTaskController: UIViewController {

    private var name = "Введите имя"
    private let lockQueue = DispatchQueue(label: "name.lock.queue")
    override func viewDidLoad() {
        super.viewDidLoad()

        updateName()
    }

    func updateName() {
        lockQueue.async {
            self.name = "I love RM" // Перезаписываем имя в другом потоке
            print(Thread.current)
            print(self.name)
        }

        lockQueue.async {
            print(self.name) // Считываем имя из main
        }
    }

}

//1. При async у name гонка данных, т.к глобал async выполняется параллельно main и name выводится и меняется одновременно(происходит гонка данных)
//2. Если поставить sync, то main очередь ждет завершения глобал очереди, а только потом выводится из main

