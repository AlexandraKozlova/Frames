//
//  PictureCell.swift
//  Frames
//
//  Created by Aleksandra on 05.04.2022.
//

import UIKit

class PictureCell: UICollectionViewCell {
    
    static let reuseID = "PictureCell"
    let image = UIImageView()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(image)
        image.image = UIImage(named: "Icon")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
    }
    
}
