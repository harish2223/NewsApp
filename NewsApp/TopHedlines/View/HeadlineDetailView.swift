//
//  HeadlineDetailView.swift
//  NewsApp
//
//  Created by Harish on 26/07/24.
//

import SwiftUI

struct HeadlineDetailView: View {
    
    var articleData : Article
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
        
                    AsyncImage(url: URL(string: articleData.urlToImage ?? Constants.dummyImage)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .cornerRadius(20)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 40, height: 40)
                    }
                    
                    Text(articleData.title)
                        .font(.headline)
                        .padding(.bottom)
                    
                    Text(articleData.content ?? "")
                        .font(.callout)
                        .padding(.bottom)
                    
                    Link("Read this news in detail", destination: URL(string: articleData.url ?? "")!)

                    
                }
            }
            .navigationTitle("News Details")
            .padding(.all
            )
        }
    }
}

#Preview {
    HeadlineDetailView(articleData: .dummyArticle())
}
