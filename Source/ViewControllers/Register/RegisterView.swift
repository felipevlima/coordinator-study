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
    let nameLabel = LabelDefault(text: "Nome", font: UIFont.systemFont(ofSize: 15, weight: .bold), textColor: .darkGray, textAlignment: .left)
    let birthDateLabel = LabelDefault(text: "Data de nascimento", font: UIFont.systemFont(ofSize: 15, weight: .bold), textColor: .darkGray, textAlignment: .left)
    let nameTextField = TextFieldDefault(placeholder: "Digite seu nome completo", keyboardType: .alphabet)
    let birthDateTextField = TextFieldDefault(placeholder: "DD/MM/AAAA", keyboardType: .numberPad)
    let buttonRegister = ButtonDefault(title: "Continuar", titleColor: .white, backgroundColor: .orangeExtra)
    let backButton = LabelDefault(text: "Voltar", font: UIFont.systemFont(ofSize: 16, weight: .bold), textColor: .orangeExtra, textAlignment: .left)
    
    private let chevronLeft: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.left")?.withTintColor(.orangeExtra, renderingMode: .alwaysOriginal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
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
        setName()
        setBirthDate()
        setRegisterButton()
        setBackButton()
    }
    
    private func setBackButton() {
        self.addSubview(chevronLeft)
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(buttonLoginTap))
        self.chevronLeft.isUserInteractionEnabled = true
        self.chevronLeft.addGestureRecognizer(labelTap)
        
        NSLayoutConstraint.activate([
            chevronLeft.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            chevronLeft.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
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
    
    private func setName() {
        self.addSubview(nameLabel)
        self.addSubview(nameTextField)
        
        nameTextField.addTarget(self, action: #selector(nameTextFieldDidChange), for: .editingChanged)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: secondDescriptionText.bottomAnchor, constant: 20),
            nameLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            nameLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            nameTextField.leftAnchor.constraint(equalTo: nameLabel.leftAnchor),
            nameTextField.rightAnchor.constraint(equalTo: nameLabel.rightAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func setBirthDate() {
        self.addSubview(birthDateLabel)
        self.addSubview(birthDateTextField)

        birthDateTextField.addTarget(self, action: #selector(birthDateTextFieldDidChange), for: .editingChanged)
        
        NSLayoutConstraint.activate([
            birthDateLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 30),
            birthDateLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            birthDateLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            birthDateTextField.topAnchor.constraint(equalTo: birthDateLabel.bottomAnchor, constant: 6),
            birthDateTextField.leftAnchor.constraint(equalTo: birthDateLabel.leftAnchor),
            birthDateTextField.rightAnchor.constraint(equalTo: birthDateLabel.rightAnchor),
            birthDateTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
    }

    private func setRegisterButton() {
        self.addSubview(buttonRegister)
        
        buttonRegister.isEnabled = false
        buttonRegister.backgroundColor = .lightGray
        
        buttonRegister.addTarget(self, action: #selector(pressRegister), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonRegister.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            buttonRegister.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            buttonRegister.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            buttonRegister.heightAnchor.constraint(equalToConstant: 45)
        ])
   
    }
    
    @objc func nameTextFieldDidChange() {
        isAllFildsValid()
    }
    
    @objc func birthDateTextFieldDidChange() {
        isAllFildsValid()
    }
    
    @objc func isAllFildsValid() {
        guard let name = nameTextField.text, let birthDate = birthDateTextField.text, !name.isEmpty && !birthDate.isEmpty else {
            buttonRegister.backgroundColor = .lightGray
            buttonRegister.isEnabled = false
            return
        }
        
        buttonRegister.backgroundColor = .orangeExtra
        buttonRegister.isEnabled = true
    }
    
    @objc
    private func buttonLoginTap() {
        self.onLoginTap?()
    }
    
    @objc
    private func pressRegister() {
        print("Registrou")
    }
    
}
