//
//  FavoriteVC.swift
//  Frames
//
//  Created by Aleksandra on 04.04.2022.
//

import UIKit
import RealmSwift

class FavoriteVC: UIViewController {
    
    let tableView = UITableView()
    var favoritePictures: Results<Favorite>!

    override func viewDidLoad() {
        super.viewDidLoad()
        favoritePictures = realm.objects(Favorite.self)
        view.backgroundColor = .white
        configureTableView()
        print(favoritePictures.count)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        print(favoritePictures.count)
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.rowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.reuseID)

    }

}


extension FavoriteVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritePictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.reuseID) as! FavoriteCell
        let favorite = favoritePictures[indexPath.row]
        let imageUrl = favorite.urls
        let url = URL(string: imageUrl)
        cell.pictureView.sd_setImage(with: url)
        cell.usernameLabel.text = favorite.user
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }

        let favorite = favoritePictures[indexPath.row]
        StorageManager.deleteObject(favorite)
        tableView.deleteRows(at: [indexPath], with: .left)
    }
}

