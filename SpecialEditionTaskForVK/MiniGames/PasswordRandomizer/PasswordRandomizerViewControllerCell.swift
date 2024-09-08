//
//  PasswordRandomizerViewControllerCell.swift
//  SpecialEditionTaskForVK
//
//  Created by Stanislav on 08.09.2024.
//

import UIKit

final class PasswordRandomizerViewControllerCell: UITableViewCell {
    
    let titlelableText: UILabel = {
        let lable = UILabel()
        lable.text = "Password Generator"
        lable.frame = CGRect(x: 0, y: 0, width: 250, height: 48)
        lable.font = UIFont(name: "Academy Engraved LET Plain:1.0", size: 24)
        lable.textColor = .systemRed
        lable.textAlignment = .left
        return lable
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstrained()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(titlelableText)
    }
    
    func setupConstrained() {
        titlelableText.center = CGPoint(x: titlelableText.frame.width / 2 + 16, y: UIScreen.main.bounds.height / 8 / 2)
    }
}

