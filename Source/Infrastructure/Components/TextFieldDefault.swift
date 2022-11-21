//
//  TextFieldDefault.swift
//  MeusGastos
//
//  Created by Felipe Vieira Lima on 14/11/22.
//
import Foundation
import UIKit

class TextFieldDefault: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
    
    init (placeholder: String, keyboardType: UIKeyboardType = .default) {
        super.init(frame: .zero)
        initDefault(placeholder: placeholder)
        self.keyboardType = keyboardType
    }
    
    init (placeholder: String, isSecurityText: Bool) {
        super.init(frame: .zero)
        initDefault(placeholder: placeholder)
        self.isSecureTextEntry = isSecurityText
    }
     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(placeholder: String) {
        self.backgroundColor = UIColor(named: "TextFieldBackground")
        self.layer.cornerRadius = 8
//        self.placeholder = placeholder
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        self.translatesAutoresizingMaskIntoConstraints = false
        self.autocapitalizationType = .none
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
