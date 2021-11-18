//
//  NetworkService.swift
//  PhotoSearch
//
//  Created by Михаил Мерешков on 02.11.2021.
//

import Foundation
import UIKit

final class NetworkService {
    
    //var results: [Result] = []
    
    func fetchImage(with urlString: String, completion: @escaping (UIImage?)->()) {
            guard let url = URL(string: urlString) else {
                completion(nil)
                return
            }
        
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data,
                      error == nil
                else {
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    completion(image)
                }
            }
        .resume()
    }
    
//    func fetchPhotos(query: String) {
//        
//        let urlString = "https://api.unsplash.com/search/photos?page=1&per_page=50&query=\(query)&client_id=i7AnQs1hBQYm93oV6nhjpdKXe8DFDD_JqndQNM5ZNFE"
//        
//        guard let url = URL(string: urlString) else { return }
//        let task = URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data, error == nil else { return }
//            do {
//                let jsonResult = try JSONDecoder().decode(APIResponse.self, from: data)
//                DispatchQueue.main.async {
//                    self.results = jsonResult.results
//                    let vc = self.storyboard?.instantiateViewController(identifier: "ViewControllerID") as! ViewController2
//                    vc.results2 = self.results
//                    self.navigationController?.pushViewController(vc, animated: true)
//                }
//            } catch {
//                print(error)
//            }
//        }
//        task.resume()
//    }
}
