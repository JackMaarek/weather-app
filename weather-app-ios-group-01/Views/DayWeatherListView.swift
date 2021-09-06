//
//  DayWeatherListView.swift
//  weather-app-ios-group-01
// 
//  Created by jack Maarek on 03/09/2021.
//
import SwiftUI

struct DayWeatherListView: View {
    @State var dayWeatherCells: [DayWeatherRow]
    var body: some View {
        List {
            ForEach(dayWeatherCells) { dayWeatherCell in
                DayWeatherCellView(dayWeatherCell: dayWeatherCell)
            }
        }
    }
}

struct DayWeatherListView_Previews: PreviewProvider {
    static var previews: some View {
        DayWeatherListView(dayWeatherCells: DayWeatherRow.data)
    }
}
