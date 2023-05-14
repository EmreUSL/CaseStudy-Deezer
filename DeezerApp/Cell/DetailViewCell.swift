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
    var track: Tracks?
    var isFavorite: Bool = false
    
    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.6)
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
        button.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
        return button
    }()
    
    @objc func didTapLikeButton() {
        if isFavorite {
            button.setImage(UIImage(systemName: "heart"), for: .normal)
            UserDefaultsManager.shared.favoriteTracks.removeAll(where: {$0 == self.track})
            UserDefaultsManager.shared.saveData()
            self.isFavorite = false
        } else {
            if let track = track {
                UserDefaultsManager.shared.favoriteTracks.append(track)
                UserDefaultsManager.shared.saveData()
                self.isFavorite = true
                button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            }
        }
    }
    
    override func prepareForReuse() {
        button.setImage(UIImage(systemName: "heart"), for: .normal)
    }
    
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
    
    public func configureCell(item: Tracks, image: String) {
        if let name = item.title , let duration = item.duration {
            self.track = item
            label.text = name
            minuteLabel.text = String(format: "\(duration / 60):%02d", duration % 60)
            
            
            if UserDefaultsManager.shared.favoriteTracks.contains(where: {$0 == self.track}) {
                self.isFavorite = true
                button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            }
        }
        cellImageView.kf.setImage(with: URL(string: image))
        
        /* Bana verilen APİ'lerden şarkıların resim verilerine erişemedim.
         Eğer bu resimlere erişmek istersem , albüm sayısı kadar istek atmam gerekiyor
         Bu durum işleyiş açısından çok yanlış bir davranış oluyordu.
         */
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


