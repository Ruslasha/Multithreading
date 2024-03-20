//
//  FourthTaskController.swift
//  Multithreading
//
//  Created by Руслан Абрамов on 19.03.2024.
//

import UIKit

class FourthTaskController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Создаем и запускаем поток
        let thread1 = ThreadprintDemon()
        let thread2 = ThreadprintAngel()

        // Меняем приоритеты
        //1
        //thread1.qualityOfService = .userInteractive
        //thread2.qualityOfService = .userInitiated
        //2
        //        thread1.qualityOfService = .userInitiated
        //        thread2.qualityOfService = .userInteractive
        //        3
                thread1.qualityOfService = .default
                thread2.qualityOfService = .default
        
                thread1.start()
                thread2.start()

    }

    class ThreadprintDemon: Thread {
        override func main() {
            for _ in (0..<100) {
                print("1")
            }
        }
    }
    class ThreadprintAngel: Thread {
        override func main() {
            for _ in (0..<100) {
                print("2")
            }
        }
    }

}
