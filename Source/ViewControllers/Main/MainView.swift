//
//  MainView.swift
//  MeusGastos
//
//  Created by Felipe Lima on 19/11/22.
//

import Foundation
import UIKit

class MainView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: CLOUSURES
    var onBackToLogin: (() -> Void)?
    var openMenu: (() -> Void)?
    
    // MARK: CONSTANTS
    let categoriesTitle = ["Cartão", "Pix", "Transferencia"]
    let categoriesIcon = ["creditcard", "dollarsign.circle", "arrow.left.arrow.right"]
    let widthScreenSize: CGFloat = UIScreen.main.bounds.width
    let heightScreenSize: CGFloat = UIScreen.main.bounds.height
    
    // MARK: ELEMENTS
    let titleLabel = LabelDefault(text: "inter", font: UIFont.systemFont(ofSize: 28, weight: .bold), textColor: .orangeExtra, textAlignment: .left)
    let balanceLabel = LabelDefault(text: "R$ 7.531,59", font: UIFont.systemFont(ofSize: 26, weight: .bold), textColor: .black, textAlignment: .left)
    let showBills = LabelDefault(text: "Ver extrato", font: UIFont.systemFont(ofSize: 14, weight: .bold), textColor: .orangeExtra
                                 , textAlignment: .left)
    let backToLoginButton = ButtonDefault(title: "Sair", titleColor: .white, backgroundColor: .orangeExtra)
    
    private let menuIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "line.3.horizontal")?.withTintColor(.orangeExtra, renderingMode: .alwaysOriginal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let chevronDown: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.compact.down")?.withTintColor(.orangeExtra, renderingMode: .alwaysOriginal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let categoriesView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "TextFieldBackground")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.zPosition = 0
        return view
    }()
    
    var calculateItemSize: CGFloat{
        let itemSize = (widthScreenSize - CGFloat(48) - CGFloat(28)) / CGFloat(3)
        return itemSize
    }
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let widthScreenSize: CGFloat = UIScreen.main.bounds.width
        let itemSize = (widthScreenSize - CGFloat(48) - CGFloat(28)) / CGFloat(3)
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        return cv
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setVisualElements() {
        setTitle()
        setMenuIcon()
        setBalance()
        setShowBills()
        setCollectionView()
        setBackToLoginButton()
        setViewCollection()
        setChevronDown()
    }
    

    private func setMenuIcon() {
        self.addSubview(menuIcon)
        
        let menuTap = UITapGestureRecognizer(target: self, action: #selector(openMenuClick))
        self.menuIcon.isUserInteractionEnabled = true
        self.menuIcon.addGestureRecognizer(menuTap)
        
        NSLayoutConstraint.activate([
            menuIcon.widthAnchor.constraint(equalToConstant: 32.0),
            menuIcon.heightAnchor.constraint(equalToConstant: 32.0),
            menuIcon.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            menuIcon.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24)
        ])
    }
    private func setTitle() {
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24)
        ])
    }
    
    private func setBalance() {
        self.addSubview(balanceLabel)
        
        NSLayoutConstraint.activate([
            balanceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            balanceLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            balanceLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24)
            
        ])
    }
    
    private func setShowBills() {
        self.addSubview(showBills)
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(goToBalance))
        self.showBills.isUserInteractionEnabled = true
        self.showBills.addGestureRecognizer(labelTap)
        
        NSLayoutConstraint.activate([
            showBills.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 20),
            showBills.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24)
        ])
    }
    
    private func setCollectionView() {
        self.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.layer.zPosition = 1
        collectionView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: showBills.bottomAnchor, constant: 24),
            collectionView.heightAnchor.constraint(equalToConstant: calculateItemSize),
            collectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            collectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24)
        ])
    }
    
    private func setViewCollection() {
        self.addSubview(categoriesView)
        
        NSLayoutConstraint.activate([
            categoriesView.topAnchor.constraint(equalTo: showBills.bottomAnchor, constant: 40),
            categoriesView.heightAnchor.constraint(equalToConstant: calculateItemSize+16),
            categoriesView.leftAnchor.constraint(equalTo: self.leftAnchor),
            categoriesView.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
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
    
    private func setChevronDown() {
        categoriesView.addSubview(chevronDown)

        NSLayoutConstraint.activate([
            chevronDown.heightAnchor.constraint(equalToConstant: 36.0),
            chevronDown.widthAnchor.constraint(equalToConstant: 40.0),
            chevronDown.bottomAnchor.constraint(equalTo: categoriesView.bottomAnchor, constant: 0),
            chevronDown.centerXAnchor.constraint(equalTo: categoriesView.centerXAnchor)
        ])
    }
    
    // MARK: FUNCTIONS
    @objc
    private func singoutTap() {
        self.onBackToLogin?()
    }
    
    @objc
    private func goToBalance() {
        print("Show balance function")
    }
    
    @objc
    private func openMenuClick() {
        self.openMenu?()
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        cell.contentView.backgroundColor = .white
        cell.contentView.layer.borderWidth = 0.5
        cell.contentView.layer.cornerRadius = 8
        cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
        cell.configure(label: categoriesTitle[indexPath[1]], iconName: categoriesIcon[indexPath[1]])
        return cell
    }
    
}
