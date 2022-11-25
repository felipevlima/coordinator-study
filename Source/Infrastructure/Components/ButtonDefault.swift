//
//  ButtonDefault.swift
//  MeusGastos
//
//  Created by Felipe Vieira Lima on 14/11/22.
//

import Foundation
import UIKit

class ButtonDefault: UIButton {
    init(title: String, titleColor: UIColor, backgroundColor: UIColor) {
        super.init(frame: .zero)
        
        initDefault(title: title, titleColor: titleColor, backgroundColor: backgroundColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(title: String, titleColor: UIColor, backgroundColor: UIColor) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        self.backgroundColor = backgroundColor
        self.setTitleColor(titleColor, for: .normal)
        self.layer.cornerRadius = 8
        
    }
}
