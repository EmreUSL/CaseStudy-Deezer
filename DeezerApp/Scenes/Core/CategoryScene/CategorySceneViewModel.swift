//
//  CategorySceneViewModel.swift
//  DeezerApp
//
//  Created by emre usul on 8.05.2023.
//

import Foundation

protocol CategorySceneViewModelInterface {
    var view: CategorySceneInterface? { get set }
    func viewDidLoad()
}

final class CategorySceneViewModel {
    var view: CategorySceneInterface?
}

extension CategorySceneViewModel: CategorySceneViewModelInterface {
    func viewDidLoad() {
        view?.configureUI()
        view?.configureCollectionView()
    }
}
