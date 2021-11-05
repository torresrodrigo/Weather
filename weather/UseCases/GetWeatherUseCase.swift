//
//  GetWeatherUseCase.swift
//  weather
//
//  Created by Rodrigo Torres on 03/11/2021.
//

import Foundation
import PromiseKit
import UIKit

protocol GetWeatherUseCase {
    func invoke()
}

class GetWeatherUseCaseImp {
    
    static let shared = GetWeatherUseCaseImp()
    
    func fetchData(lat: String, lon: String) -> WeatherDTO? {
        let paramsLocation = ["lat" : lat, "lon": lon]
        var dataWeather: WeatherDTO?
        firstly {
            APIManager.shared.fetchDataWeather(params: paramsLocation)
        } .done { data in
            dataWeather = data
            print(data)
        }.catch { error in
            print("Error: \(error.localizedDescription)")
        }
        return dataWeather
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
/*
extension GetWeatherUseCaseImp: LocationServiceDelegate {
    
    func promptAuthorizationAction() {
        <#code#>
    }
    
    func didAuthorize() {
        <#code#>
    }
    
    
}
*/
