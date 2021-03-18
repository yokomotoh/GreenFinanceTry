//
//  UIPlayerView.swift
//  VideoOnboardingScreen
//
//  Created by vincent schmitt on 27/11/2020.
//

//import Foundation
import AVKit
import SwiftUI

class UIVideoPlayer: UIView{
    
    var playerLayer = AVPlayerLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            
        guard let url = URL(string:
            "https://cdn.videvo.net/videvo_files/video/free/2019-09/small_watermarked/190828_07_MarinaBayatNightDrone_UHD_02_preview.mp4" ) else { return }

        let player = AVPlayer(url: url)
        player.isMuted = true
        player.play()
        
        playerLayer.player = player
        playerLayer.videoGravity = AVLayerVideoGravity(rawValue: AVLayerVideoGravity.resizeAspectFill.rawValue)

        layer.addSublayer(playerLayer)
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    override func layoutSubviews() {
            super.layoutSubviews()
            playerLayer.frame = bounds
        }
}

struct PlayerView: UIViewRepresentable {

    func makeUIView(context: Context) -> UIVideoPlayer {
        return UIVideoPlayer()
    }

    func updateUIView(_ uiView: UIVideoPlayer, context: Context) {
        
    }
}



