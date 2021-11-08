//
//  APIManager.swift
//  weather
//
//  Created by Rodrigo Torres on 03/11/2021.
//

import Foundation
import Alamofire
import CoreLocation
import PromiseKit
import SwiftyUserDefaults

class APIManager {
    
    static let shared = APIManager()
    
    let appID = "1883a314d8d01d1a39e59853e0b21453"
    var base_url: String {
        return "https://api.openweathermap.org/data/2.5/onecall?&appid=\(appID)&units=metric"
    }
    
    func fetchDataWeather(params: [String : String]) -> Promise<WeatherDTO> {
        AF.request(base_url,
                   method: .get,
                   parameters: params)
            .validate()
            .responseDecodable(WeatherDTO.self)
    }

}
