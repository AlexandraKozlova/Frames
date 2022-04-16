//
//  CountLabel.swift
//  Frames
//
//  Created by Aleksandra on 15.04.2022.
//

import UIKit

class CountLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        font = UIFont(name: "Avenir-Heavy", size: 18)
        lineBreakMode = .byTruncatingHead
        textAlignment = .center
    }
}
