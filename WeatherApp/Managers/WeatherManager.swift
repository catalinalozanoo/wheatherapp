//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by catalina lozano on 29/08/23.
//

import Foundation
import CoreLocation

class WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/weather?lat=19.4859761&lon=-99.1520011&appid=fbe8c3c816a2c657ce8d858114e3b8dc") else { fatalError("Missing URL")}
        
        
        /*URL(string:"https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=fbe8c3c816a2c657ce8d858114e3b8dc&units=metric") else { fatalError("Missing URL")}*/
        
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        return decodedData
    }
}

struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var base: String
    var main: MainResponse
    //var visibility: Int
    var wind: WindResponse
    
    var clouds: Clouds
    var dt: Int
    var sys: Sys
    var timezone, id: Int
    var name: String
    var cod: Int
    
    
    // MARK: - Clouds
    struct Clouds: Decodable {
        var all: Int
    }
    
    // MARK: - Coord
    struct CoordinatesResponse: Decodable {
        var lon, lat: Double
    }
    
    // MARK: - Main
    struct MainResponse: Decodable {
        var temp: Double
        var pressure, humidity: Int
    }
    
    // MARK: - Sys
    struct Sys: Codable {
        var type, id: Int
        var country: String
        var sunrise, sunset: Int
    }
    
    // MARK: - WeatherElement
    struct WeatherResponse: Decodable {
        var id: Int
        var main, description, icon: String
    }
    
    // MARK: - Wind
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Int
       // var gust: Double
    }
}
