//
//  ViewController.swift
//  DeezerApp
//
//  Created by emre usul on 8.05.2023.
//

import UIKit

final class TabbarScene: UITabBarController {
    
    let CategoryVC = UINavigationController(rootViewController: CategoryScene())
    let LikeSceneVC = UINavigationController(rootViewController: LikeScene())

    override func viewDidLoad() {
        super.viewDidLoad()
        setupColor()
        setImageTabBarItem()
        setViewControllers()
    }

    private func setupColor() {
        view.backgroundColor = .systemBackground
        tabBar.tintColor = UIColor.label
    }
    
    private func setImageTabBarItem() {
        CategoryVC.tabBarItem.image = UIImage(systemName: "music.note")
        LikeSceneVC.tabBarItem.image = UIImage(systemName: "heart")
    }
    
    private func setViewControllers() {
        setViewControllers([CategoryVC,LikeSceneVC], animated: true)
    }
    
}

