//
//  MainViewController.swift
//  MeusGastos
//
//  Created by Felipe Lima on 19/11/22.
//
import UIKit
import Foundation

class MainViewController: ViewControllerDefault {
    var onSignOutTap: (() -> Void)?
    
    lazy var mainView: MainView = {
        let view = MainView()
        view.backgroundColor = .white
        
        view.onBackToLogin = {
            self.onSignOutTap?()
        }
        
        return view
    }()
    
    override func loadView() {
        self.view = mainView

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: Functions
}
