//
//  ViewController.swift
//  TikTokSim
//
//  Created by admin on 12/16/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let stackView: UIStackView = {
       let sv = UIStackView(arrangedSubviews: [])
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    class iconView: UIView {
        override var intrinsicContentSize: CGSize {
            return .init(width: 80, height: 120)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let colors: [UIColor] = [.red, .green, .blue]
        let subviews = colors.map { (color) -> UIView in
            let v = iconView()
            v.backgroundColor = color
            return v
        }
        subviews.forEach({stackView.addArrangedSubview($0)})
        view.addSubview(stackView)
        stackView.anchor(top: nil, leading: nil, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
}

