//
//  WeatherViewModel.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 09/09/2021.
//

import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var weatherData: WeatherAPIResponse?
    @Published var currentWeatherView: HeaderCardView?
    @Published var dailyWeatherListView: DayWeatherListView?

    private var service: WeatherServiceManager

    init(service: WeatherServiceManager = WeatherService()) {
        self.service = service
    }

    init(_ service: WeatherServiceManager = WeatherService()) {
        self.service = service
    }
    
    @ViewBuilder
    func getCurrentWeatherView() -> some View {
        switch weatherData {
        case .none:
            EmptyView()
        default:
            HeaderCardView(viewModel: CurrentWeatherRowModel(item: weatherData!))
        }
    }

    @ViewBuilder
    func getDailyWeatherListView() -> some View {
        // guard let dailyList = weatherData?.daily else { return EmptyResultView}
        switch weatherData {
        case .none:
            EmptyView()
        default:
            DayWeatherListView.getDayWeatherListView {
                return self.weatherData!.daily.map({DayWeatherRowViewModel(item: $0)})
            }
        }
    }

    func refresh() {
        service.getCurrentLocationForecast { result in
            switch result {
            case let .success(data):
                self.weatherData = data
            case .failure:
                self.weatherData = nil
            }
        }
    }
}
