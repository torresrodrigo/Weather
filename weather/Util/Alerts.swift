//
//  Alerts.swift
//  weather
//
//  Created by Rodrigo Torres on 03/11/2021.
//

import Foundation
import UIKit

class Alert {
    static let shared = Alert()
    
    func alertAccount(controller: UIViewController) {
        let alert = UIAlertController(title: "Weather App", message: "No tienes una cuenta registrada ¿Deseas registrarse?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { action in
            alert.dismiss(animated: true, completion: nil)
        }
        let registerAction = UIAlertAction(title: "Registrar", style: .default) { action in
            UserDefaultsManager.shared.setLoggedKey()
            print(UserDefaultsManager.shared.getLoggedKey())
            let mainTab = UIStoryboard.main.instantiate() as MainTab
            mainTab.modalPresentationStyle = .fullScreen
            mainTab.modalTransitionStyle = .crossDissolve
            controller.present(mainTab, animated: true)
        }
        alert.addAction(cancelAction)
        alert.addAction(registerAction)
        controller.present(alert, animated: true, completion: nil)
    }
    
    func alertErrorAccount(controller: UIViewController) {
        let alert = UIAlertController(title: "Weather App", message: "Ha ocurrido un error al intentar iniciar sesion", preferredStyle: .alert)
        let action = UIAlertAction(title: "Siguiente", style: .default) { action in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        controller.present(alert, animated: true, completion: nil)
    }
}
