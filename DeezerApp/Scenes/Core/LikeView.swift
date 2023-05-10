//
//  LikeScene.swift
//  DeezerApp
//
//  Created by emre usul on 8.05.2023.
//

import UIKit
import AVFoundation


final class LikeView: UIViewController {

    private var collectionView: UICollectionView!
    var cellModel: [Tracks] = []
    
    var player: AVAudioPlayer?
    
    var page: Page = .like
    var id: Int = 0
    var viewTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.insertSublayer(Background.shared.gradientLayer(view), at:0)
        configureUI()
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if self.page == .like {
            title = "Follow List"
        } else {
            getTrack()
        }
    }
    
    func configureUI() {
        title = viewTitle
        view.backgroundColor = UIColor.red
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DetailViewCell.self, forCellWithReuseIdentifier: DetailViewCell.identifier)
        collectionView.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func getTrack() {
        ServiceManager.shared.getTrack(url: NetworkHelper.shared.getTrack(id: id)) { result in
            switch result {
            case .success(let result):
                self.cellModel = result
                self.reloadCollectionView()
                self.configureUI()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension LikeView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if page == .like {
            return 2
        } else {
            return cellModel.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailViewCell.identifier,
                                                      for: indexPath) as! DetailViewCell
        
        if page == .like {
            
        } else {
            if let name = cellModel[indexPath.item].title  {
                if let image = cellModel[indexPath.item].md5_image {
                    cell.configureCell(name: name, image: image)
                }
            }
        }
     
      
        cell.backgroundColor = UIColor.systemGreen
        cell.layer.cornerRadius = 5
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)
        return CGSize(width: width, height: width / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}




/* import Foundation

struct ArtistResponse: Codable {
    let id: Int
    let name: String
    let link: String
    let picture: String
    let nbAlbum: Int
    let nbFan: Int
    let radio: Bool
    let tracklist: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, link, picture, nbAlbum, nbFan, radio, tracklist, type
    }
}

struct TracklistResponse: Codable {
    let data: [Track]
    
    struct Track: Codable {
        let id: Int
        let title: String
        let album: Album
        
        struct Album: Codable {
            let id: Int
            let title: String
            let cover: String
            let releaseDate: String
            
            enum CodingKeys: String, CodingKey {
                case id, title, cover, releaseDate = "release_date"
            }
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}
*/
