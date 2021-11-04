//
//  GetWeatherUseCase.swift
//  weather
//
//  Created by Rodrigo Torres on 03/11/2021.
//

import Foundation
import PromiseKit

protocol GetWeatherUseCase {
    func invoke()
}

class GetWeatherUseCaseImp {
    
    static let shared = GetWeatherUseCaseImp()
    
    func invoke(lat: String, lon: String) {
        let paramsLocation = ["lat" : lat, "lon": lon]
        firstly {
            APIManager.shared.fetchDataWeather(params: paramsLocation)
        } .done { data in
            print(data)
        }.catch { error in
            print("Error: \(error.localizedDescription)")
        }
    }
}
