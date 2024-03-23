//
//  Day3task1Controller.swift
//  Multithreading
//
//  Created by Руслан Абрамов on 21.03.2024.
//

import UIKit

class Day3task1Controller: UIViewController {

    var semaphore = DispatchSemaphore(value: 0)
    override func viewDidLoad() {
        super.viewDidLoad()

        let phrasesService = PhrasesService()

        for i in 0..<10 {
            DispatchQueue.global().async {
                phrasesService.addPhrase("Phrase \(i)")
                print(Thread.current)
            }

        }

        // Даем потокам время на завершение работы
        Thread.sleep(forTimeInterval: 1)

        // Выводим результат
        semaphore.wait()
        print(phrasesService.phrases)
        semaphore.signal()
    }

    actor PhrasesService {
        var phrases: [String] = []
        var semaphore = DispatchSemaphore(value: 1)
        func addPhrase(_ phrase: String) {
            semaphore.wait()
            phrases.append(phrase)
            semaphore.signal()
        }
    }


}
