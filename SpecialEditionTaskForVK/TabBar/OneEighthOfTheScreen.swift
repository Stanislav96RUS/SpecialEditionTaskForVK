//
//  OneEighthOfTheScreen.swift
//  SpecialEditionTaskForVK
//
//  Created by Stanislav on 04.09.2024.
//

import UIKit

class OneEighthOfTheScreen: UITableViewController {

    let screen1: UITableViewCell = {
        let view = CurrentWeatherViewControllerCell()
        view.backgroundColor = .yellow
        view.labelNameCity.frame = CGRect(x: 0, y: 0, width: 500, height: 150)
        view.labelNameCity.textColor = .green
        return view
    }()
    
    let screen2: UITableViewCell = {
        let view = CurrentWeatherViewControllerCell()
        view.backgroundColor = .red
        view.labelNameCity.frame = CGRect(x: 0, y: 0, width: 500, height: 150)
        view.labelNameCity.textColor = .green
        return view
    }()
    
    let screen3: UITableViewCell = {
        let view = CurrentWeatherViewControllerCell()
        view.backgroundColor = .brown
        view.labelNameCity.frame = CGRect(x: 0, y: 0, width: 500, height: 150)
        view.labelNameCity.textColor = .green
        return view
    }()
    let screen4: UITableViewCell = {
        let view = CurrentWeatherViewControllerCell()
        view.backgroundColor = .blue
        view.labelNameCity.frame = CGRect(x: 0, y: 0, width: 500, height: 150)
        view.labelNameCity.textColor = .green
        return view
    }()
    
    let screen5: UITableViewCell = {
        let view = CurrentWeatherViewControllerCell()
        view.backgroundColor = .blue
        view.labelNameCity.frame = CGRect(x: 0, y: 0, width: 500, height: 150)
        view.labelNameCity.textColor = .green
        return view
    }()
    let screen6: UITableViewCell = {
        let view = CurrentWeatherViewControllerCell()
        return view
    }()
    let screen7: UITableViewCell = {
        let view = CurrentWeatherViewControllerCell()
        view.backgroundColor = .blue
        view.labelNameCity.frame = CGRect(x: 0, y: 0, width: 500, height: 150)
        view.labelNameCity.textColor = .green
        return view
    }()
    let screen8: UITableViewCell = {
        let view = CurrentWeatherViewControllerCell()
        return view
    }()
    let screen9: UITableViewCell = {
        let view = CurrentWeatherViewControllerCell()
        view.backgroundColor = .blue
        view.labelNameCity.frame = CGRect(x: 0, y: 0, width: 500, height: 150)
        view.labelNameCity.textColor = .green
        return view
    }()
    let screen10: UITableViewCell = {
        let view = CurrentWeatherViewControllerCell()
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
//            addChild(data[i])
            data[i].frame = CGRect(x: 0, y: UIScreen.main.bounds.height / 8 * CGFloat(i), width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 8)
            view.addSubview(data[i])
//            view.addSubview(data[i].view)
//            data[i].didMove(toParent: self)
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: UIScreen.main.bounds.height / 8 * CGFloat(data.count), right: 0)
        }
    }
}
