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
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 7
        imageView.backgroundColor = UIColor.red
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 0, y: 20, width: 500, height: 200)
    }
    
    public func configureHeader(imageURL: String?) {
        guard let url = imageURL else {
            return
        }
        imageView.kf.setImage(with: URL(string: url))
    }
}
