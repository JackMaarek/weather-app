//
//  APIService.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 03/09/2021.
//

import Alamofire
import Foundation

enum APIGlobals {
    static let lang: String = "fr"
    static let oneCallUrl: String = "https://api.openweathermap.org/data/2.5/onecall"
    static let cityCallUrl: String = "https://api.openweathermap.org/data/2.5/weather"
    static let exclude: String = "minutely,hourly,alerts"
    static let units: String = "metric"
    static let appid: String = "d3c596d8596ec03a4973fb0fc0222e66"
    static let assetUrl: String = "http://openweathermap.org/img/wn/"
}

class ApiService: ObservableObject, APIServiceManager {
    // performRequest doc
    func performRequest(url: String, params: Parameters?, completion: @escaping (Result<Data?, Error>) -> Void) {
        AF.request(url, parameters: params).response { resp in
            guard resp.error == nil else { completion(.failure(resp.error!)); return }
            completion(.success(resp.data))
        }
    }
}
