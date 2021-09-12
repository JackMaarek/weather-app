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

    init(viewModel _: WeatherViewModel, service: WeatherServiceManager = WeatherService()) {
        self.service = service
        weatherViewModel = WeatherViewModel(service: self.service)
    }

    var body: some View {
        NavigationView {
                VStack {
                    Group {
                        HStack{
                            Text("WHERETHER ⛅️")
                                .padding(20)
                            Spacer()
                            NavigationLink(destination: SearchCityWeatherView()) {
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.black)
                                    Text("Search")
                                }
                                .padding(20)
                            }
                        }
                        ZStack{
                            weatherViewModel.getCurrentWeatherView()
                                .frame(height: 100)
                        }
                        weatherViewModel.getDailyWeatherListView()
                    }.onAppear(perform: weatherViewModel.refresh)
                }
            .navigationBarTitle("Weather ⛅️")
            .navigationBarHidden(true)
        }
    }
}
