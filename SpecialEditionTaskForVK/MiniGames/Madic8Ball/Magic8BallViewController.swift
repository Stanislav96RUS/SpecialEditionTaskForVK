//
//  Magic8BallViewController.swift
//  SpecialEditionTaskForVK
//
//  Created by Stanislav on 03.09.2024.
//

import UIKit

final class Magic8BallViewController: UIViewController {
    
    private let answers = [
        ("Positive", ["It is certain", "It is decidedly so", "Without a doubt", "Yes — definitely", "You may rely on it"]),
        ("Hesitantly positive", ["As I see it, yes", "Most likely", "Outlook good", "Signs point to yes", "Yes"]),
        ("Neutral", ["Reply hazy, try again", "Ask again later", "Better not tell you now", "Cannot predict now", "Concentrate and ask again"]),
        ("Negative", ["Don’t count on it", "My reply is no", "My sources say no", "Outlook not so good", "Very doubtful"]),
    ]
    
    private let titleLable: UILabel = {
        let lable = UILabel()
        lable.text = "ask and shake me".uppercased()
        lable.frame = CGRect(x: 0, y: 0, width: 300, height: 48)
        lable.font = UIFont(name: "Chalkduster", size: 28)
        lable.textAlignment = .center
        return lable
    }()
    private let circleBig: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 260, height: 260)
        view.layer.cornerRadius = view.bounds.height / 2
        view.backgroundColor = .black
        return view
    }()
    private let circleSmall: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 130, height: 130)
        view.layer.cornerRadius = view.bounds.height / 2
        view.backgroundColor = .white
        return view
    }()
    private let lable: UILabel = {
        let lable = UILabel()
        lable.frame = CGRect(x: 0, y: 0, width: 130, height: 130)
        lable.layer.cornerRadius = lable.bounds.height / 2
        lable.numberOfLines = 3
        lable.textAlignment = .center
        lable.layer.masksToBounds = true
        lable.textColor = .black
        return lable
    }()
    private let button: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 260, height: 260)
        button.layer.cornerRadius = button.bounds.height / 2
        button.layer.masksToBounds = true
        button.addTarget(Any?.self, action: #selector(popTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstrained()
        setupUIConfiguration()
    }
    func setupSubviews() {
        drawBall()
        view.addSubview(titleLable)
    }
    func setupConstrained() {
        titleLable.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 16)
        circleBig.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 4)
        circleSmall.center = CGPoint(x: circleBig.frame.width / 2, y: circleBig.frame.height / 2)
        button.center = CGPoint(x: circleBig.frame.width / 2, y: circleBig.frame.height / 2)
        lable.center = CGPoint(x: circleBig.frame.width / 2, y: circleBig.frame.height / 2)
    }
    func setupUIConfiguration() {
        view.backgroundColor = .purple
    }
    func drawBall() {
        view.addSubview(circleBig)
        circleBig.addSubview(circleSmall)
        circleBig.addSubview(button)
        circleBig.addSubview(lable)
    }
    
    @objc func popTap() {
        self.circleBig.shake()
        randomBall()
    }
    
    func randomBall() {
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
        case "Positive" : circleSmall.backgroundColor = .blue
        case "Hesitantly positive" : circleSmall.backgroundColor = .green
        case "Neutral" : circleSmall.backgroundColor = .yellow
        case "Negative" : circleSmall.backgroundColor = .red
        default:
            circleSmall.backgroundColor = .white
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
