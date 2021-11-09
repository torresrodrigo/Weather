//
//  GetWeatherUseCase.swift
//  weather
//
//  Created by Rodrigo Torres on 03/11/2021.
//

import Foundation
import PromiseKit
import UIKit
import CoreLocation

protocol GetWeatherUseCase {
    func invoke()
}

class GetWeatherUseCaseImp {
    
    static let shared = GetWeatherUseCaseImp()
    
    func fetchData() -> Promise<WeatherDTO> {
        
        firstly {
            CLLocationManager.requestLocation()
                .lastValue
                .map{$0.coordinate}
        }.then { return APIManager.shared.fetchDataWeather(params: ["lat": String(describing: $0.latitude), "lon": String(describing: $0.longitude) ])}
        
    }
    
    func fetchDataWithCoordinates(lat: String, lon: String) -> Promise<WeatherDTO> {
        return Promise { seal in
            firstly {
                APIManager.shared.fetchDataWeather(params: ["lat": String(describing: lat), "lon": String(describing: lon)])
            }.done { data in
                seal.fulfill(data)
            }.catch { error in
                seal.reject(error)
            }
            
        }
    }
    
    
    func getImage(dataImg: String?, dataDescription: String?) -> UIImage? {
        switch dataImg {
        case "Clouds":
            switch dataDescription {
            case "few clouds":
                return R.image.weathersClouds()
            case "scattered clouds", "broken clouds", "overcast clouds":
                return R.image.weatherCloud()
            default:
                return nil
            }
        case "Thunderstorm":
            return R.image.weatherThunder()
        case "Drizzle", "Rain":
            return R.image.weatherRains()
        case "Clear":
            return R.image.weatherSun()
        default:
            return nil
        }
    }
    
}
