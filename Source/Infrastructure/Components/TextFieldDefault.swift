//
//  TextFieldDefault.swift
//  MeusGastos
//
//  Created by Felipe Vieira Lima on 14/11/22.
//
import Foundation
import UIKit

class TextFieldDefault: UITextField {
    init (placeholder: String) {
        super.init(frame: .zero)
        
        initDefault(placeholder: placeholder)
    }
     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(placeholder: String) {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 8
        self.placeholder = placeholder
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
