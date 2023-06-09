//
//  NewsModel.swift
//  NewsApp
//
//  Created by suhemparashar on 15/06/23.
//

import Foundation

struct NewsModel: Codable {
    let articles: [Articles]?
}

struct Articles: Codable {
    let title: String?
    let urlToImage: String?
}
