//
//  CardView.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 03/09/2021.
//

import SwiftUI

struct HeaderCardView: View {
    var viewModel: CurrentWeatherRowModel
    @State private var isAnimating = false
    
    init(viewModel: CurrentWeatherRowModel) {
      self.viewModel = viewModel
    }
    
    init(_ viewModel: CurrentWeatherRowModel) {
      self.viewModel = viewModel
    }
    
    var foreverAnimation: Animation {
        Animation.linear(duration: 2.0)
            .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        Group{
            VStack(alignment: .leading) {
                Text(viewModel.timezone)
                    .font(.headline)
                    .foregroundColor(Color.black)
                HStack {
                    Image("weather-clear")
                        .colorInvert()
                        .rotationEffect(Angle(degrees: self.isAnimating ? 360 : 0.0))
                        .animation(self.isAnimating ? foreverAnimation : .default)
                        .onAppear { self.isAnimating = true }
                    Text("\(viewModel.temperature)°")
                        .foregroundColor(.black)
                        
                    Spacer()
                    VStack(alignment: .leading) {
                        
                        Text(viewModel.fullDescription)
                            .foregroundColor(.black)
                            .font(.system(size: 14))
                        
                        Text("Ressenti \(viewModel.feelsLike)°")
                            .foregroundColor(.black)
                            .font(.system(size: 14))
                    }
                }
                Spacer()
                HStack {
                    HStack {
                        Text(Date(), style: .date)
                            .foregroundColor(.black)
                    }
                    Spacer()
                }
                .font(.caption)
            }
            .padding()
            .shadow(radius: 5)
        }
    }
}

