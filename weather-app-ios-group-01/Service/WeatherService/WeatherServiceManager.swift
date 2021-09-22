//
//  WeatherServiceManager.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 12/09/2021.
//
import CoreLocation
import Foundation

protocol WeatherServiceManager {
    // getForecast doc
    func getForecast(city: String, completionHandler: @escaping (Result<CityAPIResponse, Error>) -> Void)

    // getCurrentLocationForecast
    func getCurrentLocationForecast(completionHandler: @escaping (Result<WeatherAPIResponse, Error>) -> Void)
}
