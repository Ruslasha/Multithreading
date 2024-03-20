//
//  2_1taskController.swift
//  Multithreading
//
//  Created by Руслан Абрамов on 19.03.2024.
//

import UIKit

class ThridTaskController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Создаем и запускаем поток
        let infinityThread = InfinityLoop()
        infinityThread.start()
        print(infinityThread.isCancelled)
        // Подождем некоторое время, а затем отменяем выполнение потока
        sleep(2)
        // Отменяем тут
        while infinityThread.isExecuting {
            if infinityThread.counter > 4 {
                infinityThread.cancel()
            }
        }
    }

    class InfinityLoop: Thread {
        var counter = 0

        override func main() {
            while counter < 30 && !isCancelled {
                counter += 1
                print(counter)
                InfinityLoop.sleep(forTimeInterval: 1)
//                while counter == 5 {
//                    cancel()
//                }
            }
        }

    }

}
