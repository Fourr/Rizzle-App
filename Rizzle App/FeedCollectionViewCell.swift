//
//  FeedCollectionViewCell.swift
//  Rizzle App
//
//  Created by Johnny Sheffer on 1/19/21.
//

import UIKit

final class FeedCollectionViewCell: UICollectionViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var url: String!
    @IBOutlet var button: UIButton!
    @IBAction func ButtonPress(_ sender: Any) {
        NotificationCenter.default.post(name: .didReceiveData, object: url)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        //contentView.backgroundColor = .blue
        configureConstraints()
    }
    
    private func configureConstraints() {
    
    }
    
    private func configureStyle() {
        titleLabel.textColor = UIColor.white
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        image.image = nil

    }
    
}
