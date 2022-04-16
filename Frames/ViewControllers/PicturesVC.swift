//
//  PicturesVC.swift
//  Frames
//
//  Created by Aleksandra on 04.04.2022.
//

import UIKit

class PicturesVC: UIViewController {
    
    enum Section { case main }

    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Picture>!

    var pictures = [Picture]()
    private let itemsPerRow: CGFloat = 2
    private let sectionInserts = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureSearchController()
        getPictures()
        configureCollectionView()
        configureDataSource()
        collectionView.delegate = self
}
    
    func getPictures() {
        NetworkManager.shared.getPictures { result in
            switch result {
            case .success(let pictures):
                self.pictures = pictures
                print(self.pictures)
                self.updateData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func configureSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "What are you lookin for?"
        navigationItem.searchController = searchController

    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createTwoColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.register(PictureCell.self, forCellWithReuseIdentifier: PictureCell.reuseID)
        collectionView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.contentInsetAdjustmentBehavior = .always
        
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Picture>(collectionView: collectionView, cellProvider: { collectionView, indexPath, follower in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PictureCell.reuseID, for: indexPath) as! PictureCell
            let unsplashImage = self.pictures[indexPath.row]
            cell.unsplashImages = unsplashImage
            return cell
        })
    }
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Picture>()
        snapshot.appendSections([.main])
        snapshot.appendItems(pictures)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
}


extension PicturesVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let picture = pictures[indexPath.item]
        let paddingSpace = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        let height = CGFloat(picture.height) * widthPerItem / CGFloat(picture.width)
        return CGSize(width: widthPerItem, height: height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
}

extension PicturesVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let picture = pictures[indexPath.item]
        let destinationVC = PictureInfoVC()
        
        let imageUrl = picture.urls["regular"]
        guard let imageUrl = imageUrl, let url = URL(string: imageUrl)
        else { return }
        destinationVC.picture.sd_setImage(with: url)
        
        guard let location = picture.user.location else {
            destinationVC.locationLabel.text = "No location"
            return
        }
        destinationVC.locationLabel.text = location
        
        destinationVC.username.text = picture.user.name
        destinationVC.downloadsCount.text = String(picture.downloads)
        destinationVC.viewsCount.text = String(picture.views)
        let navigationController = UINavigationController(rootViewController: destinationVC)
        present(navigationController, animated: true)
    }

    }


extension PicturesVC: UISearchResultsUpdating {
   
    func updateSearchResults(for searchController: UISearchController) {
        print("Search")
    }
}


