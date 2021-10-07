//
//  ViewControllerFull.swift
//  PhotoSearch
//
//  Created by Михаил Мерешков on 07.10.2021.
//

import UIKit

class ViewControllerFull: ViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var results3 = [Result]()
    let identifier = "FullScreenCell"
    let countCells = 1
    var indexPaths: IndexPath = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "ViewControllerFull", bundle: nil), forCellWithReuseIdentifier: identifier)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        results3.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageURLString = results3[indexPath.row].urls.regular
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? CollectionViewCellFull
        cell?.configureURL(with: imageURLString)
        
        return cell!
    }

}
extension ViewControllerFull: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let frameCV = collectionView.frame
        
        let widthCell = frameCV.width / CGFloat(countCells)
        let heightCell = widthCell
        
        return CGSize(width: widthCell, height: heightCell)
    }
}
