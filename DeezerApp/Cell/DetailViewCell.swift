//
//  DetailViewCell.swift
//  DeezerApp
//
//  Created by emre usul on 9.05.2023.
//

import UIKit
import CryptoKit

class DetailViewCell: UICollectionViewCell {
    
    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = UIColor.blue
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let minuteLabel: UILabel = {
        let label = UILabel()
        label.text = "2.35"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    static let identifier = "DetailViewCell"
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cellImageView)
        contentView.addSubview(label)
        contentView.addSubview(button)
        contentView.addSubview(minuteLabel)
        
        addConstraints()
    }
    
    required init(coder:NSCoder) {
        fatalError()
    }
    
    public func configureCell(name: String, image: String) {
        label.text = name
        
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            cellImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellImageView.widthAnchor.constraint(equalToConstant: 120),
            
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 25),
            label.widthAnchor.constraint(equalToConstant: 175),
            
            button.topAnchor.constraint(equalTo: label.topAnchor),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            minuteLabel.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            minuteLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)

        ])
    }
}


