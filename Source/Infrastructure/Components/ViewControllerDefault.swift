//
//  ViewControllerDefault.swift
//  MeusGastos
//
//  Created by Felipe Lima on 15/11/22.
//

import Foundation
import UIKit

class ViewControllerDefault: UIViewController {
    var afterHideKeyboard: (() -> Void)?
    var afterShowKeyboard: ((_ heightKeyboard: CGFloat) -> Void)?
    
    // For navigation controllers
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let _: NSObjectProtocol = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (notification) in
            guard let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
                return
            }
            
            self.afterShowKeyboard?(value.cgRectValue.height)
        }
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboardByTappingOutside))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc
    func hideKeyboardByTappingOutside() {
        self.view.endEditing(true)
        afterHideKeyboard?()
    }
}
