//
//  ContentView.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 03/09/2021.
//

import SwiftUI

struct ContentView: View {
    private var service: WeatherServiceManager
    @ObservedObject var weatherViewModel: WeatherViewModel
    
    init(viewModel: WeatherViewModel, service: WeatherServiceManager = WeatherService()) {
        self.service = service
        self.weatherViewModel = WeatherViewModel(service: self.service)
    }
    
    var body: some View {
        NavigationView {
            VStack() {
                Text("WHERETHER ⛅️")
                weatherViewModel.getCurrentWeatherView()
                    .frame(height: 100)
                Divider()
                weatherViewModel.getDailyWeatherListView()
            }.onAppear(perform: weatherViewModel.refresh)
        }
        .navigationBarTitle("Weather ⛅️")
    }
}
