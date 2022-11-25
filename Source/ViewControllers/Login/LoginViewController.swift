//
//  LoginViewController.swift
//  MeusGastos
//
//  Created by Felipe Vieira Lima on 14/11/22.
//

import UIKit
import Foundation

class LoginViewController: ViewControllerDefault {
    // MARK: CLOUSURES
    var onRegisterTap: (() -> Void)?
    var onLoginTap: (() -> Void)?

    lazy var loginView: LoginView = {
        let view = LoginView()
        view.backgroundColor = .white
        
        view.onRegisterTap = {
            self.onRegisterTap?()
        }
        
        view.onLoginTap = {
            self.onLoginTap?()
        }
        
        view.errorOnLogin = {
            self.errorAlert()
        }
        
        return view
    }()
    
    override func loadView() {
        self.view = loginView
    }
    
    @objc private func errorAlert() {
        let alert = UIAlertController(title: "Falha no login", message: "Preencha todos os dados para realizar o login!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
