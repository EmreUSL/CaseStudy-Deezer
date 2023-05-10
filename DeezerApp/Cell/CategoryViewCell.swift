//
//  CategorySceneCell.swift
//  DeezerApp
//
//  Created by emre usul on 8.05.2023.
//

import UIKit
import Kingfisher
import SDWebImage

class CategoryViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "categoryCell"
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = .boldSystemFont(ofSize: 20)
        label.backgroundColor = UIColor.darkGray.withAlphaComponent(0.4)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        addConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -30),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    public func getImage(_ model: CellModel) {
        guard let url = model.picture else {
            return
        }
        
        label.text = model.name
        imageView.kf.setImage(with: URL(string: url))
    }
}
