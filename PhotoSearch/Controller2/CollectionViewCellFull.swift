//
//  CollectionViewCellFull.swift
//  PhotoSearch
//
//  Created by Михаил Мерешков on 07.10.2021.
//

import UIKit

class CollectionViewCellFull: UICollectionViewCell, UIScrollViewDelegate {

    @IBOutlet weak var scrolView: UIScrollView!
    @IBOutlet weak var photoView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.scrolView.delegate = self
        self.scrolView.minimumZoomScale = 1.0
        self.scrolView.maximumZoomScale = 3.5
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoView
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
