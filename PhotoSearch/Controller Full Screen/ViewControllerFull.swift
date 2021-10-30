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
    @IBOutlet weak var savePhotoOutlet: UIBarButtonItem!
    
    var results3: String = ""
    let countCells = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 3.5

        configureURL(with: results3)
        
        savePhotoOutlet.image = UIImage(systemName: "suit.heart")
        
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
    
    
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {

        savePhotoOutlet.image = UIImage(systemName: "suit.heart.fill")
        let imageData = photoView.image
          
        UIImageWriteToSavedPhotosAlbum(imageData!, nil, nil, nil)
        
        let alert = UIAlertController(title: "Save", message: "Your image", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
