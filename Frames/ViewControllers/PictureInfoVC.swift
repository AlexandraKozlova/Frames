//
//  PictureInfoVC.swift
//  Frames
//
//  Created by Aleksandra on 12.04.2022.
//

import UIKit

class PictureInfoVC: UIViewController {
    
    let picture: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let username = TitleLabel(fontName: "Avenir-Heavy", fontSize: 25)
    let locationImage = UIImageView()
    let locationLabel = TitleLabel(fontName: "Avenir-Light", fontSize: 20)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configurePicture()
        configureLabel()
        configureLocationImage()
        configureLocationLabel()
    }
    
    private func configureViewController() {
        view.backgroundColor = .white
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        doneButton.tintColor = UIColor.systemPink
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func dismissVC() { dismiss(animated: true)}
    
    private func configurePicture() {
        view.addSubview(picture)
        
        NSLayoutConstraint.activate([
            picture.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
            picture.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            picture.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            picture.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    private func configureLabel() {
        view.addSubview(username)

        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: picture.bottomAnchor, constant: 10),
            username.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            username.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            username.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configureLocationImage() {
        view.addSubview(locationImage)
        locationImage.translatesAutoresizingMaskIntoConstraints = false
        locationImage.image = UIImage(systemName: "mappin.and.ellipse")
        locationImage.tintColor = UIColor.systemPink
        
        NSLayoutConstraint.activate([
            locationImage.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 10),
            locationImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            locationImage.heightAnchor.constraint(equalToConstant: 25),
            locationImage.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func configureLocationLabel() {
        view.addSubview(locationLabel)
        
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 10),
            locationLabel.leadingAnchor.constraint(equalTo: locationImage.trailingAnchor, constant: 3),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            locationLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
    }
    
}
