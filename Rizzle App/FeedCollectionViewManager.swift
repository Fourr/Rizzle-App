//
//  FeedCollectionViewManager.swift
//  Rizzle App
//
//  Created by Johnny Sheffer on 1/18/21.
//

import Foundation
import UIKit

final class FeedCollectionViewManager: NSObject, UICollectionViewDelegate {
    
    //let collectionViewHeaderReuseIdentifier = "MyHeaderClass"
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
//    func collectionView(_ collectionView: UICollectionView,
//                        viewForSupplementaryElementOfKind kind: String,
//                        at indexPath: IndexPath) -> UICollectionReusableView {
//
//        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: collectionViewHeaderReuseIdentifier, for: indexPath) as! MyHeaderFooterClass
//            headerView.titleLabel.textColor = UIColor.black
//            headerView.backgroundColor = UIColor.white
//            headerView.titleLabel.text = "Explore"
//            return headerView
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: 100, height: 87.5)
//    }
        
}

extension FeedCollectionViewManager: UICollectionViewDelegateFlowLayout {
    func spaceVertically() {

    }

    func spaceHorizontally() {

    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 250)
    }
    

}




