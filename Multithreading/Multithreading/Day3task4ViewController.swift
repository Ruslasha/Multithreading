//
//  Day3task4ViewController.swift
//  Multithreading
//
//  Created by Руслан Абрамов on 23.03.2024.
//

import UIKit

class Day3task4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        DispatchQueue.global().async {
            self.thread1()
        }

        DispatchQueue.global().async {
            self.thread2()
        }
    }



    let resourceASemaphore = DispatchSemaphore(value: 1)
    let resourceBSemaphore = DispatchSemaphore(value: 1)

    func thread1() {
        resourceBSemaphore.wait()
        print("Поток 1 пытается захватить Ресурс A")
        resourceASemaphore.wait()
        print("Поток 1 захватил Ресурс A и пытается захватить Ресурс B")
        Thread.sleep(forTimeInterval: 1) // Имитация работы для демонстрации livelock
        print("Поток 1 захватил Ресурс B")

        resourceBSemaphore.signal()
        resourceASemaphore.signal()
    }

    func thread2() {
        resourceBSemaphore.wait()
        print("Поток 2 пытается захватить Ресурс B")
        print("Поток 2 захватил Ресурс B и пытается захватить Ресурс A")
        Thread.sleep(forTimeInterval: 1) // Имитация работы для демонстрации livelock
        resourceASemaphore.wait()
        print("Поток 2 захватил Ресурс A")

        resourceASemaphore.signal()
        resourceBSemaphore.signal()
    }
}



