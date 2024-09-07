//
//  NetworkService.swift
//  AstonishingWeather
//
//  Created by Stanislav on 18.03.2024.
//

import Foundation
import RxRelay

protocol INetworkService {
    func getWeather(_ lat: String, completion: @escaping (WeatherModel) -> Void)
}

private enum Endpoints: String {
    case forecast = "/forecast?"
}

private enum HTTPType: String {
    case get = "GET"
    case post = "POST"
}

private extension String {
    static let appid = "appid=1cca92ba2aba22ba7ea0a0d4893051e5"
    static let baseURL = "https://api.openweathermap.org/data/2.5"
    static let unitsMetric = "&units=metric"
}

private extension NSError {
    static let networkError = NSError(domain: "Network error", code: 0)
}

final class NetworkService: INetworkService {
    
    var relay = PublishRelay<WeatherModel>()
    
    func getWeather(_ lat: String, completion: @escaping (WeatherModel) -> Void) {
        try? sendRequest(.forecast, lat: lat, httpType: .get) { [weak self] data in
            guard let self else { return }
            completion(self.parseWeather(from: data))
        }
    }
    
    private func parseWeather(from data: Data) -> WeatherModel {
        let array = try? JSONDecoder().decode(WeatherModel.self, from: data)
        self.relay.accept(array ?? WeatherModel(city: City(name: ""), list: []))
        return array ?? WeatherModel(city: City(name: ""), list: [])
    }

    private func sendRequest(
        _ type: Endpoints,
        lat: String,
        httpType: HTTPType,
        completion: @escaping (Data) -> Void
    ) throws {
        guard let url = URL(string: .baseURL + type.rawValue + .appid + .unitsMetric + lat) else {
            throw NSError.networkError
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpType.rawValue

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil,
                let data else {
                return
            }
            completion(data)
        }
        task.resume()
    }
}
