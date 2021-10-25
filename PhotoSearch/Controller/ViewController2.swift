//
//  CollectionViewController.swift
//  PhotoSearch
//
//  Created by Михаил Мерешков on 28.09.2021.
//

import UIKit

class ViewController2: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var results2 = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        collectionView.collectionViewLayout = layout
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewControllerFull") as! ViewControllerFull
        collectionView.deselectItem(at: indexPath, animated: true)
        vc.results3 = results2[indexPath.item].urls.regular
        vc.indexPaths = indexPath
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//
//        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewControllerFull") as! ViewControllerFull
//        collectionView.deselectItem(at: indexPath, animated: true)
//        vc.results3 = results2
//        vc.indexPaths = indexPath
//        self.navigationController?.pushViewController(vc, animated: true)
//
////        collectionView.deselectItem(at: indexPath, animated: true)
////        print("Ты нажал на меня")
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results2.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageURLString = results2[indexPath.row].urls.regular
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as? MyCollectionViewCell else { return UICollectionViewCell() }
        cell.configureURL(with: imageURLString)
    
        return cell
    }
}

//extension UICollectionViewController: UICollectionViewDelegateFlowLayout {
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 120, height: 120)
//    }
//}

