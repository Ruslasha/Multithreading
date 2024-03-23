//
//  Day4task1ViewController.swift
//  Multithreading
//
//  Created by Руслан Абрамов on 23.03.2024.
//

import UIKit

class Day4task1ViewController: UIViewController {

    final class Post: Sendable { // нужно подписать на sendable

    }

    enum State1: Sendable {
         case loading
         case data(String)
    }

    enum State2: Sendable {
         case loading
         case data(Post) // Out: Associated value 'data' of 'Sendable'-conforming enum 'State2' has non-sendable type 'ViewController.Post'
    }

}
