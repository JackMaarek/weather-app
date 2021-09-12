//
//  WeatherService.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 12/09/2021.
//
import CoreLocation
import Foundation

class WeatherService: ObservableObject, WeatherServiceManager {
    private var service: APIServiceManager

    init(apiManager: APIServiceManager = ApiService()) {
        service = apiManager
    }

    // buildParameters doc
    func buildParameters(lat: Double, long: Double) -> [String: Any] {
        return [
            "lat": lat,
            "lon": long,
            "lang": APIGlobals.lang,
            "units": APIGlobals.units,
            "exclude": APIGlobals.exclude,
            "appid": APIGlobals.appid
        ] as [String: Any]
    }

    // getCurrentForecast doc
    func getForecast(lat: Double, long: Double, completionHandler: @escaping (Result<WeatherAPIResponse, Error>) -> Void) {
        let parameters = buildParameters(lat: lat, long: long)
        service.performRequest(url: APIGlobals.url, params: parameters, completion: { apiResponse in
            switch apiResponse {
            case let .success(weatherData):
                guard let decodedResp = try? JSONDecoder().decode(WeatherAPIResponse.self, from: weatherData!) else {
                    completionHandler(.failure(print("Parsing Error") as! Error))
                    return
                }
                completionHandler(.success(decodedResp))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        })
    }

    // getCurrentForecast doc
    func getCurrentLocationForecast(completionHandler: @escaping (Result<WeatherAPIResponse, Error>) -> Void) {
        let location = LocationHelper.currentLocation
        let parameters = buildParameters(lat: location.latitude, long: location.longitude)
        service.performRequest(url: APIGlobals.url, params: parameters, completion: { apiResponse in
            switch apiResponse {
            case let .success(weatherData):
                guard let decodedResp = try? JSONDecoder().decode(WeatherAPIResponse.self, from: weatherData!) else {
                    completionHandler(.failure(print("Parsing Error") as! Error))
                    return
                }
                completionHandler(.success(decodedResp))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        })
    }
}
