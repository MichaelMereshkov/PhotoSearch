//
//  CollectionViewCell.swift
//  PhotoSearch
//
//  Created by Михаил Мерешков on 28.09.2021.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
//    static let identifier = "CollectionViewCell"
    
    //private let imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFill
//        return imageView
   // }()
    

    
    func configure(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self?.imageView.image = image
            }
        }
        .resume()
    }
}
