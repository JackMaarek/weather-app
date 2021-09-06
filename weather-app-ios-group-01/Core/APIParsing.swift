////
////  APIParsing.swift
////  weather-app-ios-group-01
////
////  Created by jack Maarek on 05/09/2021.
////
//
//import Foundation
//import Combine
//
//func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, WeatherError> {
//  let decoder = JSONDecoder()
//  decoder.dateDecodingStrategy = .secondsSince1970
//
//  return Just(data)
//    .decode(type: T.self, decoder: decoder)
//    .mapError { error in
//      .parsing(description: error.localizedDescription)
//    }
//    .eraseToAnyPublisher()
//}
