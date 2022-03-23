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

enum NewsAPI : String{
   
    case getIndianNews = "in"
    case getUsNews = "us"
    case getRussianNews = "ru"
    case getPhillipNews = "ph"
    case getCanadaNews = "ca"
    case getNzNews = "nz"
    case getSANews = "sa"
    case getAusNews = "au"
    
    var countryName : String{
        switch self {
        case .getIndianNews:
            return "India"
        case .getUsNews:
            return "USA"
        case .getRussianNews:
            return "Russia"
        case .getPhillipNews:
            return  "Phillip"
        case .getCanadaNews:
            return "Canada"
        case .getNzNews:
            return "New Zealand"
        case .getSANews:
            return  "South Africa"
        case .getAusNews:
            return "Austraila"
        }
    }
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
            URLQueryItem(name: "country", value: self.rawValue),
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
  
    case .getIndianNews:
            return  URL(string:"https://newsapi.org")!
    case .getUsNews:
            return  URL(string:"https://newsapi.org")!
        default : return  URL(string:"https://newsapi.org")!
    }
    }
    }

