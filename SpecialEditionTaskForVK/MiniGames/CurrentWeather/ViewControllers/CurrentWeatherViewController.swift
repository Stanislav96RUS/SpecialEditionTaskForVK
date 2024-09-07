//
//  CurrentWeatherViewController.swift
//  AstonishingWeather
//
//  Created by Stanislav on 18.03.2024.
//

import SnapKit
import RxSwift
import RxCocoa
import UIKit

private enum Offsets {
    static let offsetTop = 150
    static let offsetTopEqualTo = 60
    static let offsetBottomEqualTo = 32
}

final class CurrentWeatherViewController: UIViewController {
    
    private let networkService = NetworkService()
    private var modelView = WeatherModelView()
    private let disposeBag = DisposeBag()
    
    /*private*/ let labelNameCity: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ConstantsCurrentWeather.fontSize.fontSize32)
        label.textColor = .white
        return label
    }()
    
    let labelTemp: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ConstantsCurrentWeather.fontSize.fontSize88)
        label.textColor = .white
        return label
    }()
    
    private let labelDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ConstantsCurrentWeather.fontSize.fontSize24)
        label.textColor = .white
        return label
    }()
    
    private let labelTempMinAndMax: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ConstantsCurrentWeather.fontSize.fontSize24)
        label.textColor = .white
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBlue
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        configureUI() 
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        modelView.requestWeatherForLOcation()
        bind()
    }
 
    private func setupSubviews() {
        view.addSubview(labelNameCity)
        view.addSubview(labelTemp)
        view.addSubview(labelDescription)
        view.addSubview(labelTempMinAndMax)
            }
    
    private func setupConstraints() {
        labelNameCity.snp.makeConstraints { make in
            make.centerX.equalTo(UIScreen.main.bounds.width / 2)
            make.top.equalToSuperview().offset(Offsets.offsetTop)
        }
        labelTemp.snp.makeConstraints { make in
            make.centerX.equalTo(UIScreen.main.bounds.width / 2)
            make.top.equalTo(labelNameCity).offset(Offsets.offsetTopEqualTo)
        }
        labelDescription.snp.makeConstraints { make in
            make.centerX.equalTo(UIScreen.main.bounds.width / 2)
            make.bottom.equalTo(labelTemp).offset(Offsets.offsetBottomEqualTo)
        }
        labelTempMinAndMax.snp.makeConstraints { make in
            make.centerX.equalTo(UIScreen.main.bounds.width / 2)
            make.bottom.equalTo(labelDescription).offset(Offsets.offsetBottomEqualTo)
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBlue
    }

    var forecastArray: [(temp: Int, date: String, weekDay: String)] = []
    func bind() {
        modelView.relay.subscribe { event in
            DispatchQueue.main.async {
                let lableNameCity = event.element?.city.name
                self.labelNameCity.text = lableNameCity
                let lableTemp = Int(round(event.element?.list.first?.main.temp ?? 0))
                self.labelTemp.text = "\(String(describing: lableTemp))º"
                let lableDescription = event.element?.list.first?.weather.first?.description.capitalized ?? ""
                self.labelDescription.text = "\(String(describing: lableDescription))"
                let lableTempMin = Int(round(event.element?.list.first?.main.tempMin ?? 0))
                let lableTempMax = Int(round(event.element?.list.first?.main.tempMax ?? 0))
                self.labelTempMinAndMax.text = "H:\(lableTempMax)º L:\(lableTempMin)º"
            }
        }.disposed(by: disposeBag)
        
        modelView.relayForecast.subscribe { event in
                self.forecastArray = event.element ?? []
            self.forecastTableAppear()
        }.disposed(by: disposeBag)
    }
    
    func forecastTableAppear() {
        DispatchQueue.main.async {
            self.setupTableView()
            self.view.addSubview(self.tableView)
            self.tableView.snp.makeConstraints { make in
                make.left.equalToSuperview().offset(ConstantsCurrentWeather.defaultOffset)
                make.right.equalToSuperview().offset(-ConstantsCurrentWeather.defaultOffset)
                make.top.equalTo(self.labelTempMinAndMax).offset(Offsets.offsetTopEqualTo)
                make.bottom.equalToSuperview().offset(-Offsets.offsetTopEqualTo)
            }
        }
    }
 
}

extension CurrentWeatherViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        registerCell()
    }
    
    func registerCell() {
        tableView.register(ForecastCell.self, forCellReuseIdentifier: ForecastCell.identifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        forecastArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ForecastCell.identifier, for: indexPath) as! ForecastCell
        cell.backgroundColor = .systemBlue
        let forecast = self.forecastArray[indexPath.row]
        let weekDay = forecast.weekDay
        cell.labelDayWeek.text = weekDay
        let dayTemp = forecast.temp
        cell.labelTemp.text = "\(String(describing: dayTemp))º"
        return cell
    }
}
