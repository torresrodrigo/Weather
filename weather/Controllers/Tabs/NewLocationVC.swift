//
//  NewLocationVC.swift
//  weather
//
//  Created by Rodrigo Torres on 03/11/2021.
//

import UIKit
import MapKit

protocol NewLocationDelegate {
    func didTapPlace(coordinate:CLLocationCoordinate2D, nameCity: String)
}

class NewLocationVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var locationTableView: UITableView!
    var searchCompleter = MKLocalSearchCompleter()
    var searchResults = [MKLocalSearchCompletion]()
    var delegate: NewLocationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupTableView()
    }
    
    func setupUI() {
        title = "Type City"
        searchBar.becomeFirstResponder()
        searchBar.showsCancelButton = true
        searchBar.tintColor = .black
    }
    
}

extension NewLocationVC: MKLocalSearchCompleterDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //searchCompleter.region = MKCoordinateRegion(.world)
        //searchCompleter.pointOfInterestFilter = MKPointOfInterestFilter.excludingAll
        searchCompleter.resultTypes = .query
        searchCompleter.queryFragment = searchText
    }
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResults = completer.results
        locationTableView.reloadData()
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    @objc func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:    #selector(NewLocationVC.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


extension NewLocationVC: UISearchBarDelegate {
    
    func setupSearchBar() {
        searchBar.delegate = self
        searchCompleter.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}

extension NewLocationVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        locationTableView.delegate = self
        locationTableView.dataSource = self
        locationTableView.isScrollEnabled = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchData = searchResults[indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.selectionStyle = .none
        cell.textLabel?.text = "\(searchData.title)"
        cell.detailTextLabel?.text = "\(searchData.subtitle)"
        cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 18)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let result = searchResults[indexPath.row]
        let searchRequest = MKLocalSearch.Request(completion: result)
        
        let search = MKLocalSearch(request: searchRequest)
        search.start { [self] response, error in
            guard let coordinate = response?.mapItems[0].placemark.coordinate else {
                return
            }
            
            guard let name = response?.mapItems[0].name else {
                return
            }            
            delegate?.didTapPlace(coordinate: coordinate, nameCity: name)
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}

