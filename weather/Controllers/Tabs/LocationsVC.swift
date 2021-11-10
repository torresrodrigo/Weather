//
//  LocationsVC.swift
//  weather
//
//  Created by Rodrigo Torres on 08/11/2021.
//

import Foundation
import UIKit
import MaterialComponents
import RealmSwift

protocol LocationDelegate {
    func didTapCell(latitude: String, longitude: String)
}

class LocationsVC: UIViewController {
    
    @IBOutlet weak var favoritesLocationTableView: UITableView!
    let realm = try! Realm()
    lazy var locations: Results<Locations> = {self.realm.objects(Locations.self)}()
    var delegate: LocationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        favoritesLocationTableView.reloadData()
    }
    
    
}

extension LocationsVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        favoritesLocationTableView.register(FavoritesCell.nib(), forCellReuseIdentifier: FavoritesCell.identifier)
        favoritesLocationTableView.delegate = self
        favoritesLocationTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoritesLocationTableView.dequeueReusableCell(withIdentifier: FavoritesCell.identifier, for: indexPath) as! FavoritesCell
        cell.delegate = self
        cell.setupCell(data: locations[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected = locations[indexPath.row]
        delegate?.didTapCell(latitude: selected.latitude, longitude: selected.longitude)
        self.tabBarController?.selectedIndex = 0
    }

}

extension LocationsVC: FavoritesCellDelegate {
    
    func delete(name: String) {
        print("Deleted")
        try! LocationsRepository.shared.delete(name: name)
        favoritesLocationTableView.reloadData()
    }

}
