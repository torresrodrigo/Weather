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
    
    func alertLocationSettings(controller: UIViewController) {
        let alert = UIAlertController(title: "Weather App", message: "Se necesita permisos de ubicacion para obtener el clima de tu ubicacion actual ¿Que deseas hacer?", preferredStyle: .alert)
        let goToSettings = UIAlertAction(title: "Ir a Configuracion", style: .default) { action in
            self.goToSettingsAction() }
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel) { action in alert.dismiss(animated: true, completion: nil) }
        alert.addAction(goToSettings)
        alert.addAction(cancel)
        controller.present(alert, animated: true)
    }
    
    func alertLocationNeed(controller: UIViewController) {
        let alert = UIAlertController(title: "Location access is needed to get your current location", message: "Por favor permite el acceso a la ubicacion o cierra la app", preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { action in self.goToSettingsAction()}
        let cancelAction = UIAlertAction(title: "Salir", style: .default, handler: { action in
            exit(1)
        })
        
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        alert.preferredAction = settingsAction
        controller.present(alert, animated: true, completion: nil)
    }
    
}

//MARK: - Functions Alerts
extension Alert {
    
    func goToSettingsAction() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl) { sucess in
                print("Settings opened: \(sucess)")
            }
        }
    }
}



