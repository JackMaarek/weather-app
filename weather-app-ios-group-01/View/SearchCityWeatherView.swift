//
//  SearchCityWeatherView.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 12/09/2021.
//

import SwiftUI

struct SearchCityWeatherView: View {
    @State private var searchText: String
    private var cityData: [City] = City.cityData

    init(_: SearchCityViewModel = SearchCityViewModel()) {
        searchText = ""
        cityData = City.cityData
    }

    var body: some View {
        VStack(alignment: .leading) {
            SearchBar(text: $searchText)
            List {
                ForEach(self.cityData.filter {
                    self.searchText.isEmpty ? true : $0.name.lowercased().contains(self.searchText.lowercased())
                }, id: \.self) { city in
                    NavigationLink(destination: DetailView(viewModel: SearchCityViewModel(city: city.name))) {
                        Text(city.name)
                    }
                }
            }
        }
    }
}
