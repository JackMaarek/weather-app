//
//  SearchCityWeatherView.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 12/09/2021.
//

import SwiftUI

struct SearchCityWeatherView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            SearchBar(text: $searchText)
            //Text("\($searchText)!")
        }
    }
}

struct SearchCityWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCityWeatherView()
    }
}
