//
//  Buttons.swift
//  weather
//
//  Created by Rodrigo Torres on 08/11/2021.
//

import Foundation
import MaterialComponents
import UIKit

class Buttons {
    
    static let shared = Buttons()
    
    func createFloatingButton(controller: UIViewController) -> MDCFloatingButton {
        let floatingButton = MDCFloatingButton()
        floatingButton.sizeToFit()
        floatingButton.setImage(R.image.locationArrowSolid(), for: .normal)
        floatingButton.setImageTintColor(.red, for: .normal)
        floatingButton.backgroundColor = .blue
        floatingButton.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(floatingButton)
        controller.view.addConstraint(NSLayoutConstraint(item: floatingButton,
                                              attribute: .bottom,
                                              relatedBy: .equal,
                                              toItem: controller.view,
                                              attribute: .bottom,
                                              multiplier: 1.0,
                                              constant: -12))
        controller.view.addConstraint(NSLayoutConstraint(item: floatingButton,
                                              attribute: .trailing,
                                              relatedBy: .equal,
                                              toItem: controller.view,
                                              attribute: .trailing,
                                              multiplier: 1.0,
                                              constant: -12))
        return floatingButton
    }
    
    
}
