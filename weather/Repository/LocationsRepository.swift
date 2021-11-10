//
//  LocationsRepository.swift
//  weather
//
//  Created by Rodrigo Torres on 09/11/2021.
//

import Foundation
import RealmSwift
 
class LocationsRepository {
    
    static let shared = LocationsRepository()
    
    func save(location: Locations) throws {
        let realm = try! Realm()
        try! realm.write{
            realm.add(location)
            print("Added Location")
        }
    }
    
    func delete(name: String) throws {
        let realm = try! Realm()
        let location = realm.objects(Locations.self).filter("name = %@", name).first
        try! realm.write({
            if let data = location {
                realm.delete(data)
            }
        })
    }
    
}
