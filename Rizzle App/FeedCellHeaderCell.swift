//
//  FeedCellHeaderModel.swift
//  Rizzle App
//
//  Created by Johnny Sheffer on 1/21/21.
//

import UIKit

class MyHeaderFooterClass: UICollectionReusableView {
    var label: UILabel!
    @IBOutlet var titleLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel.textColor = UIColor.black

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

