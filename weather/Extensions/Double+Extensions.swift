//
//  Double+Extensions.swift
//  weather
//
//  Created by Rodrigo Torres on 04/11/2021.
//

import Foundation

extension Double {
    
    func formatterTemp() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16
        let numberFormatted = String(formatter.string(from: number) ?? "")
        return "\(numberFormatted)ºC"
    }
    
}
