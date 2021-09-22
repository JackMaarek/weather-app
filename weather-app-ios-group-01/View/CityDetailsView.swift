//
//  CityDetailsView.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 13/09/2021.
//

import SwiftUI

struct CityDetailsView: View {
    var viewModel: CityViewModel
    
    init(viewModel: CityViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            Text(viewModel.date)
                .font(.headline)
            Spacer()
            Image(systemName: "drop")
                .foregroundColor(.blue)
                .scaledToFit()
            Text(viewModel.feelsLike + "°C")
            Text(viewModel.temperature + "°C")
                .bold()
            Image(viewModel.icon)
                .scaledToFill()
        }
    }
}
