//
//  WeatherServiceManager.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 12/09/2021.
//

import Foundation

protocol WeatherServiceManager {
    
    // getCurrentForecast doc
    func getCurrentForecast(lat: Double, long: Double, completionHandler: @escaping (Result<WeatherAPIResponse, Error>) -> Void)
}
