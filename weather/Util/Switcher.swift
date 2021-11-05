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
        let loggedStatus = UserDefaultsManager.shared.getLoggedKey()
        
        if onboardingStatus == false && loggedStatus == false {
            window.rootViewController = OnboardingVC()
        } else if onboardingStatus == true && loggedStatus == false  {
            window.rootViewController = LoginVC()
        } else {
            window.rootViewController = goToMainVC()
        }
        
        window.makeKeyAndVisible()
        return window
    }
    
    func goToMainVC() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarController = storyboard.instantiateViewController(withIdentifier: "MainTab") as! MainTab
        return tabBarController
    }
    
}
