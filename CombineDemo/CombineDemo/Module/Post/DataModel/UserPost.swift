//
//  Post.swift
//  CombineDemo
//
//  Created by Santosh Kumar Singh on 13/03/23.
//

import Foundation

struct PostResponse: Decodable {
    let posts: [UserPost]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        posts = try container.decode([UserPost].self, forKey: CodingKeys.posts)
    }
    
    enum CodingKeys: String, CodingKey {
        case posts = "results"
    }
}

struct UserPost: Decodable {
    let title: String
    let body: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.body = try container.decode(String.self, forKey: .body)
    }
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case body = "description"
    }
}
