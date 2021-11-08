//
//  GetSlices.swift
//  weather
//
//  Created by Rodrigo Torres on 02/11/2021.
//

import Foundation
import UIKit

protocol GetSlicesUseCase {
    func invoke() -> [Slices]
}

class GetSlicesUseCaseImp {
    
    static func invoke() -> [Slices] {
        let slices1 = Slices(image: R.image.umbrella()!, text: "Bienvenido a Weather App")
        let slices2 = Slices(image: R.image.weatherRains()!, text: "El clima de tu ciudad en tiempo real")
        let slices3 = Slices(image: R.image.weatherSun()!, text: "Agrega tus ubicaciones")
        return [slices1,slices2,slices3]
    }
    
}
