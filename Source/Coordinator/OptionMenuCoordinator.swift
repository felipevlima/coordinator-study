//
//  OptionMenuCoordinator.swift
//  MeusGastos
//
//  Created by Felipe Lima on 22/11/22.
//

import UIKit

class OptionMenuCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = OptionMenuViewController()
        
        viewController.onSignOutTap = {
            self.signOut()
        }

        
   
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    // MARK: Functions
    private func signOut() {

    }
}
