//
//  DetailViewCell.swift
//  DeezerApp
//
//  Created by emre usul on 9.05.2023.
//

import UIKit
import CryptoKit
import AVFoundation

class DetailViewCell: UICollectionViewCell {
    
    var player: AVPlayer?
    
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
        label.textColor = .white
        return label
    }()
    
    private let minuteLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .white
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
        
        contentView.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        
    }
    
    required init(coder:NSCoder) {
        fatalError()
    }
    
    public func configureCell(name: String, image: String, duration: Int) {
        label.text = name
        cellImageView.kf.setImage(with: URL(string: image))
        
        minuteLabel.text = String(format: "\(duration / 60):%02d", duration % 60)
    }
    
    public func playSound(preview: String) {
        MusicPlayer.shared.playMusic(preview)
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


