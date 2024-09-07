//
//  Game1ViewController.swift
//  SpecialEditionTaskForVK
//
//  Created by Stanislav on 03.09.2024.
//

import UIKit
import SnapKit

class Game1ViewController: UIViewController {
    
    let button: UIView = {
        let view = UIButton()
        view.setTitle("GO", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.font = UIFont(name: "HelveticaNeue-UltraLight", size: 25)
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.addTarget(Any?.self, action: #selector(popSettingsButtonDidTapped), for: .touchUpInside)
        return view
    }()
    
    let image: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "Spic")
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return view
    }()
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//addSubview(image)
//        addSubview(button)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        view.backgroundColor = .yellow
        view.addSubview(button)
    }
    @objc private func popSettingsButtonDidTapped() {
print("GOOD")
    }
}
