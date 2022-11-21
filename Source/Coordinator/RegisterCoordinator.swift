//
//  RegisterCoordinator.swift
//  MeusGastos
//
//  Created by Felipe Lima on 15/11/22.
//

import Foundation
import UIKit

class RegisterCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = RegisterViewController()
        
        viewController.onLoginTap = {
            self.showLogin()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func showLogin() {
        self.navigationController.popToRootViewController(animated: true)
    }
}
