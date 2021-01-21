//
//  FeedCellViewModel.swift
//  Rizzle App
//
//  Created by Johnny Sheffer on 1/18/21.
//

import Foundation
import UIKit

struct FeedCellViewModel {
    private let realfeed: realFeed
    
    init(realfeed: realFeed) {
        self.realfeed = realfeed
    }
    
    func configure(cell: FeedCollectionViewCell) {
        cell.titleLabel.text = realfeed.title
        cell.image.image = realfeed.image
        cell.url = realfeed.url
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    

}
