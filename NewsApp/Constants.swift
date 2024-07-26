//
//  Constants.swift
//  NewsApp
//
//  Created by Harish on 26/07/24.
//

import Foundation

enum Constants {
    static  let APIKey = "32bf86f21a8f4edfadd14782b95ae1d9"
    static let dummyImage       = "https://img.freepik.com/free-vector/gradient-breaking-news-logo-design_23-2151136594.jpg?t=st=1721998249~exp=1722001849~hmac=abc4d68daa6a43952777edee4100a58c42957659d17e4108ce26d07ddef62371&w=1380"
}
struct UIConstants {
    static let navigationTitle = "News"
}
extension Collection {
    var isEmpty: Bool { startIndex == endIndex }
    var isNotEmpty: Bool { !isEmpty }
}
