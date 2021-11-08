//
//  MainTab.swift
//  weather
//
//  Created by Rodrigo Torres on 03/11/2021.
//

import UIKit

class MainTab: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBottomNavBar()
    }

    func setupBottomNavBar() {
        tabBar.barStyle = .black
        tabBar.isTranslucent = false
        tabBar.barTintColor = UIColor(cgColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    }

}
