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

    // buildOneCallParameters doc
    func buildOneCallParameters(lat: Double, long: Double) -> [String: Any] {
        return [
            "lat": lat,
            "lon": long,
            "lang": APIGlobals.lang,
            "units": APIGlobals.units,
            "exclude": APIGlobals.exclude,
            "appid": APIGlobals.appid,
        ] as [String: Any]
    }

    // buildCityCallParameters doc
    func buildCityCallParameters(city: String) -> [String: Any] {
        return [
            "q": city,
            "lang": APIGlobals.lang,
            "units": APIGlobals.units,
            "appid": APIGlobals.appid,
        ] as [String: Any]
    }

    // getCurrentForecast doc
    func getForecast(city: String, completionHandler: @escaping (Result<CityAPIResponse, Error>) -> Void) {
        let parameters = buildCityCallParameters(city: city)
        service.performRequest(url: APIGlobals.cityCallUrl, params: parameters, completion: { apiResponse in
            switch apiResponse {
            case let .success(weatherData):
                guard let decodedResp = try? JSONDecoder().decode(CityAPIResponse.self, from: weatherData!) else {
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
        let parameters = buildOneCallParameters(lat: location.latitude, long: location.longitude)
        service.performRequest(url: APIGlobals.oneCallUrl, params: parameters, completion: { apiResponse in
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
