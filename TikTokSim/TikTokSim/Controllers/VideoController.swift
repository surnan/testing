//
//  ViewController.swift
//  TikTokSim
//
//  Created by admin on 12/16/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import AVKit

class VideoController: UIViewController {

    
    let stackView: UIStackView = {
        let colors: [UIColor] = [.red, .green, .blue]
        let subviews = colors.map { (color) -> UIView in
            let v = iconView()
            v.backgroundColor = color
            return v
        }
        let sv = UIStackView(arrangedSubviews: subviews)
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    
    let descriptionStackView: UIStackView = {
       let nameLabel = UILabel()
        nameLabel.numberOfLines = 0
        nameLabel.textColor = .white
        nameLabel.text = "@jxoproductions"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        nameLabel.layer.shadowOpacity = 1
        
        let messageLabel = UILabel()
        messageLabel.numberOfLines = 0
        messageLabel.textColor = .white
        messageLabel.text = "I was haivng a little too much fun with this.  😜  can you do it??"
        messageLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        let trackLabel = UILabel()
        trackLabel.numberOfLines = 0
        trackLabel.textColor = .white
        trackLabel.text = "Music Track Name"
        trackLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        
        let subviews = [nameLabel, messageLabel, trackLabel].map({ (v) -> UIView in
            v.layer.shadowOpacity = 1
            v.layer.shadowColor = UIColor(white: 0, alpha: 0.5).cgColor
            v.layer.shadowOffset = .init(width: 0, height: 1)
            return v
        })
        
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, messageLabel, trackLabel])
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    let player = AVPlayer()
    
    
    fileprivate func setupVideoPlayer(){
        let playerLayer = AVPlayerLayer(player: player)

        var frame = view.frame
        frame.origin.y -= 80
        playerLayer.frame = view.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill  //similar to ImageView.contentmode setting
        
        
        playerLayer.backgroundColor = UIColor.darkGray.cgColor
//        let videoURL = Bundle.main.url(forResource: "Raindrops", withExtension: "mp4")!
//        let item = AVPlayerItem(url: videoURL)
//        player.replaceCurrentItem(with: item)
        player.play()
        
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime , object: self.player.currentItem, queue: .main) { [weak self]  _ in
            self?.player.seek(to: CMTime.zero)
            self?.player.play()
        }
        
        
        
        view.layer.addSublayer(playerLayer)
    }
    
    
    fileprivate func setupLayout() {
        [stackView, descriptionStackView].forEach{view.addSubview($0)}
        stackView.anchor(top: nil, leading: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        descriptionStackView.anchor(top: nil, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: stackView.leadingAnchor, paddingTop: 0, paddingLeading: 16, paddingBottom: -16, paddingTrailing: -16)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.title = "Home"
        setupVideoPlayer()
        setupLayout()
    }
}

