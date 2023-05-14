//
//  CategoryScene.swift
//  DeezerApp
//
//  Created by emre usul on 8.05.2023.
//

import UIKit

enum Page {
    case category
    case artist
    case like
    case album
}

final class CategoryView: UIViewController {
    
    private var collectionView: UICollectionView!
    var cellModel: [CellModel] = []
    
    var page: Page = .category
    var id: Int = 0
    
    var viewTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.insertSublayer(Background.shared.backgroundGradientLayer(view), at:0)
       
     
        configureUI()
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if self.page == .category {
            UserDefaultsManager.shared.getData()
            getCategory()
        } else {
            getArtist()
            title = viewTitle
        }
    }
    
    func configureUI() {
        title = "Category"
        navigationController?.navigationBar.tintColor = UIColor.black
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
        collectionView.register(CategoryViewCell.self,
                                forCellWithReuseIdentifier: CategoryViewCell.cellIdentifier)
        collectionView.backgroundColor = UIColor.white.withAlphaComponent(0.0)
       
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func getCategory() {
        ServiceManager.shared.getData(url: NetworkHelper.shared.baseURL) { result in
            switch result {
                
            case .success(let category):
                self.cellModel = category
                self.reloadCollectionView()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getArtist() {
        ServiceManager.shared.getData(url: NetworkHelper.shared.getGenreURL(id: id)) { result in
            switch result {
                
            case .success(let category):
                self.cellModel = category
                self.reloadCollectionView()
            case .failure(let error):
                print(error)
            }
            
        }
    }
}

extension CategoryView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryViewCell.cellIdentifier,
                                                      for: indexPath) as! CategoryViewCell
        cell.getImage(cellModel[indexPath.item])
        cell.layer.cornerRadius = 5
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if self.page == .category {
            let vc = CategoryView()
            vc.page = .artist
            
            if let id = cellModel[indexPath.item].id {
                vc.id = id
            }
            vc.viewTitle = cellModel[indexPath.item].name!
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = ArtistView()
            
            if let id = cellModel[indexPath.item].id {
                vc.id = id
            }
            
            vc.headerPicture = cellModel[indexPath.item].picture!
            vc.navTitle = cellModel[indexPath.item].name!

            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}


