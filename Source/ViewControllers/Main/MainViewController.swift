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
        
        view.openMenu = {
            self.presentateModal()
        }
        
        return view
    }()
    
    override func loadView() {
        self.view = mainView
    }
    
    
    // MARK: Functions
    
    @objc
    private func presentateModal() {
        let optionMenuVc = OptionMenuViewController()
//        let nav = UINavigationController(rootViewController: optionMenuVc)
//
//        nav.modalPresentationStyle = .pageSheet
        
        if let sheet = optionMenuVc.sheetPresentationController {
            sheet.detents = [.medium()]
            
        }
        
        present(optionMenuVc, animated: true, completion: nil)
    }
}
