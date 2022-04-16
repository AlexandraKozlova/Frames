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
    let infoView = UIView()
    let downloadsImage = UIImageView()
    let downloadsLabel = TitleLabel(fontName: "Avenir-Heavy", fontSize: 20)
    let viewsImage = UIImageView()
    let viewsLabel = TitleLabel(fontName: "Avenir-Heavy", fontSize: 20)
    let downloadsCount = CountLabel()
    let viewsCount = CountLabel()
    let addButton = AddButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configurePicture()
        configureLabel()
        configureLocationImage()
        configureLocationLabel()
        configureInfoView()
        configureDownloadsImage()
        configureDownloadsLabel()
        configureViewsImage()
        configureViewsLabel()
        configureDownloadsCount()
        configureViewsCount()
        configureAddButton()
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
    
    private func configureInfoView() {
        view.addSubview(infoView)
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.backgroundColor = .systemGray5
        infoView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            infoView.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 15),
            infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            infoView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func configureDownloadsImage() {
        infoView.addSubview(downloadsImage)
        downloadsImage.translatesAutoresizingMaskIntoConstraints = false
        downloadsImage.image = UIImage(systemName: "square.and.arrow.down")
        downloadsImage.tintColor = UIColor.black
        
        NSLayoutConstraint.activate([
            downloadsImage.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 15),
            downloadsImage.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 30),
            downloadsImage.heightAnchor.constraint(equalToConstant: 20),
            downloadsImage.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func configureDownloadsLabel() {
        infoView.addSubview(downloadsLabel)
        downloadsLabel.text = "Downloads"
       
        NSLayoutConstraint.activate([
            downloadsLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 15),
            downloadsLabel.leadingAnchor.constraint(equalTo: downloadsImage.trailingAnchor, constant: 6),
            downloadsLabel.heightAnchor.constraint(equalToConstant: 20),
            downloadsLabel.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func configureViewsImage() {
        infoView.addSubview(viewsImage)
        viewsImage.translatesAutoresizingMaskIntoConstraints = false
        viewsImage.image = UIImage(systemName: "eye")
        viewsImage.tintColor = UIColor.black
        
        NSLayoutConstraint.activate([
            viewsImage.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 15),
            viewsImage.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 220),
            viewsImage.heightAnchor.constraint(equalToConstant: 20),
            viewsImage.widthAnchor.constraint(equalToConstant: 23)
        ])
    }
    
    private func configureViewsLabel() {
        infoView.addSubview(viewsLabel)
        viewsLabel.text = "Views"
       
        NSLayoutConstraint.activate([
            viewsLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 15),
            viewsLabel.leadingAnchor.constraint(equalTo: viewsImage.trailingAnchor, constant: 6),
            viewsLabel.heightAnchor.constraint(equalToConstant: 20),
            viewsLabel.widthAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    private func configureDownloadsCount() {
        infoView.addSubview(downloadsCount)
        
        NSLayoutConstraint.activate([
            downloadsCount.topAnchor.constraint(equalTo: downloadsLabel.bottomAnchor, constant: 6),
            downloadsCount.leadingAnchor.constraint(equalTo: downloadsImage.leadingAnchor),
            downloadsCount.trailingAnchor.constraint(equalTo: downloadsLabel.trailingAnchor),
            downloadsCount.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func configureViewsCount() {
        infoView.addSubview(viewsCount)
        
        NSLayoutConstraint.activate([
            viewsCount.topAnchor.constraint(equalTo: viewsLabel.bottomAnchor, constant: 10),
            viewsCount.leadingAnchor.constraint(equalTo: viewsImage.leadingAnchor),
            viewsCount.trailingAnchor.constraint(equalTo: viewsLabel.trailingAnchor),
            viewsCount.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func configureAddButton() {
        infoView.addSubview(addButton)
        addButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: -20),
            addButton.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 30),
            addButton.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -30),
            addButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    @objc func buttonTapped() {
       print("Tap button")
    }

    
}
