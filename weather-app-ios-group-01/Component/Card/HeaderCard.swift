//
//  HeaderCard.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 03/09/2021.
//

import SwiftUI

struct HeaderCard {
    var city: String
    var date: Date
    var temp: Double
    var tempDescription: String
    var feelsLike: Double
    var bgColor: Color
}

extension HeaderCard {
    static var data: [HeaderCard] {
        [
            HeaderCard(city: "Paris", date: Date(timeIntervalSinceNow: 0), temp: 27, tempDescription: "Ensoleillé", feelsLike: 28, bgColor: Color(UIColor.red)),
        ]
    }
}
