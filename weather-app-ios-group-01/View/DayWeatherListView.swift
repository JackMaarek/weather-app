//
//  DayWeatherListView.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 03/09/2021.
//
import SwiftUI

struct DayWeatherListView: View {
    var dayWeatherRows: [DayWeatherRowViewModel]
    var body: some View {
        List(dayWeatherRows) { dayWeatherRow in
            DayWeatherCellView(viewModel: dayWeatherRow)
        }
    }

    @ViewBuilder
    static func getDayWeatherListView(with data: @escaping () -> [DayWeatherRowViewModel]) -> DayWeatherListView {
        DayWeatherListView(dayWeatherRows: data())
    }
}
