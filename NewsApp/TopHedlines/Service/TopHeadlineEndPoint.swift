//
//  TopHeadlineEndPoint.swift
//  NewsApp
//
//  Created by Harish on 26/07/24.
//

import Foundation

typealias StringArr = [String: String]

enum ArticleEndPoint {
  case articleFetch(queryParams: StringArr?)
}

extension ArticleEndPoint: EndPoint {

    var host: String {
        "newsapi.org"
    }

    var path: String {
        "/v2/top-headlines"
    }
    
    var method: RequestType {
        return .get
    }
    
    var header: StringArr? {
        return ["Content-Type": "application/json"]
    }
    
    var body: StringArr? {
        return nil
    }
    
    var queryParams: StringArr? {
        switch self {
        case .articleFetch(queryParams: let queryParams):
            return queryParams
        }
    }
    
    var pathParams: StringArr? {
        switch self {
        case .articleFetch(queryParams: let queryParams):
            return queryParams
        }
    }
}
