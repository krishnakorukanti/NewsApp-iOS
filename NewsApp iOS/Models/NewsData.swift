//
//  NewsData.swift
//  NewsApp iOS
//
//  Created by sai krishna korukanti on 17/03/22.
//

import Foundation
// MARK: - NewsData
struct NewsData: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable,Identifiable {
    let id = UUID()
    let source: Source?
    let author: String?
    let title: String?
    let articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: Date?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}

extension Article{
    static var dummyData : Article{
        .init(source: Source(id: nil, name: "Hindustan Times"), author: nil, title: "Gully Boy rapper MC Tod Fod dies at 24, Ranveer Singh and Siddhant Chaturvedi are heartbroken - Hindustan Times", articleDescription: "Gully Boy rapper Dharmesh Parmar, better known as MC Tod Fod, died at the age of 24. Ranveer Singh and Siddhant Chaturvedi have mourned his death.  | Bollywood", url: "https://www.hindustantimes.com/entertainment/bollywood/gully-boy-rapper-mc-tod-fod-dies-at-24-ranveer-singh-and-siddhant-chaturvedi-are-heartbroken-101647917652290.html", urlToImage: "https://images.hindustantimes.com/img/2022/03/22/1600x900/gully-boy-rapper_1647918937056_1647918946842.jpg", publishedAt: Date(), content: "Gully Boy actors Ranveer Singh and Siddhant Chaturvedi have mourned the death of Dharmesh Parmar better known as rapper MC Tod Fod. He died at the age of 24. He had lent his voice to the song India 9… [+1811 chars]")
    }
}
