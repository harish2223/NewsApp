//
//  HeadlineViewCell.swift
//  NewsApp
//
//  Created by Harish on 26/07/24.
//

import SwiftUI

struct HeadlineViewCell: View {
    
    let articleData : Article
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.linearGradient(colors: [Color(.systemGray5), Color(.lightGray)], startPoint: .leading, endPoint: .trailing))
                .opacity(0.9)
                .frame(height: 140)
            
            HStack {
                AsyncImage(url: URL(string: articleData.urlToImage ?? Constants.dummyImage)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipped()
                        .cornerRadius(25)
                } placeholder: {
                    ProgressView()
                        .frame(width: 40, height: 40)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(articleData.title)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    HStack(spacing: 8) {
                        Text(articleData.description ?? "")
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black)
                            .lineLimit(2)
                    }
                    HStack(spacing: 8) {
                        Text(articleData.publishedAt)
                            .foregroundColor(.black)
                    }
                }
                .font(.system(size: 14))
                .padding()
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .leading
                )
                Spacer()
            }
            .frame(height: 140)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        
    }
}

#Preview {
    HeadlineViewCell(articleData: .dummyArticle())
}
