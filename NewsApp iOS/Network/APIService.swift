//
//  APIService.swift
//  NewsApp iOS
//
//  Created by sai krishna korukanti on 17/03/22.
//

import Foundation
import Combine

class APIService{
    func loadTopHeadlines(url : URL, completion : @escaping ([Article]?)->()){
        URLSession.shared.dataTask(with: url){
            (data,resp,error) in
            guard let data = data, error == nil else{
                completion(nil)
                return
            }
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601
            let response = try? JSONDecoder().decode(NewsData.self, from: data)
            if let response = response{
                DispatchQueue.main.async {
                    completion(response.articles)
                }
            }
        }.resume()
    }
}

protocol NewsService{
    func request(from endpoint : NewsAPI) -> AnyPublisher<NewsData,APIError>
}

struct NewsServiceImpl : NewsService{
    func request(from endpoint: NewsAPI) -> AnyPublisher<NewsData, APIError> {
        return URLSession.shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError{_ in APIError.unkown}
            .flatMap{
                data,response -> AnyPublisher<NewsData,APIError> in
                guard let response = response as? HTTPURLResponse else{
                    return Fail(error: APIError.unkown).eraseToAnyPublisher()
                }
                if (200...299).contains(response.statusCode){
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    return Just(data)
                        .decode(type: NewsData.self, decoder: jsonDecoder)
                        .mapError{_ in APIError.decodingError}
                        .eraseToAnyPublisher()
                }else{
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
        
    }
}
