//
//  CollectionView.swift
//  PhotoSearch
//
//  Created by Михаил Мерешков on 28.09.2021.
//

import UIKit

class CollectionView: UICollectionView, UICollectionViewDataSource {

    var viewControllers = ViewController()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewControllers.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageURLString = viewControllers.results[indexPath.row].urls.regular
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        cell.configure(with: imageURLString)
        return cell
    }

}
