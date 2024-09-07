//
//  WeatherModel.swift
//  AstonishingWeather
//
//  Created by Stanislav on 18.03.2024.
//

import Foundation

struct WeatherModel: Codable {
    let city: City
    let list: [list]
}

struct City: Codable {
    let name: String
}

struct list: Codable {
    let dt: TimeInterval
    let main: Main
    let weather: [Weather]
}

struct Weather: Codable {
    let description: String
}

struct Main:Codable {
    let temp: Double
    let tempMin: Double
    let tempMax: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
