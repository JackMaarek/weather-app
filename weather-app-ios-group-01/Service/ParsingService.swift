//
//  ParsingService.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 09/09/2021.
//

import Foundation
import Combine

enum WeatherError: Error {
  case parsing(description: String)
  case network(description: String)
}

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, WeatherError> {
  let decoder = JSONDecoder()
  decoder.dateDecodingStrategy = .secondsSince1970

  return Just(data)
    .decode(type: T.self, decoder: decoder)
    .mapError { error in
      .parsing(description: error.localizedDescription)
    }
    .eraseToAnyPublisher()
}
