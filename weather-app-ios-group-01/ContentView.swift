//
//  ContentView.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 03/09/2021.
//

import SwiftUI

struct ContentView: View {
    var headerCardData = HeaderCard.data[0]
    var dayWeatherCellListData = DayWeatherRow.data
    var body: some View {
        NavigationView {
            VStack() {
                Text("WHERETHER ⛅️")
                HeaderCardView(headerCard: headerCardData)
                    .frame(height: 100)
                Divider()
                DayWeatherListView(dayWeatherCells: dayWeatherCellListData)

            }
        }
        .navigationBarTitle("Weather ⛅️")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
