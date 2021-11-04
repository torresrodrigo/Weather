//
//  LoginVC.swift
//  weather
//
//  Created by Rodrigo Torres on 02/11/2021.
//

import UIKit
import MaterialComponents


class LoginVC: UIViewController {

    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var signInButton: MDCButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupButtons()
    }
    
    private func setupButtons() {
        signInButton.setTitle("Sign in", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.setBorderWidth(2, for: .normal)
        signInButton.setBorderColor(.white, for: .normal)
        signInButton.setBackgroundColor(.black)
    }

    
    @IBAction func registerButton(_ sender: Any) {
        if let emailTxt = emailTxtField.text, let passwordTxt = passwordTxtField.text {
            LoginService.shared.loginUser(email: emailTxt, password: passwordTxt, controller: self)
        }
    }
    
}

