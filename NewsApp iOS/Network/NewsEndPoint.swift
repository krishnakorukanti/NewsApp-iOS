//
//  NewsEndPoint.swift
//  NewsApp iOS
//
//  Created by sai krishna korukanti on 22/03/22.
//

import Foundation
protocol APIBuilder{
    
    var urlRequest : URLRequest {get}
    var baseUrl : URL {get}
    var path : String {get}

}
// NEWS-API KEY  "
let NewsAPI_KEY = "20e452494c374bf49d47b33a13c59fc1"
//https://newsapi.org/v2/top-headlines?country=in&apiKey=20e452494c374bf49d47b33a13c59fc1

enum NewsAPI{
    case getNews
}

extension NewsAPI : APIBuilder{
    var path: String {
        return "/v2/top-headlines"
    }
    
    
    var urlRequest: URLRequest {
        var components = URLComponents()
           components.scheme = "https"
           components.host = "newsapi.org"
           components.path = "/v2/top-headlines"
           components.queryItems = [
            URLQueryItem(name: "country", value: "in"),
            URLQueryItem(name: "apiKey", value: NewsAPI_KEY)
           ]

           // Getting a URL from our components is as simple as
           // accessing the 'url' property.
        guard let url = components.url else {return URLRequest(url: baseUrl) }
       
        let request = URLRequest(url: url)
        return request
    }
    
    var baseUrl: URL {
        switch self {
        case .getNews:
            return  URL(string:"https://newsapi.org")!
                
    }
    
    
}
}
