//
//  ArtistDetailViewController.swift
//  DeezerApp
//
//  Created by emre usul on 8.05.2023.
//

import UIKit

class ArtistView: UIViewController {
    
    private var tableView: UITableView!
    var model: [Datum] = []
    var artistModel: ArtistModel?
    
    var navTitle: String = ""
    var headerPicture: String = ""
    
    var id: Int = 0
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.insertSublayer(Background.shared.backgroundGradientLayer(view), at:0)
        navigationController?.navigationBar.prefersLargeTitles = true
        
        configureUI()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getArtistDetail()
    }
    
    private func configureUI() {
        title = navTitle
    }
    
    func configureTableView() {
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(ArtistDetailViewCell.self,
                           forCellReuseIdentifier: ArtistDetailViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        
        
        let headerView = HeaderView(frame: CGRect(x: 0, y: 0,
                                                      width: view.bounds.width,
                                                      height: 200))
        
       
        tableView.tableHeaderView = headerView
        headerView.configureHeader(imageURL: headerPicture)
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func getArtistDetail() {
        ServiceManager.shared.getArtist(url: NetworkHelper.shared.getArtistURL(id: id)) { result in
            switch result {
            case .success(let artist):
                self.artistModel = artist
                if let url = self.artistModel?.tracklist {
                    self.getAlbum(url: url)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getAlbum(url: String) {
        
        ServiceManager.shared.getAlbum(url: url) { result in
            switch result {
            case .success(let artist):
                for art in artist {
                    if !self.model.contains(where: {$0 == art}) {
                        self.model.append(art)
                    }
                }
                // RELEASE DATE BİLGİSİ İLGİLİ API DA YOK
                self.reloadTableView()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ArtistView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArtistDetailViewCell.identifier,
                                                 for: indexPath) as! ArtistDetailViewCell
        cell.configureCell(model: model[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = LikeView()
        
        if let id = model[indexPath.row].album?.id{
            vc.id = id
        }
        vc.viewTitle = (model[indexPath.row].album?.title)!
        vc.page = .album
        vc.albumImage = (model[indexPath.row].album?.cover)!
        navigationController?.pushViewController(vc, animated: true)
    }
}


