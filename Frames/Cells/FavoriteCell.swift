//
//  FavoriteCell.swift
//  Frames
//
//  Created by Aleksandra on 11.04.2022.
//

import UIKit

class FavoriteCell: UITableViewCell {

    static let reuseID = "FavoriteCell"
    let pictureView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let usernameLabel = TitleLabel(fontName: "Avenir", fontSize: 25)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configurePictureView() {
        
    }
    
    private func configure() {
       
        addSubview(pictureView)
        addSubview(usernameLabel)
        
        accessoryType = .disclosureIndicator
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            pictureView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            pictureView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            pictureView.heightAnchor.constraint(equalToConstant: 90),
            pictureView.widthAnchor.constraint(equalToConstant: 90),
            
            usernameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: pictureView.trailingAnchor, constant: 24),
            usernameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
