//
//  Feed.swift
//  Rizzle App
//
//  Created by Johnny Sheffer on 1/18/21.
//

import Foundation

struct FeedElement: Codable {
    let title: String
    let nodes: [Node]
}

struct Node: Codable {
    let video: Video
}

struct Video: Codable {
    let encodeURL: String

    enum CodingKeys: String, CodingKey {
        case encodeURL = "encodeUrl"
    }
}

typealias Feed = [FeedElement]


