//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by catalina lozano on 29/08/23.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack(spacing: 20){
            VStack{
                Text("Welcome to the weather App")
                    .bold()
                    .font(.title)
                Text("Please share your current location to get the weather in your area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //.background(Color(hue: 0.696, saturation: 0.949, brightness: 0.576))
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
