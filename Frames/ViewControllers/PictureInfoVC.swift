//
//  PictureInfoVC.swift
//  Frames
//
//  Created by Aleksandra on 12.04.2022.
//

import UIKit
import RealmSwift

class PictureInfoVC: UIViewController {
    
    var currentPicture: PictureInfo!
    var currentImage = [UIImage]()
    
    init(currentPicture: PictureInfo) {
        super.init(nibName: nil, bundle: nil)
        self.currentPicture = currentPicture
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let picture: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let username = TitleLabel(fontName: "Avenir-Heavy", fontSize: 25, textAlignment: .left)
    let locationImage = UIImageView()
    let locationLabel = TitleLabel(fontName: "Avenir-Light", fontSize: 20, textAlignment: .left)
    let infoView = UIView()
    let downloadImage = UIImageView()
    let downloadsLabel = TitleLabel(fontName: "Avenir-Heavy", fontSize: 20, textAlignment: .center)
    let downloadsCount = CountLabel()
    let viewsImage = UIImageView()
    let viewsLabel = TitleLabel(fontName: "Avenir-Heavy", fontSize: 20, textAlignment: .center)
    let viewsCount = CountLabel()
    
    let addButton = AddButton()
    let shareButton = ShareButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configurePicture()
        configureLabel()
        configureLocationImage()
        configureLocationLabel()
        configureInfoView()
        configureDownloadImage()
        configureDownloadsLabel()
        configureDownloadsCount()
        configureViewsImage()
        configureViewsLabel()
        configureViewsCount()
        configureAddButton()
        configureShareButton()
        updateUIElement()
    }
    
    private func configureViewController() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = UIColor.systemPink
    }
    
    private func updateUIElement() {
        let imageUrl = currentPicture.urls["regular"]
        guard let imageUrl = imageUrl, let url = URL(string: imageUrl) else { return }
        picture.sd_setImage(with: url)
//        currentImage.append(picture.image!)
        
        guard let location = currentPicture.user.location else {
            locationLabel.text = "No location"
            return
        }
        locationLabel.text = location
        username.text = currentPicture.user.name
        downloadsCount.text = String(currentPicture.downloads)
        viewsCount.text = String(currentPicture.views)
    }
    
    private func configurePicture() {
        view.addSubview(picture)
        
        NSLayoutConstraint.activate([
            picture.topAnchor.constraint(equalTo: view.topAnchor, constant: 85),
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
            infoView.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 20),
            infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            infoView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureDownloadImage() {
        infoView.addSubview(downloadImage)
        downloadImage.translatesAutoresizingMaskIntoConstraints = false
        downloadImage.image = UIImage(systemName: "square.and.arrow.down")
        downloadImage.tintColor = UIColor.systemPink
        
        NSLayoutConstraint.activate([
            downloadImage.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 15),
            downloadImage.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 30),
            downloadImage.heightAnchor.constraint(equalToConstant: 30),
            downloadImage.widthAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func configureDownloadsLabel() {
        infoView.addSubview(downloadsLabel)
        downloadsLabel.text = "Downloads"

        
        NSLayoutConstraint.activate([
            downloadsLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 15),
            downloadsLabel.leadingAnchor.constraint(equalTo: downloadImage.trailingAnchor, constant: 6),
            downloadsLabel.heightAnchor.constraint(equalToConstant: 30),
            downloadsLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func configureDownloadsCount() {
        infoView.addSubview(downloadsCount)

        NSLayoutConstraint.activate([
            downloadsCount.topAnchor.constraint(equalTo: downloadsLabel.bottomAnchor, constant: 10),
            downloadsCount.leadingAnchor.constraint(equalTo: downloadImage.leadingAnchor),
            downloadsCount.trailingAnchor.constraint(equalTo: downloadsLabel.trailingAnchor),
            downloadsCount.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func configureViewsImage() {
        infoView.addSubview(viewsImage)
        viewsImage.translatesAutoresizingMaskIntoConstraints = false
        viewsImage.image = UIImage(systemName: "eye")
        viewsImage.tintColor = UIColor.systemPink
        
        NSLayoutConstraint.activate([
            viewsImage.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 15),
            viewsImage.leadingAnchor.constraint(equalTo: downloadsLabel.trailingAnchor, constant: 45),
            viewsImage.heightAnchor.constraint(equalToConstant: 30),
            viewsImage.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configureViewsLabel() {
        infoView.addSubview(viewsLabel)
        viewsLabel.text = "Views"
        
        NSLayoutConstraint.activate([
            viewsLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 15),
            viewsLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -30),
            viewsLabel.heightAnchor.constraint(equalToConstant: 30),
            viewsLabel.widthAnchor.constraint(equalToConstant: 75)
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
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: downloadsCount.bottomAnchor, constant: 20),
            addButton.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 30),
            addButton.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -30),
            addButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func configureShareButton() {
        infoView.addSubview(shareButton)
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            shareButton.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: -15),
            shareButton.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 30),
            shareButton.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -30),
            shareButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    @objc func addButtonTapped() {
        let favorite = Favorite(user: currentPicture.user.name,
                                urls: currentPicture.urls["regular"]!)
        presentAlertOnMainThread(title: "Success!", message: "This picture in your favorite now.", buttonTitle: "Okay")
            StorageManager.saveObject(favorite)
        }
    

   @objc func shareButtonTapped() {
       let shareController = UIActivityViewController(activityItems: currentImage, applicationActivities: nil)
      
       shareController.completionWithItemsHandler = { [weak self] _, bool, _, _ in
           guard let self = self else { return }
           if bool {
               self.presentAlertOnMainThread(title: "Success!", message: "We are done here.", buttonTitle: "Okay")
           }
       }
       present(shareController, animated: true)
}

}
