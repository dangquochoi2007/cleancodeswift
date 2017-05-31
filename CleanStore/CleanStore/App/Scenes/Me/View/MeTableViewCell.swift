//
//  MeTableViewCell.swift
//  CleanStore
//
//  Created by hoi on 30/5/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import UIKit

extension UIView {
    class var nibName: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: self.nibName, bundle: nil)
    }
}

class MeTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
