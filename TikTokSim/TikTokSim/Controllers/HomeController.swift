//
//  ViewController.swift
//  TikTokSim
//
//  Created by admin on 12/16/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    
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
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, messageLabel, trackLabel])
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    
    
    
//    let descriptionLabel: UILabel = {
//       let label = UILabel()
//        label.numberOfLines = 0
//        label.textColor = .white
//        let attributedText = NSMutableAttributedString(string: "@jxoproductions", attributes: [ NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
//        attributedText.append((NSAttributedString(string: "\nI was having a little too much fun with this.  😝  can you do it??", attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 18)])))
//        attributedText.append((NSAttributedString(string: "\nMusic Track Name", attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 18)])))
//
//
//        let style = NSMutableParagraphStyle()
//        style.lineSpacing = 10
//
////        let range = NSMakeRange(0, attributedText.string.count)
//        let range = NSMakeRange(0, "@jxoproductions".count)
//        attributedText.addAttributes([.paragraphStyle: style], range: range)
//
//        label.attributedText = attributedText
//        return label
//    }()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.title = "Home"
        [stackView, descriptionStackView].forEach{view.addSubview($0)}
        view.addSubview(stackView)

        stackView.anchor(top: nil, leading: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
//        descriptionStackView.anchor(top: nil, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: stackView.leadingAnchor)
        descriptionStackView.anchor(top: nil, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: stackView.leadingAnchor, paddingTop: 0, paddingLeading: 0, paddingBottom: 0, paddingTrailing: 0)
        
 
        
        
        
//        descriptionStackView.anchor(top: nil, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: stackView.leadingAnchor, paddingTop: 0, paddingLeading: 0, paddingBottom: 0, paddingTrailing: 0)
//        descriptionStackView.anchor(top: nil, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: stackView.leadingAnchor)
    }
}

