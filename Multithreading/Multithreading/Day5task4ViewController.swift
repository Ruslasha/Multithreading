//
//  Day5task4ViewController.swift
//  Multithreading
//
//  Created by Руслан Абрамов on 24.03.2024.
//

import UIKit

class Day5task4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            let result = await randomD6()
            print(result)
        }
    }

    func randomD6() async -> Int {
        Int.random(in: 1...6)
    }

}
