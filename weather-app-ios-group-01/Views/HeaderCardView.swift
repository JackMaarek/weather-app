//
//  CardView.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 03/09/2021.
//

import SwiftUI

struct HeaderCardView: View {
    @State var headerCard: HeaderCard
    @State private var isAnimating = false
    var foreverAnimation: Animation {
        Animation.linear(duration: 2.0)
            .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        Group{
            VStack(alignment: .leading) {
                Text(headerCard.city)
                    .font(.headline)
                    .foregroundColor(Color.black)
                HStack {
                    Image("weather-clear")
                        .colorInvert()
                        .rotationEffect(Angle(degrees: self.isAnimating ? 360 : 0.0))
                        .animation(self.isAnimating ? foreverAnimation : .default)
                        .onAppear { self.isAnimating = true }
                    Text("\(headerCard.temp, specifier: "%.1f")°")
                        .foregroundColor(.black)
                        
                    Spacer()
                    VStack(alignment: .leading) {
                        
                        Text(headerCard.tempDescription)
                            .foregroundColor(.black)
                            .font(.system(size: 14))
                        
                        Text("Ressenti \(headerCard.feelsLike, specifier: "%.1f")°")
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

struct HeaderCardView_Previews: PreviewProvider {
    static let headerCard = HeaderCard.data[0]
    static var previews: some View {
        HeaderCardView(headerCard: headerCard)
            .padding(.top)
            .environment(\.locale, Locale(identifier: "fr"))
            .previewLayout(.fixed(width: 400, height: 110))
    }
}
