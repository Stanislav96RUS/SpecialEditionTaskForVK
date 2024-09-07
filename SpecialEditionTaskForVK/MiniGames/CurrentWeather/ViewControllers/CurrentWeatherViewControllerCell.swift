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
    
    /*private*/ let labelNameCity: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ConstantsCurrentWeather.fontSize.fontSize32)
        label.textColor = .white
        label.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        return label
    }()
    
    private let labelTemp: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ConstantsCurrentWeather.fontSize.fontSize32)
        label.textColor = .white
        label.frame = CGRect(x: UIScreen.main.bounds.width - 50, y: 0, width: 150, height: 150)
        return label
    }()
    //
    //        private let labelDescription: UILabel = {
    //            let label = UILabel()
    //            label.font = UIFont.systemFont(ofSize: Constants.fontSize.fontSize24)
    //            label.textColor = .white
    //            return label
    //        }()
    //
    //        private let labelTempMinAndMax: UILabel = {
    //            let label = UILabel()
    //            label.font = UIFont.systemFont(ofSize: Constants.fontSize.fontSize24)
    //            label.textColor = .white
    //            return label
    //        }()
    //
    //        private let tableView: UITableView = {
    //            let tableView = UITableView()
    //            tableView.backgroundColor = .systemBlue
    //            return tableView
    //        }()
    
    private func setupSubviews() {
        addSubview(labelNameCity)
        addSubview(labelTemp)
        
    }
    
    var forecastArray: [(temp: Int, date: String, weekDay: String)] = []
    func bind() {
        modelView.relay.subscribe { event in
            DispatchQueue.main.async {
                let lableNameCity = event.element?.city.name
                self.labelNameCity.text = lableNameCity
                let lableTemp = Int(round(event.element?.list.first?.main.temp ?? 0))
                self.labelTemp.text = "\(String(describing: lableTemp))º"
                //                    let lableDescription = event.element?.list.first?.weather.first?.description.capitalized ?? ""
                //                    self.labelDescription.text = "\(String(describing: lableDescription))"
                //                    let lableTempMin = Int(round(event.element?.list.first?.main.tempMin ?? 0))
                //                    let lableTempMax = Int(round(event.element?.list.first?.main.tempMax ?? 0))
                //                    self.labelTempMinAndMax.text = "H:\(lableTempMax)º L:\(lableTempMin)º"
            }
        }.disposed(by: disposeBag)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .brown
        addSubview(labelNameCity)
        addSubview(labelTemp)
        modelView.requestWeatherForLOcation()
        bind()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
