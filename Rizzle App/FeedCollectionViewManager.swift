//
//  FeedCollectionViewManager.swift
//  Rizzle App
//
//  Created by Johnny Sheffer on 1/18/21.
//

import Foundation
import UIKit

final class FeedCollectionViewManager: NSObject, UICollectionViewDelegate {
    
    var cellViewModels = [FeedCellViewModel]() {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    private weak var collectionView: UICollectionView?
    
    func configure(collectionView: UICollectionView) {
        self.collectionView = collectionView
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension FeedCollectionViewManager: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FeedCollectionViewCell.self), for: indexPath) as? FeedCollectionViewCell else {
            fatalError("Unable to dequeue a FeedCell.")
        }
        
        let cellViewModel = cellViewModels[indexPath.item]
        
        cellViewModel.configure(cell: cell)
        return cell
    }
}

extension FeedCollectionViewManager: UICollectionViewDelegateFlowLayout {
    func spaceVertically() {

    }

    func spaceHorizontally() {

    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 87.5)
    }

}




