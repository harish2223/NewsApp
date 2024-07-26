//
//  TopHeadlinesVewModelTest.swift
//  NewsAppTests
//
//  Created by APPLE on 26/07/24.
//

import XCTest
@testable import NewsApp
final class TopHeadlinesVewModelTest: XCTestCase {

    // assigning ViewModel to variable sut
    var sut: TopheadlinesViewModel!
    
    @MainActor override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut  = TopheadlinesViewModel(getHeadlinesObject: TopHeadlinesService(networkService: MockServiceable()))
    }

    override func tearDownWithError() throws {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Testing the fetch topheadline news with test data
    func testFetchArticlesAsync() async {
        var articles = await sut.articles
        await sut.getTopHeadlines()
        articles = await sut.articles
        XCTAssertGreaterThan(articles.count, 0, "")
        XCTAssertEqual(articles.first?.title, "Paypal is the latest tech company to announce layoffs - Axios")
    }
    // Testing the fetch Articles with test data
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            Task(priority: .background, operation:  {
                await sut.getTopHeadlines()
            })
        }
    }

}
final class MockServiceable: Networkable {
    func sendRequest<T>(endpoint: NewsApp.EndPoint) async throws -> T where T : Decodable {
        let articleData = TopHeadlinesModel.dummyTopHeadlineModelData()
        guard let article = articleData as? T else {
            fatalError("Not articleData we are expecting")
        }
        return article
    }
}
