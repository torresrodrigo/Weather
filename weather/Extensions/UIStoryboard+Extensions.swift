//
//  UIStoryboard+Extensions.swift
//  weather
//
//  Created by Rodrigo Torres on 03/11/2021.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    func instantiate<T>() -> T {
        return instantiateViewController(withIdentifier: String(describing: T.self)) as! T
    }

    static let main = UIStoryboard(name: "Main", bundle: nil)
}
