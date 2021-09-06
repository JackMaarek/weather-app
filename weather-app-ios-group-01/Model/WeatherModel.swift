//
//  WeatherModel.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 06/09/2021.
//

import Foundation

struct DayWeatherRow: Identifiable {
    let id: UUID
    var day: String
    var humidityTemp: Double
    var icon: String
    var temp: Double

    init(id: UUID = UUID(), day: String, humidityTemp: Double, icon: String, temp: Double) {
        self.id = id
        self.day = day
        self.humidityTemp = humidityTemp
        self.icon = icon
        self.temp = temp
    }
}
