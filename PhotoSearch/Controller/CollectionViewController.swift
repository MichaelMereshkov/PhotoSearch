//
//  CollectionViewController.swift
//  PhotoSearch
//
//  Created by Михаил Мерешков on 28.09.2021.
//

import UIKit



class CollectionViewController: UICollectionViewController {
    
        var results2 = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results2.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageURLString = results2[indexPath.row].urls.regular
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArtCell", for: indexPath) as? CollectionCell else { return UICollectionViewCell() }
        cell.configure(with: imageURLString)

        return cell
    }
}

