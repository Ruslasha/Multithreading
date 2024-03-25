//
//  Day5task2ViewController.swift
//  Multithreading
//
//  Created by Руслан Абрамов on 24.03.2024.
//

import UIKit

class Day5task2ViewController: UIViewController {

    override func viewDidLoad() {
                super.viewDidLoad()

            print(1)
            Task { @MainActor  in
                print(2)
            }
            print(3)
        }

}
//@MainActor означает что код внутри задачи будет выполняться явно на главном потоке, без этого атрибута код не обязательно будет выполняться в главном потоке
