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
    let collectionView4 = CollectionView()
    @IBOutlet weak var searchBarPhoto: UISearchBar!
    
    var results: [Result] = []
    //let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - searchBar
        //view.addSubview(searchBar)
        searchBarPhoto.delegate = self
        //MARK: - collectionView
//        let layout = UICollectionViewFlowLayout()
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        layout.scrollDirection = .vertical
//        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 0
//        layout.itemSize = CGSize(width: view.frame.size.width/2, height: view.frame.size.width/2)
//        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
//        collectionView.dataSource = self
//        view.addSubview(collectionView)
//        collectionView.backgroundColor = .systemBackground
//        self.collectionView = collectionView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //searchBar.frame = CGRect(x: 10, y: view.safeAreaInsets.top, width: view.frame.size.width-20, height: 50)
        //collectionView?.frame = CGRect(x: 0, y: view.safeAreaInsets.top+55, width: view.frame.size.width, height: view.frame.size.height-55)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBarPhoto.resignFirstResponder()
        if let text = searchBar.text {
            results = []
            collectionView?.reloadData()
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
                    self.collectionView?.reloadData()
                }
            } catch {
                print(error)
            }
            
        }
        task.resume()
    }

//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return results.count
//    }
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let imageURLString = results[indexPath.row].urls.regular
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
//        cell.configure(with: imageURLString)
//        return cell
//    }
}

