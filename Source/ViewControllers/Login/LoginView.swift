//
//  LoginView.swift
//  MeusGastos
//
//  Created by Felipe Vieira Lima on 14/11/22.
//

import UIKit

class LoginView: UIView {
    // MARK: Clousures
    var onRegisterTap: (() -> Void)?
    var onLoginTap: (() -> Void)?
    
    // MARK: Elements Visual
    let titleLabel = LabelDefault(text: "Inter", font: UIFont.systemFont(ofSize: 45, weight: .bold), textColor: .orange, textAlignment: .center)
    let emailLabel = LabelDefault(text: "Email", font: UIFont.systemFont(ofSize: 15, weight: .bold), textColor: .darkGray, textAlignment: .left)
    let passwordLabel = LabelDefault(text: "Senha", font: UIFont.systemFont(ofSize: 15, weight: .bold), textColor: .darkGray, textAlignment: .left)
    
    let emailTextField = TextFieldDefault(placeholder: "Email", keyboardType: .emailAddress)
    let passwordTextField = TextFieldDefault(placeholder: "Senha", isSecurityText: true)
    
    let buttonLogin = ButtonDefault(title: "Entrar", titleColor: .white, backgroundColor: .orange)
    let forgotPasswordButton = ButtonDefault(title: "Esqueci minha senha", titleColor: .orange, backgroundColor: .white)
    let registerLabel = LabelDefault(text: "Trocar ou abrir conta", font: UIFont.systemFont(ofSize: 16, weight: .bold), textColor: .orange, textAlignment: .right)
    
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark.shield")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let iSafeLabel = LabelDefault(text: "iSafe", font: UIFont.systemFont(ofSize: 16, weight: .bold), textColor: .orange, textAlignment: .left)
    
    // MARK: Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        setElementsVisual()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setElementsVisual() {
        setTitle()
        setEmail()
        setPassword()
        setButton()
        setForgotPasswordButton()
        setRegisterButton()
        setISafeLabel()
//        setImageView()
    }
    
    private func setTitle() {
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 140),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
        ])
    }
    
    private func setEmail() {
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 80),
            emailLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            emailLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 6),
            emailTextField.leftAnchor.constraint(equalTo: emailLabel.leftAnchor),
            emailTextField.rightAnchor.constraint(equalTo: emailLabel.rightAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func setPassword() {
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            passwordLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            passwordLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 6),
            passwordTextField.leftAnchor.constraint(equalTo: passwordLabel.leftAnchor),
            passwordTextField.rightAnchor.constraint(equalTo: passwordLabel.rightAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
    }

    private func setButton() {
        self.addSubview(buttonLogin)
        
        buttonLogin.addTarget(self, action: #selector(doLoginTap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonLogin.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            buttonLogin.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            buttonLogin.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            buttonLogin.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func setForgotPasswordButton() {
        self.addSubview(forgotPasswordButton)
        
        NSLayoutConstraint.activate([
            forgotPasswordButton.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 10),
            forgotPasswordButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            forgotPasswordButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func setRegisterButton() {
        self.addSubview(registerLabel)
        
        // MARK: Function responsible to make label accept tap event
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(buttonRegisterTap))
        self.registerLabel.isUserInteractionEnabled = true
        self.registerLabel.addGestureRecognizer(labelTap)
        
        NSLayoutConstraint.activate([
            registerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -52),
            registerLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24)
        ])
    }
    
    private func setISafeLabel() {
        self.addSubview(imageView)
        self.addSubview(iSafeLabel)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 24.0),
            imageView.heightAnchor.constraint(equalToConstant: 24.0),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            iSafeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -52),
            iSafeLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 5)
        ])
    }
    
//    private func setImageView() {
//        self.addSubview(imageView)
//
//        NSLayoutConstraint.activate([
//            imageView.widthAnchor.constraint(equalToConstant: 24.0),
//            imageView.heightAnchor.constraint(equalToConstant: 24.0),
//
////            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
////            imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: -24)
//        ])
//    }
    
    @objc
    private func buttonRegisterTap() {
        self.onRegisterTap?()
    }
    
    @objc
    private func doLoginTap() {
        self.onLoginTap?()
    }
}
