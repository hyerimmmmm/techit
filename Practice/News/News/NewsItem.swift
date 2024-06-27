//
//  NewsItem.swift
//  News
//
//  Created by 김혜림 on 6/21/24.
//

import Foundation

// 사용하려는 API에 있는 정보를 디코딩 하기 위한 준비
struct NewsItem: Codable, Identifiable {
    let id = UUID()
    let title: String
    let link: String
    let originallink: String
    let description: String
    let pubDate: String
    
    enum CodingKeys: String, CodingKey {
        case title, link, originallink, description, pubDate
    }
}

struct NewsResponse: Codable {
    let total: Int
    let items: [NewsItem]
}
