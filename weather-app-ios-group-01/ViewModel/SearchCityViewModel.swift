//
//  SearchCityViewModel.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 13/09/2021.
//

import Foundation
import SwiftUI

class SearchCityViewModel: ObservableObject {
    var city: String
    @Published var cityData: CityAPIResponse?
    @Published var cityDetailsView: CityDetailsView?
    private var service: WeatherServiceManager

    init(_ service: WeatherServiceManager = WeatherService(), city: String = "") {
        self.service = service
        self.city = city
        refresh()
    }

    @ViewBuilder
    func getCityDetailsView() -> some View {
        switch cityData {
        case .none:
            EmptyView()
        default:
            CityDetailsView(viewModel: CityViewModel(item: cityData!))
        }
    }

    func refresh() {
        service.getForecast(city: city) { result in
            switch result {
            case let .success(data):
                self.cityData = data
            case .failure:
                self.cityData = nil
            }
        }
    }
}
