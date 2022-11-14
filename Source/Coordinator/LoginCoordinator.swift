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
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
