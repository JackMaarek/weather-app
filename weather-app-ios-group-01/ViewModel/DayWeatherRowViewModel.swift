//
//  DayWeatherRowViewModel.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 10/09/2021.
//

import Foundation

struct DayWeatherRowViewModel: Identifiable {
    private let item: Daily
    private let dateTime: Date

    init(item: Daily) {
        self.item = item
        dateTime = Date(timeIntervalSince1970: TimeInterval(item.dt))
    }

    var id: String {
        return UUID().uuidString
    }

    var date: String {
        return day + " " + month
    }

    var day: String {
        return dayFormatter.string(from: dateTime)
    }

    var month: String {
        return monthFormatter.string(from: dateTime)
    }

    var temperature: String {
        return String(format: "%.1f", item.temp.day)
    }

    var humidity: String {
        return String(item.humidity)
    }

    var icon: String {
        guard let icon = item.weather.first?.main else { return "" }
        return iconMapper[icon] ?? "weather-cloud"
    }
}
