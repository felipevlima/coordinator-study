//
//  MainCoodinator.swift
//  MeusGastos
//
//  Created by Felipe Lima on 19/11/22.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = MainViewController()
        
        viewController.onSignOutTap = {
            self.signOut()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    // MARK: Functions
    private func signOut() {
        self.navigationController.popToRootViewController(animated: true)
    }
}
