//
//  Game2ViewController.swift
//  SpecialEditionTaskForVK
//
//  Created by Stanislav on 03.09.2024.
//

import UIKit
import SnapKit

final class PasswordRandomizer: UIViewController {

    let pasteboard = UIPasteboard.general
    
    let titlelableText: UILabel = {
        let lable = UILabel()
        lable.text = "Password Generator"
        lable.frame = CGRect(x: 0, y: 0, width: 300, height: 40)
        lable.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 8 * 1)
        lable.textAlignment = .center
        lable.font = UIFont(name: "Academy Engraved LET Plain:1.0", size: 34)
        lable.textColor = .systemRed
        return lable
    }()
    let sliderCount: UISlider = {
        let slider = UISlider()
        slider.frame = CGRect(x: 0, y: 0, width: 260, height: 20)
        slider.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 8 * 2)
        slider.minimumTrackTintColor = .blue
        slider.maximumTrackTintColor = .gray
        slider.minimumValue = 8
        slider.maximumValue = 32
        slider.isContinuous = true
        slider.value = 20
        slider.addTarget(Any?.self, action: #selector(paybackSliderValueDidChange), for: .valueChanged)
        return slider
    }()
    let lableText1: UILabel = {
        let lable = UILabel()
        lable.frame = CGRect(x: 0, y: 0, width: 250, height: 30)
        lable.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 8 * 1.5)
        lable.textAlignment = .center
        lable.textColor = .systemGreen
        return lable
    }()
    let buttonGeneration: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 48)
        button.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 8 * 2.5)
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 2.0
        button.layer.masksToBounds = false
        button.layer.cornerRadius = button.frame.height / 2
        button.setTitle("GENERATION", for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(Any?.self, action: #selector(actionButtonGeneration), for: .touchUpInside)
        return button
    }()
    let lableText: UILabel = {
        let lable = UILabel()
        lable.textColor = .systemGreen
        return lable
    }()
    let buttonCopy: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 48)
        button.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 8 * 3.5)
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 2.0
        button.layer.masksToBounds = false
        button.layer.cornerRadius = button.frame.height / 2
        button.setTitle("COPY", for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        button.backgroundColor = .gray
        button.isHidden = true
        button.addTarget(Any?.self, action: #selector(actionButtonCopy), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(titlelableText)
        view.addSubview(lableText1)
        view.addSubview(sliderCount)
        view.addSubview(buttonGeneration)
        view.addSubview(lableText)
        view.addSubview(buttonCopy)
        lableText1.text = "generate a \(Int(sliderCount.value))-digit password"
    }
    
    @objc func paybackSliderValueDidChange(sender: UISlider!) {
        lableText1.text = "Generate a \(Int(sliderCount.value))-digit password."
    }
    
    @objc func actionButtonGeneration() {
        lableText.text = countToPassword("\(Int(sliderCount.value))")
        lableText.sizeToFit()
        lableText.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 8 * 3)
        if lableText.text != "" {
            buttonCopy.isHidden = false
        } else {
            buttonCopy.isHidden = true
        }
        buttonCopy.backgroundColor = .systemGreen
        buttonCopy.setTitle("COPY", for: .normal)
        buttonCopy.setTitleColor(.systemRed, for: .normal)
    }
    
    @objc func actionButtonCopy() {
        pasteboard.string = lableText.text
        buttonCopy.backgroundColor = .systemGray
        buttonCopy.setTitle("COPIED", for: .normal)
        buttonCopy.setTitleColor(.systemGreen, for: .normal)
    }
                         
    func countToPassword (_ count: String) -> String {
        guard let count = Int(count) else { return "" }
        let symbols = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0987654321"
        let specialСharacter = ["\u{20}", "\u{21}", "\u{22}", "\u{23}", "\u{24}", "\u{25}", "\u{26}", "\u{27}", "\u{28}", "\u{29}", "\u{2A}", "\u{2B}", "\u{2C}", "\u{2D}", "\u{2E}", "\u{2F}", "\u{3A}", "\u{3B}", "\u{3C}", "\u{3D}", "\u{3E}", "\u{3F}", "\u{40}", "\u{5B}", "\u{5C}", "\u{5D}", "\u{5E}", "\u{5F}", "\u{60}", "\u{7B}", "\u{7C}", "\u{7D}", "\u{7E}"]
        var arrSymbols = [String]()
        for _ in 0..<count {
            arrSymbols.append((symbols.map{ String($0) } + specialСharacter).randomElement() ?? "")
        }
        return arrSymbols.joined()
    }
}

