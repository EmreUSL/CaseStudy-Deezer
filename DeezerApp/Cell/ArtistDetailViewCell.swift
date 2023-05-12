//
//  ArtistDetailViewCell.swift
//  DeezerApp
//
//  Created by emre usul on 9.05.2023.
//

import UIKit
import Kingfisher

class ArtistDetailViewCell: UITableViewCell {
    
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
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
        label.textColor = .white
        label.numberOfLines = 1
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2020"
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    static let identifier = "ArtistDetailViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.white.withAlphaComponent(0.0)
        contentView.addSubview(view)
        view.addSubview(cellImageView)
        view.addSubview(albumLabel)
        view.addSubview(dateLabel)
        applyConstraint()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        cellImageView.image = nil
    }
    
    private func applyConstraint() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            view.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            view.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            cellImageView.topAnchor.constraint(equalTo: view.topAnchor),
            cellImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cellImageView.widthAnchor.constraint(equalToConstant: 100),
            
            albumLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            albumLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 30),
            albumLabel.widthAnchor.constraint(equalToConstant: 200),
            
            dateLabel.leadingAnchor.constraint(equalTo: albumLabel.leadingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            
        ])
    }
    
    public func configureCell(model: Datum) {
        guard let url = model.album?.cover else {
            return
        }
        
        albumLabel.text = model.album?.title
        
        cellImageView.kf.setImage(with: URL(string: url))
    }

}
