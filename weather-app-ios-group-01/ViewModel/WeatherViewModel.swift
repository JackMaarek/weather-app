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
    private var dayWeatherRows: [DayWeatherRowViewModel]
    
    init(service: WeatherServiceManager = WeatherService()) {
        self.service = service
        self.dayWeatherRows = [DayWeatherRowViewModel]()
    }
    
    init(_ service: WeatherServiceManager = WeatherService()) {
        self.service = service
        self.dayWeatherRows = [DayWeatherRowViewModel]()
    }
    
    func getCurrentWeatherView() -> some View {
        switch weatherData {
        case .none:
            return AnyView(EmptyView())
        default:
            return AnyView(HeaderCardView(viewModel: CurrentWeatherRowModel(item: weatherData!)))
        }
       
    }
    
    func getDailyWeatherListView() -> some View {
        //guard let dailyList = weatherData?.daily else { return EmptyResultView}
        switch weatherData {
        case .none:
            return AnyView(EmptyView())
        default:
            for daily in weatherData!.daily {
                dayWeatherRows.append(DayWeatherRowViewModel(item: daily))
            }
            
            return AnyView(DayWeatherListView(dayWeatherRows: dayWeatherRows))
        }
    }
    
    func refresh() {
        service.getCurrentForecast(lat: 48.86, long: 2.64){ result in
            switch result {
            case .success(let data):
                print(data)
                self.weatherData = data
            case .failure(let error):
                print(error)
                self.weatherData = nil
            break
            }
        }
    }
}
