//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Harish on 26/07/24.
//

import SwiftUI

@main
struct NewsAppApp: App {
    var body: some Scene {
        WindowGroup {
            TopHeadlinesView(viewModel: TopheadlinesViewModel())
        }
    }
}
