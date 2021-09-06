////
////  WeatherService.swift
////  weather-app-ios-group-01
////
////  Created by jack Maarek on 05/09/2021.
////
//
//import Foundation
//import Combine
//
//protocol WeatherFetchable {
//  func weeklyWeatherForecast(
//    forCity city: String
//  ) -> AnyPublisher<WeeklyForecastResponse, WeatherError>
//
//  func currentWeatherForecast(
//    forCity city: String
//  ) -> AnyPublisher<CurrentWeatherForecastResponse, WeatherError>
//}
//
//// MARK: - WeatherFetchable
//extension WeatherFetcher: WeatherFetchable {
//  func weeklyWeatherForecast(
//    forCity city: String
//  ) -> AnyPublisher<WeeklyForecastResponse, WeatherError> {
//    return forecast(with: makeWeeklyForecastComponents(withCity: city))
//  }
//
//  func currentWeatherForecast(
//    forCity city: String
//  ) -> AnyPublisher<CurrentWeatherForecastResponse, WeatherError> {
//    return forecast(with: makeCurrentDayForecastComponents(withCity: city))
//  }
//
//  private func forecast<T>(
//    with components: URLComponents
//  ) -> AnyPublisher<T, WeatherError> where T: Decodable {
//    // 1
//    guard let url = components.url else {
//      let error = WeatherError.network(description: "Couldn't create URL")
//      return Fail(error: error).eraseToAnyPublisher()
//    }
//
//    // 2
//    return session.dataTaskPublisher(for: URLRequest(url: url))
//      // 3
//      .mapError { error in
//        .network(description: error.localizedDescription)
//      }
//      // 4
//      .flatMap(maxPublishers: .max(1)) { pair in
//        decode(pair.data)
//      }
//      // 5
//      .eraseToAnyPublisher()
//  }
//}
