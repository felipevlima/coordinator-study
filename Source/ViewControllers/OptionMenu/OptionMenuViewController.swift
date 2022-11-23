//
//  OptionMenuViewController.swift
//  MeusGastos
//
//  Created by Felipe Lima on 22/11/22.
//

import UIKit

class OptionMenuViewController: ViewControllerDefault {
    var onSignOutTap: (() -> Void)?
    
    lazy var menuView: OptionMenuView = {
        let view = OptionMenuView()
        view.backgroundColor = .white
        
        view.onBackToLogin = {
            self.dismiss(animated: true)
        }
        
        return view
    }()
    
    override func viewDidDisappear(_ animated: Bool) {
        self.onSignOutTap?()
    }
    
    override func loadView() {
        self.view = menuView
    }
}
