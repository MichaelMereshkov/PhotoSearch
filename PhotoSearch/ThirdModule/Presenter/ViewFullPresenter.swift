//
//  ViewFullPresenter.swift
//  PhotoSearch
//
//  Created by Михаил Мерешков on 07.11.2021.
//

import Foundation
import UIKit

protocol ViewFullPresenterProtocol: AnyObject {
    var image: UIImage? { get }
    
    func getImage()
    func saveImage(image: UIImage?)
    func showAlert()
}


protocol ViewFullPresenterDelegate: AnyObject {
    
    func imageGetSucces()
}

final class ViewFullPresenter: ViewFullPresenterProtocol {
    
    // MARK: - Properties

    private let networkService = NetworkService()
    public var image: UIImage?
    public weak var delegate: ViewFullPresenterDelegate?

    var results3: String = ""

    // MARK: - Functions

    func getImage() {
        networkService.fetchImage(with: results3) { newImage in
            self.image = newImage
            self.delegate?.imageGetSucces()
        }
    }
    
    func saveImage(image: UIImage?) {
        guard let image = image else { return }
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    
    internal func showAlert() {
        let alert = UIAlertController(title: "Save", message: "Your image", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        (delegate as? ViewControllerFull)?.present(alert, animated: true, completion: nil)
    }
}
