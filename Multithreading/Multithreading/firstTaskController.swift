//
//  ViewController.swift
//  Multithreading
//
//  Created by Руслан Абрамов on 18.03.2024.
//

import UIKit

class firstTaskController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        Thread.detachNewThread {
            for _ in (0..<10) {
                let currentThread = Thread.current
                print("1, Current thread: \(currentThread)")
            }
        } // Вывод изменился, т.к задачи вывода стали выполняться параллельно

         for _ in (0..<10) {
            let currentThread = Thread.current
            print("2, Current thread: \(currentThread)")
         }
    }


}

