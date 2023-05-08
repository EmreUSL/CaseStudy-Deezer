//
//  LikeSceneViewModel.swift
//  DeezerApp
//
//  Created by emre usul on 8.05.2023.
//

import Foundation

protocol LikeSceneViewModelInterface {
    var view: LikeSceneInterface? { get set}
    func viewDidLoad()
}

final class LikeSceneViewModel {
    var view: LikeSceneInterface?
}

extension LikeSceneViewModel: LikeSceneViewModelInterface {
    func viewDidLoad() {
        view?.configureUI()
        view?.configureCollectionView()
    }
    
   
}
