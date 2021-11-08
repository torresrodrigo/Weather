//
//  MainVC.swift
//  weather
//
//  Created by Rodrigo Torres on 01/11/2021.
//

import UIKit
import PromiseKit


class MainVC: UIViewController {

    @IBOutlet weak var labelTest: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var imageWeather: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        invoke()
    }
    
    func setupUI(data: WeatherDTO) {
        locationLabel.isHidden = false
        tempLabel.isHidden = false
        locationLabel.text = data.timezone.newText()?.secondText()?.toClearSpaces()
        tempLabel.text = String(describing: data.current.temp.formatterTemp())
        imageWeather.image = GetWeatherUseCaseImp.shared.getImage(dataImg: data.current.weather[0].main, dataDescription: data.current.weather[0].description)
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


