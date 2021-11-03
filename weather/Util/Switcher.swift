//
//  Switcher.swift
//  weather
//
//  Created by Rodrigo Torres on 02/11/2021.
//

import Foundation
import UIKit

class Switcher {
    
    static let shared = Switcher()
    
    func setupInitialView(window: UIWindow) -> UIWindow {
        let onboardingStatus = UserDefaultsManager.shared.getOnboardingKey()
        print(onboardingStatus)
        if onboardingStatus {
            window.rootViewController = LoginVC()
            window.makeKeyAndVisible()
        }
        else {
            window.rootViewController = OnboardingVC()
            window.makeKeyAndVisible()
        }
        //window.makeKeyAndVisible()
        return window
    }
    
}
