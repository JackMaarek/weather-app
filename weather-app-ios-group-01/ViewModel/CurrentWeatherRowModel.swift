//
//  CurrentWeatherRowModel.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 09/09/2021.
//

import Foundation
import SwiftUI

struct CurrentWeatherRowModel: Identifiable {
    private let item: WeatherAPIResponse
    private let dateTime: Date

    init(item: WeatherAPIResponse) {
        self.item = item
        dateTime = Date(timeIntervalSince1970: TimeInterval(item.current.dt))
    }

    var id: String {
        return timezone + day
    }

    var timezone: String {
        return item.timezone
    }

    var day: String {
        return dayFormatter.string(from: dateTime)
    }

    var month: String {
        return monthFormatter.string(from: dateTime)
    }

    var temperature: String {
        return String(format: "%.1f", item.current.temp)
    }

    var feelsLike: String {
        return String(format: "%.1f", item.current.feelsLike)
    }

    var icon: String {
        guard let icon = item.current.weather.first?.main else { return "" }
        return iconMapper[icon] ?? "weather-clear"
    }

    var fullDescription: String {
        guard let description = item.current.weather.first?.weatherDescription else { return "" }
        return description
    }
}
