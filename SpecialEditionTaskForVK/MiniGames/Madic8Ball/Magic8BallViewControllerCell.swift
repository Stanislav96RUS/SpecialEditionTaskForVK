//
//  Magic8BallViewControllerCell.swift
//  SpecialEditionTaskForVK
//
//  Created by Stanislav on 08.09.2024.
//

import UIKit

final class Magic8BallViewControllerCell: UITableViewCell {
    
    let titleLable: UILabel = {
        let lable = UILabel()
        lable.text = "ask and shake me".uppercased()
        lable.frame = CGRect(x: 0, y: 0, width: 250, height: 48)
        lable.font = UIFont(name: "Chalkduster", size: 18)
        lable.textColor = .black
        return lable
    }()
    private let circleBig: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        view.layer.cornerRadius = view.bounds.height / 2
        view.backgroundColor = .black
        return view
    }()
    private let circleSmall: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        view.layer.cornerRadius = view.bounds.height / 2
        view.backgroundColor = .white
        return view
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
        addSubview(titleLable)
        addSubview(circleBig)
        circleBig.addSubview(circleSmall)
        
    }
    private func setupConstrained() {
        titleLable.center = CGPoint(x: titleLable.frame.width / 2 + 16, y: UIScreen.main.bounds.height / 8 / 2)
        circleBig.center = CGPoint(x: UIScreen.main.bounds.width - circleBig.frame.width / 2 - 16, y: UIScreen.main.bounds.height / 8 / 2)
        circleSmall.center = CGPoint(x: circleBig.frame.width / 2, y: circleBig.frame.height / 2)
    }
}
