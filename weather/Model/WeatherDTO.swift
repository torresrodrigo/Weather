//
//  WeatherDTO.swift
//  weather
//
//  Created by Rodrigo Torres on 03/11/2021.
//

import Foundation

struct WeatherDTO: Codable {
    let timezone: String
    let current: Current
}

struct Current: Codable {
    let temp: Double
    let feels_like: Double
    //let humidity: Int
    let wind_speed: Double
    let weather: [WeatherMain]
    /*
    enum CodingsKeys: String, CodingKey {
        case temp
        case feels_like = "feels_like"
        case humidity
        case wind_speed = "wind_speed"
    }
     */
    
}

struct WeatherMain: Codable {
    let main: String
    let description: String
}
