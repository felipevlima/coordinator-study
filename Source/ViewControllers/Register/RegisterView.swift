//
//  RegisterView.swift
//  MeusGastos
//
//  Created by Felipe Lima on 15/11/22.
//

import UIKit

class RegisterView: UIView {
    // MARK: CLOUSURES
    var onLoginTap: (() -> Void)?
    
    // MARK: ELEMENTS
    let titleLabel = LabelDefault(text: "Boas-vindas!", font: UIFont.systemFont(ofSize: 18, weight: .semibold), textColor: .black, textAlignment: .center)
    let descriptionText = LabelDefault(text: "Para começar, informe pra gente seu nome e sua data de nascimento.", font: UIFont.systemFont(ofSize: 15), textColor: .gray, textAlignment: .left)
    let secondDescriptionText = LabelDefault(text: "Caso esteja abrindo uma conta para uma pessoa menor de idade, preencha com o nome e a data de nascimento da pessoa.", font: UIFont.systemFont(ofSize: 15), textColor: .gray, textAlignment: .left)
    let emailLabel = LabelDefault(text: "Nome")
    let passwordLabel = LabelDefault(text: "Data de nascimento")
    let emailTextField = TextFieldDefault(placeholder: "Digite seu nome completo", keyboardType: .alphabet)
    let passwordTextField = TextFieldDefault(placeholder: "DD/MM/AAAA", keyboardType: .numberPad)
    let buttonRegister = ButtonDefault(title: "Registrar usuário", titleColor: .white, backgroundColor: .orange)
    let backButton = LabelDefault(text: "Voltar", font: UIFont.systemFont(ofSize: 16, weight: .bold), textColor: .orange, textAlignment: .left)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setElementsVisual()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setElementsVisual() {
        setTitle()
        setDescription()
        setSecondDescription()
        setEmail()
        setPassword()
        setRegisterButton()
        setBackButton()
    }
    
    private func setBackButton() {
        self.addSubview(backButton)
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(buttonLoginTap))
        self.backButton.isUserInteractionEnabled = true
        self.backButton.addGestureRecognizer(labelTap)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            backButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            backButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24)
        ])
    }
    
    private func setTitle() {
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
        ])
    }
    
    private func setDescription() {
        self.addSubview(descriptionText)
        descriptionText.numberOfLines = 2
        NSLayoutConstraint.activate([
            descriptionText.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            descriptionText.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            descriptionText.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
        ])
    }
    
    private func setSecondDescription() {
        self.addSubview(secondDescriptionText)
        secondDescriptionText.numberOfLines = 3
        
        NSLayoutConstraint.activate([
            secondDescriptionText.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 20),
            secondDescriptionText.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            secondDescriptionText.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
        ])
    }
    
    private func setEmail() {
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: secondDescriptionText.bottomAnchor, constant: 20),
            emailLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            emailLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 12),
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
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 12),
            passwordTextField.leftAnchor.constraint(equalTo: passwordLabel.leftAnchor),
            passwordTextField.rightAnchor.constraint(equalTo: passwordLabel.rightAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
    }

    private func setRegisterButton() {
        self.addSubview(buttonRegister)
        
        NSLayoutConstraint.activate([
            buttonRegister.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            buttonRegister.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            buttonRegister.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            buttonRegister.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    @objc
    private func buttonLoginTap() {
        self.onLoginTap?()
    }
    
}
