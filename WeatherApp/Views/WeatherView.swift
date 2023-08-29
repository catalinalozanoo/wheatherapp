//
//  WeatherView.swift
//  WeatherApp
//
//  Created by catalina lozano on 29/08/23.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    Text("Today \(Date().formatted(.dateTime.month().hour().minute()))")
                        .fontWeight(.light)
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                VStack{
                    HStack{
                        VStack(spacing: 20){
                           Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        }.frame(width: 100, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.temp.roundDouble()+"G")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()
                        .frame(height: 100)
                    VStack{
                        Image(systemName: "sun.haze.fill")
                             .font(.system(size: 40))
                        
                    }
                    Spacer()
                }.frame(maxWidth: .infinity)
            }
            .padding()
            .foregroundColor(.white)
            .frame(maxWidth:.infinity, alignment: .leading)
            
            VStack{
                Spacer()
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather now")
                        .bold().padding(.bottom)
                    HStack {
                        WeatherRow(logo: "thermometer", name: "humity", value: (weather.main.humidity.formatted()+" %"))
                        Spacer()
                        WeatherRow(logo: "bolt.horizontal", name: "pressure", value: (weather.main.pressure.formatted()))
                        Spacer()
                        WeatherRow(logo: "wind.snow", name: "wind", value: (weather.wind.speed.roundDouble()+" m/seg"))
                    }.frame(width: 370, height: 350)
                }
                    .padding()
                    .padding(.bottom, 20)
                    .foregroundColor(.white)
                    .background(Color(hue: 0.667, saturation: 0.94, brightness: 0.505))
                    .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .preferredColorScheme(.dark)
        .background(Color(hue: 0.667, saturation: 0.94, brightness: 0.505))
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
