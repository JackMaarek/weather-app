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

    init(viewModel _: WeatherViewModel, _ service: WeatherServiceManager = WeatherService()) {
        self.service = service
        weatherViewModel = WeatherViewModel(service: self.service)
    }

    var body: some View {
        NavigationView {
            VStack {
                Group {
                    HStack {
                        Text("WHERETHER ⛅️")
                            .padding(20)
                        Spacer()
                        HStack {
                            NavigationLink(destination: SearchCityWeatherView()) {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.black)
                                Text("Search")
                            }
                        }
                        .padding(20)
                    }
                    ZStack {
                        weatherViewModel.getCurrentWeatherView()
                            .frame(height: 100)
                            .foregroundColor(Color.purple)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .circular))
                    }
                    weatherViewModel.getDailyWeatherListView()
                }.onAppear(perform: weatherViewModel.refresh)
            }
            .navigationBarTitle("Weather ⛅️")
            .navigationBarHidden(true)
        }
    }
}
