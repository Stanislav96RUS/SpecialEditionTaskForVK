//
//  CurrentWeatherViewControllerCell.swift
//  SpecialEditionTaskForVK
//
//  Created by Stanislav on 04.09.2024.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxCocoa

class CurrentWeatherViewControllerCell: UITableViewCell {
    
    private enum Offsets {
        static let offsetTop = 150
        static let offsetTopEqualTo = 60
        static let offsetBottomEqualTo = 32
    }
    
    private let networkService = NetworkService()
    private var modelView = WeatherModelView()
    private let disposeBag = DisposeBag()
    
    let labelNameCity: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ConstantsCurrentWeather.fontSize.fontSize32)
        label.textColor = .white
        label.frame = CGRect(x: 0, y: 0, width: 250, height: 150)
        return label
    }()
    
    let labelTemp: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ConstantsCurrentWeather.fontSize.fontSize32)
        label.textColor = .white
        label.textAlignment = .right
        label.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .brown
        setupSubviews()
        setupConstrained()
        modelView.requestWeatherForLOcation()
        bind()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(labelNameCity)
        addSubview(labelTemp)
        
    }
    private func setupConstrained() {
        labelNameCity.center = CGPoint(x: labelNameCity.frame.width / 2 + 16, y: UIScreen.main.bounds.height / 8 / 2)
        labelTemp.center = CGPoint(x: UIScreen.main.bounds.width - labelTemp.frame.width / 2 - 16, y: UIScreen.main.bounds.height / 8 / 2)
    }
    
    private var forecastArray: [(temp: Int, date: String, weekDay: String)] = []
    func bind() {
        modelView.relay.subscribe { event in
            DispatchQueue.main.async {
                let lableNameCity = event.element?.city.name
                self.labelNameCity.text = lableNameCity
                let lableTemp = Int(round(event.element?.list.first?.main.temp ?? 0))
                self.labelTemp.text = "\(String(describing: lableTemp))º"
            }
        }.disposed(by: disposeBag)
    }
}
