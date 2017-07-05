//
//  LiveTVTableViewCell.swift
//  CleanStore
//
//  Created by hoi on 28/6/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import UIKit


class LiveTVTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var coverImageView: UIImageView!
    
    var liveTv: LiveTV? {
        didSet {
            if let imageName = liveTv?.logo {
                coverImageView.image = UIImage(named: imageName)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureViewWhenLoad() {
    }
    
}
