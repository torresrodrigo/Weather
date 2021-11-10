//
//  Weather.swift
//  weather
//
//  Created by Rodrigo Torres on 09/11/2021.
//

import Foundation
import RealmSwift

class Locations: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var latitude: String = ""
    @objc dynamic var longitude: String = ""
}
