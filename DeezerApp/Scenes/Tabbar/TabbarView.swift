//
//  ViewController.swift
//  DeezerApp
//
//  Created by emre usul on 8.05.2023.
//

import UIKit

final class TabbarView: UITabBarController {
    
    let CategoryVC = UINavigationController(rootViewController: CategoryView())
    let LikeSceneVC = UINavigationController(rootViewController: LikeView())

    override func viewDidLoad() {
        super.viewDidLoad()
        setupColor()
        setImageTabBarItem()
        setViewControllers()
    }

    private func setupColor() {
        view.backgroundColor = .systemBackground
        tabBar.barTintColor = UIColor.black.withAlphaComponent(0.3)
        tabBar.isTranslucent = false
        tabBar.barStyle = .black
        tabBar.tintColor = UIColor.white
        tabBar.itemPositioning = .fill
        tabBar.backgroundColor = UIColor(named: "323B61")
    }
    
    private func setImageTabBarItem() {
        CategoryVC.tabBarItem.image = UIImage(systemName: "music.note")
        LikeSceneVC.tabBarItem.image = UIImage(systemName: "heart")
        
        CategoryVC.title = "Category"
        LikeSceneVC.title = "Follow List"
    }
    
    private func setViewControllers() {
        setViewControllers([CategoryVC,LikeSceneVC], animated: true)
    }
    
}

