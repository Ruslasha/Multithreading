import UIKit

// OCP, придется изменять класс SizePrinter
//struct Circle {
//   let radius: CGFloat
//}
//
//struct Rectangle {
//   let width: CGFloat
//   let height: CGFloat
//}
//
//class SizePrinter {
//
//    func printSize(of circle: Circle) {
//        let diameter = circle.radius * 2
//        print(CGSize(width: diameter, height: diameter))
//    }
//
//    func printSize(of rect: Rectangle) {
//        print(CGSize(width: rect.width, height: rect.height))
//    }
//}
protocol Shape {
    func getSize() -> CGSize
}

struct Circle: Shape {
    let radius: CGFloat

    func getSize() -> CGSize {
        let diameter = radius * 2
        return CGSize(width: diameter, height: diameter)
    }
}

struct Rectangle: Shape {
    let width: CGFloat
    let height: CGFloat

    func getSize() -> CGSize {
        return CGSize(width: width, height: height)
    }
}

class SizePrinter {

    func printSize(of shape: Shape) {
        let size = shape.getSize()
        print(size)
    }
}
