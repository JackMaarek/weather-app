//
//  DaysWeatherCell.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 03/09/2021.
//

import SwiftUI

extension DayWeatherRow {
    static var data: [DayWeatherRow] {
        [
            DayWeatherRow(day: "Monday", humidityTemp: 1.3, icon: "weather-rain", temp: 13.1),
            DayWeatherRow(day: "Tuesday", humidityTemp: 2.4, icon: "weather-clear", temp: 25.1),
            DayWeatherRow(day: "Wednesday", humidityTemp: 8.5, icon: "weather-mist", temp: 11.1),
            DayWeatherRow(day: "Monday", humidityTemp: 1.6, icon: "weather-rain", temp: 13.1),
            DayWeatherRow(day: "Tuesday", humidityTemp: 2.6, icon: "weather-clear", temp: 25.1),
            DayWeatherRow(day: "Wednesday", humidityTemp: 8.5, icon: "weather-mist", temp: 11.1),
        ]
    }
}
