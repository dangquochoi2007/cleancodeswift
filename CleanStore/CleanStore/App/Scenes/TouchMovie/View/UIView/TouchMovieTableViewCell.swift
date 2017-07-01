//
//  TouchMovieTableViewCell.swift
//  CleanStore
//
//  Created by QuocHoi on 1/7/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import UIKit

enum TouchMovieCellPosition {
    case Top
    case Left
    case Bottom
    case Right
}

class TouchMovieTableViewCell: UITableViewCell {
    
    @IBOutlet var touchIconImageView: UIImageView!
    
    @IBOutlet var touchActionLabel: UILabel!
    
    
    var touchAction: TouchMovieAction? {
        didSet {
            if let imageName = touchAction?.touchMovieIcon {
                let image = UIImage(named: imageName)
                touchIconImageView.image = image
            }
            touchActionLabel.text = touchAction?.touchMovieAction
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addShadowWhenLoad()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func addShadowWhenLoad(shadowColor: CGColor = UIColor.black.cgColor,
                   shadowOffset: CGSize = CGSize(width: 1.0, height: 2.0),
                   shadowOpacity: Float = 0.4,
                   shadowRadius: CGFloat = 4.0) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
    
    
    
}
