//
//  ViewControllerFull.swift
//  PhotoSearch
//
//  Created by Михаил Мерешков on 07.10.2021.
//

import UIKit

class ViewControllerFull: ViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoView: UIImageView!
    
    var results3: String = ""
    let countCells = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 3.5

        configureURL(with: results3)
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

extension ViewControllerFull: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let frameCV = collectionView.frame
        
        let widthCell = frameCV.width / CGFloat(countCells)
        let heightCell = widthCell
        
        return CGSize(width: widthCell, height: heightCell)
    }
}
