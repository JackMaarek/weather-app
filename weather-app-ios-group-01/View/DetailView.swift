//
//  DetailView.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 23/09/2021.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: SearchCityViewModel
    init(viewModel: SearchCityViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        viewModel.getCityDetailsView()
            .onAppear(perform: viewModel.refresh)
    }
}
