//
//  Day4task2ViewController.swift
//  Multithreading
//
//  Created by Руслан Абрамов on 23.03.2024.
//

import UIKit
protocol RMOperationProtocol {
    // Приоритеты
    var priority: DispatchQoS.QoSClass { get }
    // Выполняемый блок
    var completionBlock: (() -> Void)? { get }
    // Завершена ли операция
    var isFinished: Bool { get }
    var isExecuting: Bool { get }
    // Метод для запуска операции
    func start()
}

class RMOperation: RMOperationProtocol {

    /// В методе start. реализуйте все через глобальную паралельную очередь с приоритетами.
    var priority: DispatchQoS.QoSClass = .unspecified
    var completionBlock: (() -> Void)?
    var isFinished = false
    var isExecuting = false

    func start() {
        DispatchQueue.global(qos: priority).async {
            self.completionBlock?()
        }
    }
}

class Day4task2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        let operationFirst = RMOperation()
        let operationSecond = RMOperation()


        operationFirst.priority = .userInitiated
        operationFirst.completionBlock = {

            for _ in 0..<50 {
                print(2)
            }
            print(Thread.current)
            print("Операция полностью завершена!")
        }

        operationFirst.start()



        operationSecond.priority = .background
        operationSecond.completionBlock = {

            for _ in 0..<50 {
                print(1)
            }
            print(Thread.current)
            print("Операция полностью завершена!")
        }
        operationSecond.start()
    }


}
