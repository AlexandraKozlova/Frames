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
    var page = 1
    
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
        NetworkManager.shared.getPictures { [weak self] result  in
            guard let self = self else { return }
            switch result {
            case .success(let pictures):
                self.pictures = pictures
                self.updateData(with: pictures)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func configureSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "What are you lookin for?"
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
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
    
    func updateData(with pictures: [Picture]) {
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
        destinationVC.currentPicture = picture
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}

extension PicturesVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            NetworkManager.shared.getSearchResult(query: text) { [weak self] result in
                    DispatchQueue.main.async {
                    guard let self = self else { return }
                    switch result {
                    case .success(let images):
                        self.pictures = images
                        self.updateData(with: images)
                        self.collectionView.reloadData()
                        print(images)
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
}




