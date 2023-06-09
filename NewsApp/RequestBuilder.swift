//
//  RequestBuilder.swift
//  NewsApp
//
//  Created by suhemparashar on 15/06/23.
//

import Foundation

class RequestBuilder {
    
    static let baseURL = "https://newsapi.org/v2/top-headlines"
    enum EndPoint {
        case getNews
        var urlString: String {
            switch self {
            case .getNews:
                return "\(RequestBuilder.baseURL)?country=us"
            }
        }
    }
}
