//
//  OneHalfOfTheScreen.swift
//  SpecialEditionTaskForVK
//
//  Created by Stanislav on 03.09.2024.
//

import UIKit
import SnapKit

class OneHalfOfTheScreen: UITableViewController {
    
    let screen1: UIViewController = {
        let view = CurrentWeatherViewController()
        return view
    }()
    
    let screen2: UIViewController = {
        let view = PasswordRandomizer()
        return view
    }()
    
    let screen3: UIViewController = {
        let view = Game3ViewController()
        return view
    }()
    
    let screen4: UIViewController = {
        let view = Game1ViewController()
        return view
    }()
    var toggle: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    private func setupSubviews() {
        setupUIViewControllers()
    }

    private func setupUIViewControllers() {
        let data = [screen1, screen2, screen3, screen4]
        for i in 0..<data.count {
            addChild(data[i])
            data[i].view.frame = CGRect(x: 0, y: (UIScreen.main.bounds.height / 2) * CGFloat(i), width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
            view.addSubview(data[i].view)
            data[i].didMove(toParent: self)
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: (UIScreen.main.bounds.height / 2) * CGFloat(data.count), right: 0)
        }
    }
}

