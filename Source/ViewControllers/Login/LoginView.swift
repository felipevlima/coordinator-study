//
//  LoginView.swift
//  MeusGastos
//
//  Created by Felipe Vieira Lima on 14/11/22.
//

import UIKit

class LoginView: UIView {
    // MARK: Elements Visual
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Inter"
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .orange
        lb.font = UIFont.systemFont(ofSize: 45, weight: .bold)
        lb.textAlignment = .center
        return lb
    }()
    
    let emailLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Email"
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.borderWidth = 1
        tf.backgroundColor = .lightGray
        tf.layer.cornerRadius = 8
        tf.placeholder = "Informe seu email"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let passwordLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Senha"
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.borderWidth = 1
        tf.backgroundColor = .lightGray
        tf.layer.cornerRadius = 8
        tf.placeholder = "Informe sua senha"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let buttonLogin: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Entrar", for: .normal)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        bt.backgroundColor = .orange
        bt.layer.cornerRadius = 8
        return bt
    }()
    
    let buttonRegister: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Registrar", for: .normal)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        bt.setTitleColor(.orange, for: .normal)
        bt.backgroundColor = .white
        bt.layer.cornerRadius = 8
        return bt
    }()
    
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
        setRegisterButton()
    }
    
    private func setTitle() {
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
//            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
        ])
    }
    
    private func setEmail() {
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
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
    
    private func setButton() {
        self.addSubview(buttonLogin)
        
        NSLayoutConstraint.activate([
            buttonLogin.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            buttonLogin.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            buttonLogin.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            buttonLogin.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func setRegisterButton() {
        self.addSubview(buttonRegister)
        
        NSLayoutConstraint.activate([
            buttonRegister.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 30),
            buttonRegister.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            buttonRegister.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            buttonRegister.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
}
