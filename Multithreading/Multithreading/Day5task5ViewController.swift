//
//  Day5task5ViewController.swift
//  Multithreading
//
//  Created by Руслан Абрамов on 24.03.2024.
//

import UIKit

class Day5task5ViewController: UIViewController {

    var networkService = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            let messages = await fetchMessages()
            for message in messages {
                print(message)
            }
        }

        
    }

    func fetchMessages() async -> [Message] {
        await withCheckedContinuation { continuation in
            networkService.fetchMessages { message in
                continuation.resume(returning: message)
            }
        }
    }


}

struct Message: Decodable, Identifiable {
    let id: Int
    let from: String
    let message: String
}


class NetworkService {

    func fetchMessages(completion: @escaping ([Message]) -> Void) {
        let url = URL(string: "https://hws.dev/user-messages.json")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let messages = try? JSONDecoder().decode([Message].self, from: data) {
                    completion(messages)
                    return
                }
            }

            completion([])
        }
        .resume()
    }
}
