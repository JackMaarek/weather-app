//
//  Cities.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 13/09/2021.
//

import Foundation

struct City: Hashable {
    var name: String
}

extension City {
    static var cityData: [City] {
        [
            City(name: "Paris"),
            City(name: "New York"),
            City(name: "Morocco"),
            City(name: "Barcelone"),
            City(name: "Rome"),
            City(name: "Bucharest"),
            City(name: "Vienna"),
            City(name: "Munich"),
            City(name: "Brussels"),
            City(name: "Amsterdam"),
            City(name: "Dublin"),
            City(name: "Porto Vecchio"),
        ]
    }
}
