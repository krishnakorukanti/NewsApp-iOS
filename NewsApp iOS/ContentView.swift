//
//  ContentView.swift
//  NewsApp iOS
//
//  Created by sai krishna korukanti on 17/03/22.
//

import SwiftUI

struct ContentView: View {
    
@ObservedObject var articleListViewModel = ArticleListViewModel()
    var body: some View {
        VStack {
            Button {
                articleListViewModel.fetchTopHeadline()
            } label: {
                Text("Fetch News")
            }
            ScrollView{
                ForEach(articleListViewModel.articles){
                    article in
                    
                    ZStack {
                        
                        Color.gray
                        VStack(alignment: .leading){
                            AsyncImage(url: URL(string: article.imageUrl)){image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }.frame(width: .infinity, height: 300, alignment: .center)
                                .opacity(0.7)
                           Spacer()
                            Text(article.title)
                            Text(article.description).foregroundColor(Color.accentColor).lineLimit(3)
                          
                        
                        }.padding()
                    }
                }
            }
           
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
