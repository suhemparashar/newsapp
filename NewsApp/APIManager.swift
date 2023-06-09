//
//  APIManager.swift
//  NewsApp
//
//  Created by suhemparashar on 15/06/23.
//

import Foundation

class APIManager {
    
    private let requestHandler = RequestHandler()
    
    func getNewsAPI(urlString: String, completion: @escaping ((Result<NewsModel, Error>) -> Void?)){
        
        requestHandler.makeRequest(urlString: urlString, modelType: NewsModel.self) { result in
            switch result {
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
