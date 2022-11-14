//
//  LabelDefault.swift
//  MeusGastos
//
//  Created by Felipe Vieira Lima on 14/11/22.
//

import Foundation
import UIKit

class LabelDefault: UILabel {
    init (text: String) {
        super.init(frame: .zero)
        
        initDefault(text: text, font: UIFont.systemFont(ofSize: 17, weight: .regular), textColor: .black, textAlignment: .left)
    }
    
    init(text: String, font: UIFont, textColor: UIColor, textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        
        initDefault(text: text, font: font, textColor: textColor, textAlignment: textAlignment)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(text: String, font: UIFont, textColor: UIColor, textAlignment: NSTextAlignment) {
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
    }
}
