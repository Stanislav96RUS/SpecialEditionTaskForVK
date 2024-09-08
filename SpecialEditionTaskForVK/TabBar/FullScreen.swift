//
//  FullScreen.swift
//  SpecialEditionTaskForVK
//
//  Created by Stanislav on 04.09.2024.
//

import UIKit

final class FullScreen: UITableViewController  {
    
    private let screen1: UIViewController = {
        let view = CurrentWeatherViewController()
        return view
    }()
    
    private let screen2: UIViewController = {
        let view = PasswordRandomizerViewController()
        return view
    }()
    
    private let screen3: UIViewController = {
        let view = Magic8BallViewController()
        return view
    }()
    
    private let screen4: UIViewController = {
        let view = CurrentWeatherViewController()
        view.view.backgroundColor = .systemRed
        return view
    }()
    private let screen5: UIViewController = {
        let view = PasswordRandomizerViewController()
        view.view.backgroundColor = .black
        view.buttonGeneration.backgroundColor = .cyan
        return view
    }()
    
    private let screen6: UIViewController = {
        let view = Magic8BallViewController()
        view.view.backgroundColor = .yellow
        return view
    }()
    
    private let screen7: UIViewController = {
        let view = CurrentWeatherViewController()
        view.view.backgroundColor = .systemMint
        view.labelTemp.textColor = .systemRed
        return view
    }()
    private let screen8: UIViewController = {
        let view = PasswordRandomizerViewController()
        view.view.backgroundColor = .brown
        return view
    }()
    private let screen9: UIViewController = {
        let view = Magic8BallViewController()
        view.view.backgroundColor = .systemPink
        return view
    }()
    private let screen10: UIViewController = {
        let view = PasswordRandomizerViewController()
        view.view.backgroundColor = .brown
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    private func setupSubviews() {
        setupUIViewControllers()
    }
    
    private func setupUIViewControllers() {
        let data = [screen1, screen2, screen3, screen4, screen5, screen6, screen7, screen8, screen9, screen10]
        for i in 0..<data.count {
            addChild(data[i])
            data[i].view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height * CGFloat(i), width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            view.addSubview(data[i].view)
            data[i].didMove(toParent: self)
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: UIScreen.main.bounds.height * CGFloat(data.count), right: 0)
        }
    }
}
