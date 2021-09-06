//
//  APIService.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 03/09/2021.
//

import Alamofire
import Foundation

class ApiService: ObservableObject {
    let lang: String = "fr"
    let url: String = "https://api.openweathermap.org/data/2.5/onecall"
    let exclude: String = "minutely,hourly,alerts"
    let appid: String = "d3c596d8596ec03a4973fb0fc0222e66"

    // buildParameters doc
    func buildParameters(lat: Double, long: Double) -> [String: Any] {
        return [
            "lat": lat,
            "lon": long,
            "lang": lang,
            "exclude": exclude,
            "appid": appid,
        ] as [String: Any]
    }

    // getCurrentForecast doc
    func getCurrentForecast(lat: Double, long: Double, completionHandler: @escaping (WeatherAPIResponse) -> Void) {
        let parameters = buildParameters(lat: lat, long: long)

        performRequest(url: url, params: parameters, completion: { weatherAPIResponse in
            completionHandler(weatherAPIResponse)
        })
    }

    // performRequest doc
    func performRequest(url: String, params: Parameters?, completion: @escaping (WeatherAPIResponse) -> Void) {
        AF.request(url, parameters: params).responseDecodable(of: WeatherAPIResponse.self) { response in
            guard let WeatherAPIResponse = response.value else { return }
            completion(WeatherAPIResponse)
        }
    }
}
