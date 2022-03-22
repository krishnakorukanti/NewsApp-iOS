//
//  ArticleView.swift
//  NewsApp iOS
//
//  Created by sai krishna korukanti on 22/03/22.
//

import SwiftUI

struct ArticleView: View {
    let article : Article
    var body: some View {
        HStack{
            if let imageUrl = article.urlToImage,
               let url = URL(string: imageUrl){
                AsyncImage(url: url){ image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                
                }placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100, alignment: .center)
                .cornerRadius(10)
            }else {
                PlaceHolderImageView()
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title ?? "No Title")
                    .foregroundColor(.black)
                    .font(.system(size: 18,weight: .semibold))
                Text(article.source?.name ?? "N/A")
                    .foregroundColor(.gray)
                    .font(.footnote)
                
            }
        }
    }
}

struct PlaceHolderImageView : View{
    var body: some View{
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100, height: 100, alignment: .center)
    }
}
struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article : Article.dummyData)
            .previewLayout(.sizeThatFits)
    }
}
