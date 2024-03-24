//
//  Day5task6ViewController.swift
//  Multithreading
//
//  Created by Руслан Абрамов on 24.03.2024.
//

import UIKit

class Day5task6ViewController: UIViewController {
    
    var networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            do {
                let messages = try await fetchMessages()
                for message in messages {
                    print(message)
                }
            } catch {
                print("Error: \(error)")
            }
        }
        
        func fetchMessages() async throws -> [Message] {
            return try await withCheckedThrowingContinuation { continuation in
                networkService.fetchMessages { message in
                    continuation.resume(returning: message)
                }
            }
        }
        
    }
}
