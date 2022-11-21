//
//  LoginCoordinator.swift
//  MeusGastos
//
//  Created by Felipe Vieira Lima on 14/11/22.
//

import UIKit

class LoginCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LoginViewController()
        
        viewController.onRegisterTap = {
            self.showRegister()
        }
        
        viewController.onLoginTap = {
            self.showMainView()
        }
        
        self.navigationController.setNeedsStatusBarAppearanceUpdate()

        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func showRegister() {
        let coordinator = RegisterCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
    
    private func showMainView() {
        let coordinator = MainCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
}
