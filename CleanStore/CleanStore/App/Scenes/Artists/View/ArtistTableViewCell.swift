//
//  ArtistTableViewCell.swift
//  CleanStore
//
//  Created by hoi on 1/6/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    // MARK: - Initializers
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Setup
    func setup() {
        // Abstract method.
        
    }
    
    func setupConstraints() {
        // Abstract method.
    }
    
    
    // MARK: - Reuse Identifier
    class func reuseIdentifier() -> String {
        return NSStringFromClass(self)
    }
    
}


final class ArtistTableViewCell: BaseTableViewCell {

    

}
