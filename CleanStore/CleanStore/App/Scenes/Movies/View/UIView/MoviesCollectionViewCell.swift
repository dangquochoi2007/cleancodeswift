//
//  MoviesCollectionViewCell.swift
//  CleanStore
//
//  Created by hoi on 28/6/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {
    
    
    lazy var moviesImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "film"))
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    
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
        
        for view in [moviesImageView] {
            view.contentMode = .scaleAspectFill
            view.translatesAutoresizingMaskIntoConstraints = false
            view.clipsToBounds = true
            contentView.addSubview(view)
        }
        
        let attributes: [NSLayoutAttribute] = [.top, .left, .bottom, .right]
        for attribute in attributes {
            contentView.addConstraint(NSLayoutConstraint(item: moviesImageView, attribute: attribute, relatedBy: .equal, toItem: contentView, attribute: attribute, multiplier: 1, constant: 0))
        }
    }
}
