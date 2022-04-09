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

    var pictures: [Picture] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureSearchController()
        getPictures()
        configureCollectionView()
        configureDataSource()
        
}
    
    func getPictures() {
        NetworkManager.shared.getPictures { pictures, errorMessage in
            guard let pictures = pictures else { print(errorMessage ?? "error")
                return
            }
            self.pictures = pictures
            self.updateData()
            print(self.pictures)
        }
    }
    
    func configureSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "What are you lookin for?"
        navigationItem.searchController = searchController

    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createTwoColumnFlowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.register(PictureCell.self, forCellWithReuseIdentifier: PictureCell.reuseID)
    }

    func createTwoColumnFlowLayout() -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 2

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)

        return flowLayout
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Picture>(collectionView: collectionView, cellProvider: { collectionView, indexPath, follower in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PictureCell.reuseID, for: indexPath) as! PictureCell
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

extension PicturesVC: UISearchResultsUpdating {
   
    func updateSearchResults(for searchController: UISearchController) {
        print("Search")
    }
}

