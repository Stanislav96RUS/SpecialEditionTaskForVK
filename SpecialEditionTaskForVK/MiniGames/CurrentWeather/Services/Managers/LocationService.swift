//
//  LocationService.swift
//  AstonishingWeather
//
//  Created by Stanislav on 19.03.2024.
//

import CoreLocation
import Foundation
import RxRelay
import UIKit


final class LocationService:UIViewController, CLLocationManagerDelegate {
     
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var relay = PublishRelay<String>()
    
    func setupLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, currentLocation == nil {
            currentLocation = locations.first
            locationManager.stopUpdatingLocation()
            requestWeatherForLocation()
        }
    }
    
    func requestWeatherForLocation() {
        guard let currentLocation = currentLocation else { return  }
        let longitude = currentLocation.coordinate.longitude
        let latitude = currentLocation.coordinate.latitude
        let currentLocationString = "&lon=\(longitude)&lat=\(latitude)"
        self.relay.accept(currentLocationString)
    }
}
