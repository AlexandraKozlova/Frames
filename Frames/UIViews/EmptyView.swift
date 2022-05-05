//
//  EmptyView.swift
//  Frames
//
//  Created by Aleksandra on 01.05.2022.
//

import UIKit

class EmptyView: UIView {
    
    let messageLabel = TitleLabel(fontName: "Avenir-Heavy", fontSize: 28, textAlignment: .center)
    let logoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(message: String) {
        self.init(frame: .zero)
        messageLabel.text = message
    }
    
    private func configure() {
        addSubview(messageLabel)
        addSubview(logoImageView)
        
        logoImageView.image = UIImage(named: "Empty")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.alpha = 0.3
        
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            messageLabel.heightAnchor.constraint(equalToConstant: 200),
            
            logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor),
            logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100)
        ])
    }
}
