import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print(2)
        DispatchQueue.main.async {
            print(3)
            DispatchQueue.main.async {
                print(5)
            }
            print(4)
        }
        print(6)
    }
}

let vc = ViewController()
print(1)
let view = vc.view
print(7)

// viewDidLoad вызвался, т.к мы обратились к вью в 20 строке
//Все принты не печатаются из-за дедлока, main.sync в main.aync
// 1 2 6 7 3 4 5
