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
    
    var presenter: ViewFullPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 3.5
        savePhotoOutlet.image = UIImage(systemName: "suit.heart")
        presenter?.getImage()
        
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoView
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        presenter?.saveImage(image: photoView.image)
        savePhotoOutlet.image = UIImage(systemName: "suit.heart.fill")
    }
}

extension ViewControllerFull: ViewFullPresenterDelegate {
    
    func imageGetSucces() {
        photoView.image = presenter?.image
    }
}
