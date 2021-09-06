//
//  DayWeatherCellView.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 04/09/2021.
//
import SwiftUI

struct DayWeatherCellView: View {
    @State var dayWeatherCell: DayWeatherRow
    var body: some View {
        HStack {
            Text(dayWeatherCell.day)
                .font(.headline)
            Image(systemName: "drop")
                .foregroundColor(.blue)
            Text("\(dayWeatherCell.humidityTemp, specifier: "%.1f")°")
            Image("weather-clear")
            Text("\(dayWeatherCell.temp, specifier: "%.1f")°")
                .bold()
        }
    }
}

struct DayWeatherCellView_Previews: PreviewProvider {
    static var dayWeatherCell = DayWeatherRow.data[0]
    static var previews: some View {
        DayWeatherCellView(dayWeatherCell: dayWeatherCell)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
