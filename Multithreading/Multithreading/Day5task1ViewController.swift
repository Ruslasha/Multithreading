//
//  Day5task1ViewController.swift
//  Multithreading
//
//  Created by Руслан Абрамов on 24.03.2024.
//

import UIKit

class Day5task1ViewController: UIViewController {

    override func viewDidLoad() {
                super.viewDidLoad()

            print(1)
            Task {
                print(2)
            }
            print(3)
        }

}
// Task никак не влияет на вывод, выполняется ассинхронно в главном потоке
