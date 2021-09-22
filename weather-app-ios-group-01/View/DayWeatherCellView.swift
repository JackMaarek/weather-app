//
//  DayWeatherCellView.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 04/09/2021.
//
import Foundation
import SwiftUI

struct DayWeatherCellView: View {
    var viewModel: DayWeatherRowViewModel

    init(viewModel: DayWeatherRowViewModel) {
        self.viewModel = viewModel
    }

    init(_ viewModel: DayWeatherRowViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        HStack {
            Image(viewModel.icon)
                .scaledToFill()
                .colorInvert()
            Spacer()
            Text(viewModel.date)
                .font(.headline)
            Spacer()
            Image(systemName: "drop")
                .foregroundColor(.blue)
                .scaledToFit()
            Text(viewModel.humidity + "%")
            Text(viewModel.temperature + "°C")
                .bold()
        }
    }
}
