//
//  CityViewModel.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 09/09/2021.
//

import Foundation
import SwiftUI

struct CityViewModel: Identifiable {
    private let item: CityAPIResponse
    private let dateTime: Date

    init(item: CityAPIResponse) {
        self.item = item
        dateTime = Date(timeIntervalSince1970: TimeInterval(item.dt))
    }

    var id: String {
        return day + month
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
        return String(format: "%.1f", item.main.temp)
    }

    var feelsLike: String {
        return String(format: "%.1f", item.main.feelsLike)
    }

    var icon: String {
        guard let icon = item.weather.first?.main else { return "" }
        return iconMapper[icon] ?? "weather-clear"
    }

    var fullDescription: String {
        guard let description = item.weather.first?.weatherDescription else { return "" }
        return description
    }
    
}
