//
//  ContentView.swift
//  WeatherApp
//
//  Created by catalina lozano on 29/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather{
                    //Text("Weather data fetched!")
                     //   .foregroundColor(.white)
                    WeatherView(weather: weather)
                    
                } else {
                    LoadingView()
                        .task {
                            do{
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
                /*Text("Your coordinates are: \(location.longitude), \(location.latitude)")
                    .foregroundColor(.white)
                    .padding()*/
                   
            } else {
                if locationManager.isLoading{
                    LoadingView()
                } else {
                    WelcomeView()
                         .environmentObject(locationManager)
                         .foregroundColor(.white)
                }
            }
          
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.667, saturation: 0.94, brightness: 0.505))
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
