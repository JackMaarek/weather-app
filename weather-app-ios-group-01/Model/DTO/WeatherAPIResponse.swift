//
//  WeatherAPIResponse.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 03/09/2021.
//

import Foundation

// MARK: - WeatherAPIResponse

struct WeatherAPIResponse: Codable {
    let lat, lon: Double
    let timezone: String
    let current: Current
    let daily: [Daily]

    enum CodingKeys: String, CodingKey {
        case lat, lon
        case timezone
        case current, daily
    }
}

// MARK: - Current

struct Current: Codable {
    let dt, sunrise, sunset: Int
    let temp, feelsLike: Double
    let humidity: Int
    let windSpeed: Double
    let weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case humidity
        case windSpeed = "wind_speed"
        case weather
    }
}

// MARK: - Weather

struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Daily

struct Daily: Codable {
    let dt: Int
    let humidity: Int
    let temp: Temp
    let weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case dt
        case humidity
        case temp
        case weather
    }
}

// MARK: - FeelsLike

struct FeelsLike: Codable {
    let day, night, eve, morn: Double
}

// MARK: - Temp

struct Temp: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}

struct CityAPIResponse: Codable {
    let weather: [Weather]
    let base: String
    let main: Main
    let dt: Int
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Main

struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}
