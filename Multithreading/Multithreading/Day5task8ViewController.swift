//
//  Day5task8ViewController.swift
//  Multithreading
//
//  Created by Руслан Абрамов on 24.03.2024.
//

import UIKit

class Day5task8ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            await printMessage()
        }
    }

    func printMessage() async {
        let string = await withTaskGroup(of: String.self) { group -> String in
            // тут добавляем строки в группу
            let messages = ["Hello", "My", "Road", "Map", "Group"]
            for message in messages {
                group.addTask {
                    message
                }

            }
            var collected = [String]()

            for await value in group {
                collected.append(value)
            }

            return collected.joined(separator: " ")
        }

        print(string)
    }

}
