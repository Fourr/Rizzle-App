//
//  Nodes.swift
//  Rizzle App
//
//  Created by Johnny Sheffer on 1/19/21.
//

import Foundation

//struct Node: Codable {
//  let video: encodeUrl
//
//  enum CodingKeys: String, CodingKey {
//    case video = "video"
//
//  }
//  init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//    self.video = try container.decode(encodeUrl.self, forKey: .video)
//  }
//  func encode(to encoder: Encoder) throws {
//    var container = encoder.container(keyedBy: CodingKeys.self)
//    try container.encode(self.video, forKey: .video)
//  }
//}
//struct encodeUrl: Codable {
//    let encodeUrl: String
//    enum CodingKeys: String, CodingKey {
//        case encodeUrl = "encodeUrl"
//
//    }
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.encodeUrl = try container.decode(String.self, forKey: .encodeUrl)
//
//    }
//    func encode(to encoder: Encoder) throws {
//      var container = encoder.container(keyedBy: CodingKeys.self)
//      try container.encode(self.encodeUrl, forKey: .encodeUrl)
//    }
//
//}

struct nFeed {
    let title: String
    let URL: String
}

