//
//  FeedViewModel.swift
//  Rizzle App
//
//  Created by Johnny Sheffer on 1/18/21.
//

import Foundation
import UIKit
import AVKit
final class FeedViewModel {
    private let collectionViewManager = FeedCollectionViewManager()
    private let gatherService = GatherService()

    func fetchFeed() {
        guard let jsonreturn = gatherService.readLocalFile(forName: "assignment") else { return }
        guard let feedData = gatherService.getJSON(data: jsonreturn) else { return }
        let multirealfeedData = gatherService.ConvertToRealFeed(feed: feedData)
        let cellViewModels = multirealfeedData[3].map(FeedCellViewModel.init)
        self.collectionViewManager.cellViewModels = cellViewModels

    }
    
    func configure(collectionView: UICollectionView) {

        collectionView.register(UINib(nibName: "FeedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: FeedCollectionViewCell.self))
        collectionViewManager.configure(collectionView: collectionView)
    }
    
    
}

