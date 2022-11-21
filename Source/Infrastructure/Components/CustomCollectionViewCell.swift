//
//  CustomCollectionViewCell.swift
//  MeusGastos
//
//  Created by Felipe Lima on 20/11/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "creditcard")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.text = "Cartão"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear

        contentView.addSubview(myLabel)
        contentView.addSubview(myImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            myImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            myImageView.heightAnchor.constraint(equalToConstant: 36.0),
            myImageView.widthAnchor.constraint(equalToConstant: 40.0),
            myLabel.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 20),
            myLabel.centerXAnchor.constraint(equalTo: myImageView.centerXAnchor)
        ])
//        myImageView.frame = CGRect(x: 5, y: 0, width: 48, height: 48)
//        myImageView.backgroundColor = .green
    }
    
    public func configure(label: String, iconName: String) {
        myLabel.text = label
        myImageView.image = UIImage(systemName: iconName)?.withTintColor(.orange, renderingMode: .alwaysOriginal)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        myLabel.text = nil
        myImageView.image = nil
    }
    
}
