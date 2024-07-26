//
//  TopHeadlinesView.swift
//  NewsApp
//
//  Created by APPLE on 26/07/24.
//

import SwiftUI

struct TopHeadlinesView: View {
    @ObservedObject var viewModel: TopheadlinesViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(viewModel.articles, id: \.id) { item in
                    NavigationLink(destination: HeadlineDetailView(articleData: item)) {
                        HeadlineViewCell(articleData: item)
                    }
                }
            }
            .background(.white)
            .navigationTitle(UIConstants.navigationTitle)
            .navigationBarTitleDisplayMode(.automatic)
        }
        .task {
            await viewModel.getTopHeadlines()
        }
        
    }
}

#Preview {
    TopHeadlinesView(viewModel: TopheadlinesViewModel())
}
