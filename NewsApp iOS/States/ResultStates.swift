//
//  ResultStates.swift
//  NewsApp iOS
//
//  Created by sai krishna korukanti on 22/03/22.
//

import Foundation

enum ResultState{
    case loading
    case success(content : [Article])
    case failed(error : Error)
}
