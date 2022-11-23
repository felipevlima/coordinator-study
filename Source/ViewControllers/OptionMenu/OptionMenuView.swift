//
//  OptionMenuView.swift
//  MeusGastos
//
//  Created by Felipe Lima on 22/11/22.
//

import Foundation
import UIKit

class OptionMenuView: UIView {
    var onBackToLogin: (() -> Void)?
    let backToLoginButton = ButtonDefault(title: "Sair", titleColor: .white, backgroundColor: .orangeExtra)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setVisualElements() {
        setBackToLoginButton()
    }
    
    private func setBackToLoginButton() {
        self.addSubview(backToLoginButton)
        
        backToLoginButton.addTarget(self, action: #selector(singoutTap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            backToLoginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            backToLoginButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            backToLoginButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            backToLoginButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    // MARK: FUNCTIONS
    
    @objc
    private func singoutTap() {
        self.onBackToLogin?()
    }
    
}
