//
//  LoginService.swift
//  weather
//
//  Created by Rodrigo Torres on 03/11/2021.
//

import Foundation
import FirebaseAuth
import RealmSwift
import UIKit

class LoginService {
    
    static let shared = LoginService()
    let firebaseAuth = Auth.auth()
    
    func loginUser(email: String, password: String, controller: UIViewController) {
        firebaseAuth.signIn(withEmail: email, password: password) { result, error in
            if error == nil {
                let mainTab = UIStoryboard.main.instantiate() as MainTab
                mainTab.modalPresentationStyle = .fullScreen
                mainTab.modalTransitionStyle = .crossDissolve
                controller.present(mainTab, animated: true)
            } else {
                self.firebaseAuth.createUser(withEmail: email, password: password) { result, error in
                    if error == nil {
                        Alert.shared.alertAccount(controller: controller)
                    } else {
                        Alert.shared.alertErrorAccount(controller: controller)
                    }
                }
            }
        }
    }
    
    
}
