//
//  CollectionViewCellFull.swift
//  PhotoSearch
//
//  Created by Михаил Мерешков on 07.10.2021.
//

import UIKit

class CollectionViewCellFull: UICollectionViewCell {
    
    @IBOutlet weak var photoView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureURL(with urlString: String) {
            guard let url = URL(string: urlString) else { return }
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.photoView.image = image
                }
            }
        .resume()
    }

}
