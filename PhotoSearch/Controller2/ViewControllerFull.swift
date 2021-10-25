//
//  ViewControllerFull.swift
//  PhotoSearch
//
//  Created by Михаил Мерешков on 07.10.2021.
//

import UIKit

class ViewControllerFull: ViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let collectionViewCellFull = CollectionViewCellFull()
    var results3 = ""
    let identifier = "FullScreenCell"
    let countCells = 1
    var indexPaths: IndexPath = []
    var images = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        //collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "CollectionViewCellFull", bundle: nil), forCellWithReuseIdentifier: identifier)
        collectionView.
    }
    
    private func setupImageView() {
        guard let name = results3 else { return }
        
        if let image = UIImage(named: name) {
            collectionViewCellFull.photoView.image = image
        }
    }
    
    func collectionViewC(cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? CollectionViewCellFull else { return UICollectionViewCell() }
        cell.configureURL(with: results3)

        return cell
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
