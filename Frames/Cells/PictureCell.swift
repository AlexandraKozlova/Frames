//
//  PictureCell.swift
//  Frames
//
//  Created by Aleksandra on 05.04.2022.
//

import UIKit
import SDWebImage

class PictureCell: UICollectionViewCell {
    
    static let reuseID = "PictureCell"
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGray3
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    var unsplashImages: Picture! {
        didSet {
            let imageUrl = unsplashImages.urls["regular"]
            guard let imageUrl = imageUrl,
                  let url = URL(string: imageUrl)
            else { return }
            image.sd_setImage(with: url)
        }
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        configure()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(image)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
