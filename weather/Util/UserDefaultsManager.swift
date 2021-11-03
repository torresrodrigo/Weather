//
//  UserDefaultsManager.swift
//  weather
//
//  Created by Rodrigo Torres on 02/11/2021.
//

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
    var onboardingKey: DefaultsKey<Bool> {.init("onboarding", defaultValue: false)}
    var loginKey: DefaultsKey<Bool> {.init("login", defaultValue: false)}
}

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    func setOnboardingKey() {
        Defaults[\.onboardingKey] = true
    }
    
    func getOnboardingKey() -> Bool {
        return Defaults[\.onboardingKey]
    }
    
    func setLoggedKey() {
        Defaults[\.loginKey] = true
    }
    
    func getLoggedKey() -> Bool {
        return Defaults[\.loginKey]
    }
    
}
