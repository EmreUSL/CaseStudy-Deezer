//
//  ArtistDetailViewCell.swift
//  DeezerApp
//
//  Created by emre usul on 9.05.2023.
//

import UIKit

class ArtistDetailViewCell: UITableViewCell {
    
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.green
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = UIColor.blue
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    private let albumLabel: UILabel = {
        let label = UILabel()
        label.text = "Seni Seven öldü"
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2020"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    static let identifier = "ArtistDetailViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.systemTeal
        contentView.addSubview(view)
        
        view.addSubview(cellImageView)
        view.addSubview(albumLabel)
        view.addSubview(dateLabel)
        applyConstraint()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraint() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            view.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            view.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            cellImageView.topAnchor.constraint(equalTo: view.topAnchor),
            cellImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cellImageView.widthAnchor.constraint(equalToConstant: 100),
            
            albumLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            albumLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 30),
            
            dateLabel.topAnchor.constraint(equalTo: albumLabel.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: albumLabel.leadingAnchor),
        ])
    }

}
