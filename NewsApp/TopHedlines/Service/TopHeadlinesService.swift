//
//  TopHeadlinesService.swift
//  NewsApp
//
//  Created by Harish on 26/07/24.
//

import Foundation

protocol FetchTopHeadlinesServiceProtocol {
    func getTopHeadlines() async throws -> Articles
}

struct TopHeadlinesService {
    
    private let networkService: Networkable
    
    init(networkService: Networkable = NetworkService()) {
        self.networkService = networkService
    }
}

extension TopHeadlinesService : FetchTopHeadlinesServiceProtocol {
    func getTopHeadlines() async throws -> Articles {
        let queryParams: StringArr = ["country": "us",
                                      "category":"business",
                                      "apiKey": "\(Constants.APIKey)"]
        
        let articleData = try await networkService.sendRequest(endpoint: TopHeadlinesEndPoint.articleFetch(queryParams: queryParams)) as TopHeadlinesModel
        
        guard articleData.articles.isNotEmpty else {
            throw NetworkError.decode
        }
        return articleData.articles
    }
}
