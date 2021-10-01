//
//  ViewController.swift
//  PhotoSearch
//
//  Created by Михаил Мерешков on 28.09.2021.
//

import UIKit

struct APIResponse: Codable {
    let total:Int
    let total_pages: Int
    let results: [Result]
}

struct Result: Codable {
    let id: String
    let urls: URLS
}

struct URLS: Codable {
    let regular: String
}
//UICollectionViewDataSource
class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBarPhoto: UISearchBar!
    @IBOutlet weak var outletButton: UIButton!
    
    var results: [Result] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBarPhoto.delegate = self
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBarPhoto.resignFirstResponder()
        if let text = searchBar.text {
            results = []
            fetchPhotos(query: text)
        }
    }

    func fetchPhotos(query: String) {
        
        let urlString = "https://api.unsplash.com/search/photos?page=1&per_page=50&query=\(query)&client_id=i7AnQs1hBQYm93oV6nhjpdKXe8DFDD_JqndQNM5ZNFE"
        
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let jsonResult = try JSONDecoder().decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    self.results = jsonResult.results
                    let vc = self.storyboard?.instantiateViewController(identifier: "CollectionViewControllerID") as! CollectionViewController
                    vc.results2 = self.results
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    @IBAction func searchButton(_ sender: UIButton) {
        fetchPhotos(query: searchBarPhoto.text!)
                
    }
}

