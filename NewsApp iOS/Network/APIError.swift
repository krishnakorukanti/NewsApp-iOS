//
//  APIError.swift
//  NewsApp iOS
//
//  Created by sai krishna korukanti on 22/03/22.
//

import Foundation

enum APIError : Error{
    case decodingError
    case errorCode(Int)
    case unkown
}

extension APIError : LocalizedError{
    var errorDescription: String?{
        switch self {
        case .decodingError:
            return "Failed To Decode the Response from service"
        case .errorCode(let code):
            return "\(code) - Something went wrong"
        case .unkown:
            return "Unkown Error"
        }
    }
}
