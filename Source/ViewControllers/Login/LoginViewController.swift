//
//  LoginViewController.swift
//  MeusGastos
//
//  Created by Felipe Vieira Lima on 14/11/22.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {
    lazy var loginView: LoginView = {
        let view = LoginView()
        view.backgroundColor = .white
        
        return view
    }()
    
    override func loadView() {
        self.view = loginView
    }
}
