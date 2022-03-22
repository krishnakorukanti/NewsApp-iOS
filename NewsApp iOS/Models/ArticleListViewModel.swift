//
//  ArticleListViewModel.swift
//  NewsApp iOS
//
//  Created by sai krishna korukanti on 21/03/22.
//

import Foundation
class ArticleListViewModel: ObservableObject {
    
    
    
    init(){
        
        fetchTopHeadline()
        
    }
    
    @Published var articles:[ArticleViewModel] = [ArticleViewModel]()
    //= [.init(article: Article(source: Source(id: "id", name: "name"), author: nil, title: "Title1", articleDescription: "Description1", url: "nil", urlToImage: "nil", content: "nil"))]
    
     func fetchTopHeadline(){
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=in&apiKey=20e452494c374bf49d47b33a13c59fc1")
        else{
            fatalError("Url is incorrect!")
        }
        
        APIService().loadTopHeadlines(url: url){
            articles in
            
            if let articles = articles {
                self.articles = articles.map(ArticleViewModel.init)
               
            }
        }
    }
}
