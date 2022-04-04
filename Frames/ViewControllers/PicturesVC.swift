//
//  PicturesVC.swift
//  Frames
//
//  Created by Aleksandra on 04.04.2022.
//

import UIKit

class PicturesVC: UIViewController {
    
    var collectionView = UICollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureSearchController()
    }
    
    func configureSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "What are you lookin for?"
        navigationItem.searchController = searchController

    }


}

extension PicturesVC: UISearchResultsUpdating {
   
    func updateSearchResults(for searchController: UISearchController) {
        print("Search")
    }
}

