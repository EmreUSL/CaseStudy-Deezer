//
//  HeaderView.swift
//  DeezerApp
//
//  Created by emre usul on 9.05.2023.
//

import UIKit
import Kingfisher

class HeaderView: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 9
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = self.frame
    }
    
    public func configureHeader(imageURL: String?) {
        guard let url = imageURL else {
            return
        }
        imageView.kf.setImage(with: URL(string: url))
    }
}
