//
//  PictureInfoVC.swift
//  Frames
//
//  Created by Aleksandra on 12.04.2022.
//

import UIKit
import RealmSwift

class PictureInfoVC: UIViewController {
    
    var currentPicture: Picture!
    var currentImage = [UIImage]()
    
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
    let likeImage = UIImageView()
    let likeLabel = TitleLabel(fontName: "Avenir-Heavy", fontSize: 20, textAlignment: .center)
    let likeCount = CountLabel()
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
        configureLikeImage()
        configureLikeLabel()
        configureLikeCount()
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
        guard let imageUrl = imageUrl, let url = URL(string: imageUrl)
        else { return }
        picture.sd_setImage(with: url)
        currentImage.append(picture.image!)
        
        guard let location = currentPicture.user.location else {
            locationLabel.text = "No location"
            return
        }
        locationLabel.text = location
        username.text = currentPicture.user.name
        likeCount.text = String(currentPicture.likes)
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
    
    private func configureLikeImage() {
        infoView.addSubview(likeImage)
        likeImage.translatesAutoresizingMaskIntoConstraints = false
        likeImage.image = UIImage(systemName: "heart")
        likeImage.tintColor = UIColor.systemPink
        
        NSLayoutConstraint.activate([
            likeImage.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 15),
            likeImage.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -200),
            likeImage.heightAnchor.constraint(equalToConstant: 35),
            likeImage.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configureLikeLabel() {
        infoView.addSubview(likeLabel)
        likeLabel.text = "Likes"
        
        NSLayoutConstraint.activate([
            likeLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 15),
            likeLabel.centerXAnchor.constraint(equalTo: infoView.centerXAnchor),
            likeLabel.heightAnchor.constraint(equalToConstant: 35),
            likeLabel.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    private func configureLikeCount() {
        infoView.addSubview(likeCount)
        
        NSLayoutConstraint.activate([
            likeCount.topAnchor.constraint(equalTo: likeLabel.bottomAnchor, constant: 10),
            likeCount.centerXAnchor.constraint(equalTo: infoView.centerXAnchor),
            likeCount.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func configureAddButton() {
        infoView.addSubview(addButton)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: likeCount.bottomAnchor, constant: 20),
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
      
       shareController.completionWithItemsHandler = { _, bool, _, _ in
           if bool {
               
           }
           
       }
       present(shareController, animated: true)
}

}
