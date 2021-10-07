//
//  MyCollectionViewCell.swift
//  PhotoSearch
//
//  Created by Михаил Мерешков on 02.10.2021.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    
    static var identifier = "MyCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configure(with image: UIImage) {
        imageView.image = image
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    
    func configureURL(with urlString: String) {
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
