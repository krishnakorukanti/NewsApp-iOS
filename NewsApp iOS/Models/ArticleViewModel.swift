//
//  ArticleViewModel.swift
//  NewsApp iOS
//
//  Created by sai krishna korukanti on 21/03/22.
//

import Foundation
class ArticleViewModel : Identifiable{
    let id = UUID()
    let article: Article
    
    init(article: Article) {
            self.article = article
        }
    var title: String {
  
          return self.article.title ?? " No Title"
      }
      
      var description: String {
          return self.article.articleDescription ?? "No Description"
      }
    var imageUrl : String{
        return self.article.urlToImage ?? ""
    }
   
    var content : String {
        return self.article.content ?? "No Content"
    }
   
}
