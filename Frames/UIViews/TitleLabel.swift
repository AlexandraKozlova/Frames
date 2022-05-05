//
//  TitleLabel.swift
//  Frames
//
//  Created by Aleksandra on 14.04.2022.
//

import UIKit

class TitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   convenience init(fontName: String, fontSize: CGFloat, textAlignment: NSTextAlignment) {
        self.init(frame: .zero)
        font = UIFont(name: fontName, size: fontSize)
        self.textAlignment = textAlignment
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingHead
    }
}
