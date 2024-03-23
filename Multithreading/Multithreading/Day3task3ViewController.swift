//
//  Day3task3ViewController.swift
//  Multithreading
//
//  Created by Руслан Абрамов on 23.03.2024.
//

import UIKit

//livelock
class Day3task3ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var people1 = People1()
        var people2 = People2()
        
        let thread1 = Thread {
            people1.walkPast(with: people2)
        }
        
        thread1.start()
        
        let thread2 = Thread {
            people2.walkPast(with: people1)
        }
        
        thread2.start()
    }
    
}

class People1 {
    var isDifferentDirections = false;

    func walkPast(with people: People2) {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            while (!people.isDifferentDirections) {
                print("People1 не может обойти People2")
                sleep(1)
            }
        }

        print("People1 смог пройти прямо")
        isDifferentDirections = true
    }
}

class People2 {
    var isDifferentDirections = false;

    func walkPast(with people: People1) {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            while (!people.isDifferentDirections) {
                print("People2 не может обойти People1")
                sleep(1)
            }
        }

        print("People2 смог пройти прямо")
        isDifferentDirections = true
    }
}
