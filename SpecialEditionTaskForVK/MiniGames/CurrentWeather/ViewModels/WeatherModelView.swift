//
//  WeatherModelView.swift
//  AstonishingWeather
//
//  Created by Stanislav on 22.03.2024.
//

import Foundation
import RxSwift
import RxRelay

final class WeatherModelView {
    
    private let locationService = LocationService()
    private let disposeBag = DisposeBag()
    let networkService = NetworkService()
    var relay = PublishRelay<WeatherModel>()
    
    var relayForecast = PublishRelay<[(temp: Int, date: String, weekDay: String)]>()
    
    init() {
        bind()
    }
    
    func bind() {
        networkService.relay.subscribe { event in
            self.relay.accept(event.element ?? WeatherModel(city: City(name: ""), list: []))
        }.disposed(by: disposeBag)
    }
    
    
    func requestWeatherForLOcation() {
        var forecastArray: [(temp: Int, date: String, weekDay: String)] = []
        locationService.setupLocation()
        locationService.relay.subscribe { event in
            self.networkService.getWeather(event.element ?? "") { model in
                var arr: [(temp: Double, weather: String, date: String, weekDay: String)] = []
                
                let list = model.list
                for i in list {
                    let date = NSDate(timeIntervalSince1970: i.dt)
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    let localDate = dateFormatter.string(from: date as Date)
                    dateFormatter.dateFormat = "EEE"
                    let weekDay = dateFormatter.string(from: date as Date)
                    arr.append((temp: i.main.temp, weather: i.weather.first?.description ?? "", date: localDate, weekDay: weekDay))
                    
                }
                let arrDate = Set(arr.map { $0.date })
                for i in arrDate {
                    var temp: Double = 0
                    var count: Double = 0
                    var weekDay = ""
                    arr.map {
                        if $0.date == i {
                            weekDay = $0.weekDay
                            temp += $0.temp
                            count += 1   
                        }
                    }
                    forecastArray.append((temp: Int(round(temp / count)), date: i, weekDay: weekDay))
                }
                self.relayForecast.accept(forecastArray.sorted { $0.date < $1.date })
            }
        }.disposed(by: disposeBag)
        
    }
}
