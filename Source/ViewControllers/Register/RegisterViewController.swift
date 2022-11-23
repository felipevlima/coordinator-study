//
//  RegisterViewController.swift
//  MeusGastos
//
//  Created by Felipe Lima on 15/11/22.
//

import UIKit

class RegisterViewController: ViewControllerDefault {
    var onLoginTap: (() -> Void)?
    
    lazy var registerView: RegisterView = {
        let view = RegisterView()
        
        view.backgroundColor = .white
        
        view.onLoginTap = {
            self.onLoginTap?()
        }
        return view
        
    }()
    
    override func loadView() {
        self.view = registerView
    }
}
