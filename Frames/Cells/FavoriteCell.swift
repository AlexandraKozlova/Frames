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
    let usernameLabel = TitleLabel(fontName: "Avenir", fontSize: 25, textAlignment: .left)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(pictureView)
        addSubview(usernameLabel)
        
        accessoryType = .disclosureIndicator

        NSLayoutConstraint.activate([
            pictureView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            pictureView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            pictureView.heightAnchor.constraint(equalToConstant: 90),
            pictureView.widthAnchor.constraint(equalToConstant: 90),
            
            usernameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: pictureView.trailingAnchor, constant: 24),
            usernameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            usernameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
