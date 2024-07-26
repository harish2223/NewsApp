//
//  TopHeadlinesViewModel.swift
//  NewsApp
//
//  Created by Harish on 26/07/24.
//

import Foundation

@MainActor
final class TopheadlinesViewModel: ObservableObject {
    @Published var articles: Articles = Articles()
    @Published var error: NetworkError?
    var errorMessage: String {
        error?.customMessage ?? ""
    }
    private var getTopHeadlineServiceObject: FetchTopHeadlinesServiceProtocol
    init(getHeadlinesObject: FetchTopHeadlinesServiceProtocol = TopHeadlinesService()) {
        self.getTopHeadlineServiceObject = getHeadlinesObject
        Task(priority: .background, operation: {
            await getTopHeadlines()
        })
    }
}

extension TopheadlinesViewModel {
    func getTopHeadlines() async {
        do {
            let articleData = try await getTopHeadlineServiceObject.getTopHeadlines()
            articles = articleData.sorted {
                $0.articleAuthor < $1.articleAuthor
            }
            debugPrint("API Data:\(articles)")
        } catch {
            self.error = error as? NetworkError
        }
    }
}
