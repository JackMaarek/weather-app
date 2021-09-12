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
            Text(viewModel.id)
                .font(.headline)
            Image(systemName: "drop")
                .foregroundColor(.blue)
            Text("°")
            Image("weather-clear")
            Text(viewModel.temperature + "°")
                .bold()
        }
    }
}

