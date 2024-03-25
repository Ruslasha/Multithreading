//
//  Day5task3ViewController.swift
//  Multithreading
//
//  Created by Руслан Абрамов on 24.03.2024.
//

import UIKit

class Day5task3ViewController: UIViewController {

    override func viewDidLoad() {
                super.viewDidLoad()

            print("Task 1 is finished")

        Task.detached(priority: .userInitiated) {
                for i in 0..<50 {
                    print(i)
                }
                print("Task 2 is finished")
            }

            print("Task 3 is finished")
        }

}
// Task.detached выделяет задаче новый поток
