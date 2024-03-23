//
//  SixTaskController.swift
//  Multithreading
//
//  Created by Руслан Абрамов on 20.03.2024.
//

import UIKit

class SixTaskController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("A")

        DispatchQueue.main.async {
            print("B")
        }

        print("C")
    }

}

// В начинает печататься асинхронно в main, пока оно начнет печататься код уже выполнится поэтому А С В
