//
//  WatchListMoviesCollectionViewCell.swift
//  CleanStore
//
//  Created by hoi on 28/6/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import UIKit

class WatchListMoviesCollectionViewCell: UICollectionViewCell {

    
    lazy var moviesImageView:UIImageView = UIImageView(image: UIImage(named: "film"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViewWhenLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureViewWhenLoad()
    }
    
    
    func configureViewWhenLoad() {
        
        [moviesImageView].forEach {
            $0.contentMode = .scaleAspectFill
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.clipsToBounds = true
            contentView.addSubview($0)
        }
        
        let attributes: [NSLayoutAttribute] = [.top, .left, .bottom, .right]
        for attribute in attributes {
            contentView.addConstraint(NSLayoutConstraint(item: moviesImageView, attribute: attribute, relatedBy: .equal, toItem: contentView, attribute: attribute, multiplier: 1, constant: 0))
        }
    }

}
