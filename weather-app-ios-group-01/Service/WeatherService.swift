//
//  WeatherService.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 12/09/2021.
//

import Foundation

class WeatherService: ObservableObject, WeatherServiceManager {
    private var service: APIServiceManager

    init(apiManager: APIServiceManager = ApiService()){
        self.service = apiManager
    }

    // buildParameters doc
    func buildParameters(lat: Double, long: Double) -> [String: Any] {
        return [
            "lat": lat,
            "lon": long,
            "lang": APIGlobals.lang,
            "units": APIGlobals.units,
            "exclude": APIGlobals.exclude,
            "appid": APIGlobals.appid,
        ] as [String: Any]
    }

    // getCurrentForecast doc
    func getCurrentForecast(lat: Double, long: Double, completionHandler: @escaping (Result<WeatherAPIResponse, Error>) -> Void) {
        let parameters = buildParameters(lat: lat, long: long)
        service.performRequest(url: APIGlobals.url, params: parameters, completion: { apiResponse in
            switch apiResponse {
            case .success(let weatherData):
                guard let decodedResp = try? JSONDecoder().decode(WeatherAPIResponse.self, from: weatherData!) else {
                    completionHandler(.failure(print("Parsing Error") as! Error))
                    return
                }
                completionHandler(.success(decodedResp))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
}
