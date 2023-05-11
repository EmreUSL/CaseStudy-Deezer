//
//  MusicPlayer.swift
//  DeezerApp
//
//  Created by emre usul on 11.05.2023.
//

import Foundation
import AVFoundation

class MusicPlayer {
    static let shared = MusicPlayer()
    
    var player: AVPlayer?
    
    func playMusic(_ preview: String) {
        let url = URL(string: preview)
        let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
        player = AVPlayer(playerItem: playerItem)
        player!.play()
    }
}
