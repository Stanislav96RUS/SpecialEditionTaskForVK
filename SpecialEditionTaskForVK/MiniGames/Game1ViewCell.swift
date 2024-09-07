//
//  Game1ViewCell.swift
//  SpecialEditionTaskForVK
//
//  Created by Stanislav on 04.09.2024.
//

import Foundation
import UIKit

class Game1ViewCell: UITableViewCell {
//    let game1ViewCell = Game1ViewController()
    
    let button: UIView = {
        let view = Game1ViewController()
        view.button.frame = CGRect(x: 150, y: 0, width: 124, height: 24)
        
        return view.button
    }()
    
    let image: UIImageView = {
       let view = Game1ViewController()
        view.image.frame = CGRect(x: 50, y: 0, width: 14, height: 14)
        return view.image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .brown
        addSubview(image)
        addSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
