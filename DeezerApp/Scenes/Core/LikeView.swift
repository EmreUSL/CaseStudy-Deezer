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
    var albumImage: String = ""
    
    var page: Page = .like
    var id: Int = 0
    var viewTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.insertSublayer(Background.shared.backgroundGradientLayer(view), at:0)
        configureUI()
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if self.page == .like {
            title = "Follow List"
        } else {
            getTrack()
            configureUI()
        }
    }
    
    deinit {
        MusicPlayer.shared.stopMusic()
    }
    
    func configureUI() {
        title = viewTitle
        view.backgroundColor = UIColor.red
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0,
                                           left: 10,
                                           bottom: 0,
                                           right: 10)
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
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
            self.reloadCollectionView()
            return UserDefaultsManager.shared.favoriteTracks.count
        } else {
            return cellModel.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailViewCell.identifier,
                                                      for: indexPath) as! DetailViewCell
        
        if page == .like {
            cell.configureCell(item: UserDefaultsManager.shared.favoriteTracks[indexPath.item], image: albumImage)
        } else {
            cell.configureCell(item: cellModel[indexPath.item], image: albumImage)
        }

        cell.layer.cornerRadius = 5
        return cell
    }
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)
        return CGSize(width: width, height: width / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if page == .like {
            let selectedCell = collectionView.cellForItem(at: indexPath) as! DetailViewCell
            if let preview = UserDefaultsManager.shared.favoriteTracks[indexPath.item].preview {
                selectedCell.playSound(preview: preview)
            }
        } else {
            let selectedCell = collectionView.cellForItem(at: indexPath) as! DetailViewCell
            if let preview = cellModel[indexPath.item].preview {
                selectedCell.playSound(preview: preview)
            }
        }
    }
}

