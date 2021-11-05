//
//  LocationService.swift
//  weather
//
//  Created by Rodrigo Torres on 05/11/2021.
//

import Foundation
import CoreLocation

protocol LocationServiceDelegate: AnyObject {
    func promptAuthorizationAction()
    func didAuthorize()
}

class LocationService: NSObject {
    
    weak var delegate: LocationServiceDelegate?
    var locationManager: CLLocationManager!
    var enabled: Bool {
        return CLLocationManager.locationServicesEnabled()
    }
    
    init(locationManager: CLLocationManager = CLLocationManager()) {
        super.init()
        self.locationManager = locationManager
        self.locationManager.delegate = self
    }
    
    func requestAuthorization() {
        locationManager.requestAlwaysAuthorization()
    }
    
    func start() {
        locationManager.startUpdatingLocation()
    }
    
    func stop() {
        locationManager.stopUpdatingLocation()
    }

}

extension LocationService: CLLocationManagerDelegate {
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus
        
        switch status {
        case .denied:
            delegate?.promptAuthorizationAction()
        case .notDetermined:
            print("Not determined")
            locationManager.requestAlwaysAuthorization()
        case .restricted:
            print("Restricted")
        case .authorizedAlways:
            print("Authorized Always")
            delegate?.didAuthorize()
        case .authorizedWhenInUse:
            print("Authrized when in use ")
            delegate?.didAuthorize()
        default:
            print("Unknown")
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            self.locationManager.stopUpdatingLocation()
        }
    }
    
}


