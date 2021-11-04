//
//  MainVC.swift
//  weather
//
//  Created by Rodrigo Torres on 01/11/2021.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var labelTest: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        invoke()
    }

}


//MARK: - API CALL
extension MainVC: GetWeatherUseCase {
    
    func invoke() {
        GetWeatherUseCaseImp.shared.invoke(lat: "-29,41105", lon: "-66.85067")
    }
    
    
}

