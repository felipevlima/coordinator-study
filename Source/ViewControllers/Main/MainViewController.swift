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
        let actionSheet = UIAlertController(title: "O que deseja fazer?", message: "", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Sair", style: .destructive, handler: { _ in
            self.onSignOutTap?()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true)
    }
}
