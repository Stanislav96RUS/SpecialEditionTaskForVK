//
//  Game3ViewController.swift
//  SpecialEditionTaskForVK
//
//  Created by Stanislav on 03.09.2024.
//

import UIKit
import SnapKit

class Game3ViewController: UIViewController {
    
    
    let answers = [
        ("Positive", ["It is certain", "It is decidedly so", "Without a doubt", "Yes — definitely", "You may rely on it"]),
        ("Hesitantly positive", ["As I see it, yes", "Most likely", "Outlook good", "Signs point to yes", "Yes"]),
        ("Neutral", ["Reply hazy, try again", "Ask again later", "Better not tell you now", "Cannot predict now", "Concentrate and ask again"]),
        ("Negative", ["Don’t count on it", "My reply is no", "My sources say no", "Outlook not so good", "Very doubtful"]),
    ]
    
    let circle: UIView = {
        let button = UIView()
        button.frame = CGRect(x: 0, y: 0, width: 260, height: 260)
//        button.center = CGPoint(x: UIScreen.main.bounds.width / 2,
//                              y: UIScreen.main.bounds.height / 4)
        button.layer.cornerRadius = button.bounds.height / 2
        button.backgroundColor = .black
        return button
    }()
    let circle2: UIView = {
        let button = UIView()
        button.frame = CGRect(x: 0, y: 0, width: 130, height: 130)
//        button.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 4)
        button.layer.cornerRadius = button.bounds.height / 2
        button.backgroundColor = .white
        return button
    }()
    let lable: UILabel = {
        let button = UILabel()
        button.frame = CGRect(x: 0, y: 0, width: 130, height: 130)
//        button.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 4)
        button.layer.cornerRadius = button.bounds.height / 2
        button.numberOfLines = 3
        button.textAlignment = .center
        button.layer.masksToBounds = true
//        button.backgroundColor = .white
        button.textColor = .black
        return button
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 260, height: 260)
//        button.center = CGPoint(x: UIScreen.main.bounds.width / 2,
//                              y: UIScreen.main.bounds.height / 4)
        button.layer.cornerRadius = button.bounds.height / 2
        button.layer.masksToBounds = true
//        button.backgroundColor = .white
        button.addTarget(Any?.self, action: #selector(popTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        drawBall()
        
        circle.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 4)
        circle2.center = CGPoint(x: circle.frame.width / 2, y: circle.frame.height / 2)
        button.center = CGPoint(x: circle.frame.width / 2, y: circle.frame.height / 2)
        lable.center = CGPoint(x: circle.frame.width / 2, y: circle.frame.height / 2)
    }
    
    func drawBall() {
        view.addSubview(circle)
        circle.addSubview(circle2)
        circle.addSubview(button)
        circle.addSubview(lable)
    }
    
    @objc func popTap() {
        self.circle.shake()
        randomBall()
    }
    
    func randomBall(){
        var arr = [String]()
        for i in answers {
            for j in i.1 {
                arr.append(j)
            }
        }
        let randomElement = arr.randomElement()
        lable.text = randomElement
        var group = ""
        for i in answers {
            for j in i.1 {
                if randomElement == j {
                    group = i.0
                }
            }
        }
        switch group {
        case "Positive" : circle2.backgroundColor = .blue
        case "Hesitantly positive" : circle2.backgroundColor = .green
        case "Neutral" : circle2.backgroundColor = .yellow
        case "Negative" : circle2.backgroundColor = .red
        default:
            circle2.backgroundColor = .white
        }
    }
}

extension UIView {
  
  func shake() {
    let animation = CABasicAnimation(keyPath: "position")
    animation.duration = 0.07
    animation.repeatCount = 3
    animation.autoreverses = true
      animation.fromValue = NSValue(cgPoint: CGPointMake(self.center.x - 30, self.center.y))
      animation.toValue = NSValue(cgPoint: CGPointMake(self.center.x + 30, self.center.y))
      self.layer.add(animation, forKey: "position")
  }

}
