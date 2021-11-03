//
//  UIViewController+Extensions.swift
//  weather
//
//  Created by Rodrigo Torres on 02/11/2021.
//

import Foundation
import UIKit

extension UIViewController {
    func presentVC(controller: UIViewController) {
        let navigation = UINavigationController(rootViewController: controller)
        navigation.modalPresentationStyle = .fullScreen
        present(navigation, animated: true)
    }
}

