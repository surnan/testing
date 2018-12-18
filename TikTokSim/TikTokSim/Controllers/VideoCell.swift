//
//  VideoCell.swift
//  TikTokSim
//
//  Created by admin on 12/18/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import AVKit

class VideoCell: UICollectionViewCell {
    
    var videoFileName: String! {
        didSet {
            let videoURL = Bundle.main.url(forResource: videoFileName, withExtension: "mp4")!
            let item = AVPlayerItem(url: videoURL)
            videoController.player.replaceCurrentItem(with: item)
            videoController.player.play()
        }
    }
    
    
    let videoController = VideoController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let videoView = videoController.view!
        addSubview(videoView)
        videoView.fillSuperView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
}

