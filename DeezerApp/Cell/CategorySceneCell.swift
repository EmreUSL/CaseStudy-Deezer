//
//  CategorySceneCell.swift
//  DeezerApp
//
//  Created by emre usul on 8.05.2023.
//

import UIKit
import Kingfisher
import SDWebImage

class CategorySceneCell: UICollectionViewCell {
    
    static let cellIdentifier = "categoryCell"
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
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
        ])
    }
    
    public func getImage(_ model: CellModel) {
        guard let url = model.picture else {
            return
        }
        
        imageView.kf.setImage(with: URL(string: url))
    }
}
