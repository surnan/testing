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
    
    let descriptionLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.text = "@jxoproductions"
        label.textColor = .white
//        label.textAlignment = .center
        return label
    }()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.title = "Home"
        [stackView, descriptionLabel].forEach{view.addSubview($0)}
        view.addSubview(stackView)
        stackView.anchor(top: nil, leading: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
//        descriptionLabel.anchor(top: nil, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: stackView.leadingAnchor, paddingTop: 0, paddingLeading: 8, paddingBottom: 8, paddingTrailing: -16)
        descriptionLabel.anchor(top: nil, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: stackView.leadingAnchor)
    }
}

