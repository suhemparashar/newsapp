//
//  ViewModel.swift
//  NewsApp
//
//  Created by suhemparashar on 15/06/23.
//

import Foundation
import UIKit


protocol Delegate: AnyObject {
    func apiCallDidComplete()
}

class ViewModel {
    
    private let apiManager = APIManager()
    
    private var articles: [Articles]?
    weak var delegate: Delegate?
    
    func getNewsCount() -> Int {
        return articles?.count ?? 0
    }
    
    func getNewsTitle(index: Int) -> String {
        return articles?[index].title ?? ""
    }
    
    func getNewsImageURL(index: Int) -> String {
        return articles?[index].urlToImage ?? ""
    }
    
    func getNews(){
        let request = RequestBuilder.EndPoint.getNews
        let urlString = request.urlString
        
        apiManager.getNewsAPI(urlString: urlString) {result in
            switch result {
            case .success(let model):
                self.articles = model.articles
                self.delegate?.apiCallDidComplete()
            case . failure(let error):
                print(error)
            }
        }
    }
    
    func setUpImageView(imageURLString: String, completion: @escaping (UIImage?) -> Void) {
        let requestHandler = RequestHandler()
        requestHandler.fetchImage(from: imageURLString) { result in
            switch result {
            case .success(let image):
                completion(image)
            case .failure(let error):
                print("Failed to fetch image: \(error)")
                completion(nil)
            }
        }
    }
}
