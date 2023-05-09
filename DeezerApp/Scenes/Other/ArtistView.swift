//
//  ArtistDetailViewController.swift
//  DeezerApp
//
//  Created by emre usul on 8.05.2023.
//

import UIKit

class ArtistView: UIViewController {
    
    private var tableView: UITableView!
    var model: ArtistModel?
    
    var id: Int = 0
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.backgroundColor = UIColor.red
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemTeal
        navigationController?.navigationBar.prefersLargeTitles = true
        
     
        configureUI()
        configureTableView()
     
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getArtistDetail()
    }
    
    private func configureUI() {
        guard let name = model?.name else {
            return
        }
        title = name
    }
    
    func configureTableView() {
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor.systemTeal
        
        
        
        
        let headerView = HeaderView(frame: CGRect(x: 0, y: 0,
                                                      width: view.bounds.width,
                                                      height: 250))
        
        headerView.configureHeader(imageURL: model?.picture)
        
        tableView.tableHeaderView = headerView
        
      
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func getArtistDetail() {
        ServiceManager.shared.getArtist(url: NetworkHelper.shared.getArtistURL(id: id)) { result in
            switch result {
                
            case .success(let artist):
                self.model = artist
                self.configureUI()
    
            case .failure(let error):
                print(error)
            }
        }
        
    }
}

extension ArtistView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                       for: indexPath)
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    
    
    
}
