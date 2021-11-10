//
//  MainVC.swift
//  weather
//
//  Created by Rodrigo Torres on 01/11/2021.
//

import UIKit
import PromiseKit
import MaterialComponents
import MaterialComponents.MaterialButtons
import GooglePlaces

class MainVC: UIViewController {

    @IBOutlet weak var labelTest: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var imageWeather: UIImageView!
    @IBOutlet weak var button: MDCFloatingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        invoke()
        setupButton()
        setupDelegate()
    }
    
    func setupUI(data: WeatherDTO) {
        locationLabel.isHidden = false
        tempLabel.isHidden = false
        locationLabel.text = data.timezone.newText()?.secondText()?.toClearSpaces()
        tempLabel.text = String(describing: data.current.temp.formatterTemp())
        imageWeather.image = GetWeatherUseCaseImp.shared.getImage(dataImg: data.current.weather[0].main, dataDescription: data.current.weather[0].description)
        setupButton()
        //setButton()
    }
    
    
    func setButton() {
        button.mode = .expanded
        button.setTitle("Agregar", for: .normal)
        button.inkColor = .red
    }
    
    private func setupButton() {
        let button = Buttons.shared.createFloatingButton(controller: self)
        button.addTarget(self, action: #selector(goToLocation), for: .touchUpInside)
    }
    
    @objc func goToLocation() {
        let newLocationVC = Switcher.shared.goToLocation()
        newLocationVC.delegate = self
        self.navigationController?.pushViewController(newLocationVC, animated: true)
    }
    
    
}

//MARK: - API CALL
extension MainVC: GetWeatherUseCase {
    
    func invoke() {
        GetWeatherUseCaseImp.shared.fetchData()
        .done { data in
            self.setupUI(data: data)
        }.catch { error in
            print(error.localizedDescription)
        }
    }

}

//MARK: - NewLocationDelegate
extension MainVC: NewLocationDelegate {
    
    func didTapPlace(coordinate: CLLocationCoordinate2D, nameCity: String) {
        firstly {
            GetWeatherUseCaseImp.shared.fetchDataWithCoordinates(lat: String(describing: coordinate.latitude), lon: String(describing: coordinate.longitude))
        }.done { data in
            self.setupUI(data: data)
        }.catch { error in
            print("\(error.localizedDescription)")
        }
    }
}

extension MainVC: LocationDelegate {
    
    func setupDelegate() {
        let locationVC = self.tabBarController!.viewControllers![1] as! LocationsVC
        locationVC.delegate = self
    }
    
    func didTapCell(latitude: String, longitude: String) {
        firstly {
            GetWeatherUseCaseImp.shared.fetchDataWithCoordinates(lat: latitude, lon: longitude)
        }.done { data in
            self.setupUI(data: data)
        }.catch { error in
            print(error.localizedDescription)
        }
    }
    
    
}


