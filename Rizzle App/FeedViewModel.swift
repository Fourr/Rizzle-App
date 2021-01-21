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
    //let collectionViewHeaderReuseIdentifier = "MyHeaderClass"

    func fetchFeed() {

        guard let jsonreturn = gatherService.readLocalFile(forName: "assignment") else { return }
        guard let feedData = gatherService.getJSON(data: jsonreturn) else { return }
        let realfeedData = gatherService.ConvertToRealFeed(feed: feedData)
        let cellViewModels = realfeedData.map(FeedCellViewModel.init)
        self.collectionViewManager.cellViewModels = cellViewModels

    }
    
    func configure(collectionView: UICollectionView) {

        collectionView.register(UINib(nibName: "FeedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: FeedCollectionViewCell.self))
//        collectionView.register(UINib(nibName: collectionViewHeaderReuseIdentifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:collectionViewHeaderReuseIdentifier)
        collectionViewManager.configure(collectionView: collectionView)
    }
    
    
}

