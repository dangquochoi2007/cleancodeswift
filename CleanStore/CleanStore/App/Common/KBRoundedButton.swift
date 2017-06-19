//
//  KBRoundedButton.swift
//  CleanStore
//
//  Created by hoi on 19/6/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import UIKit

enum KBRoundedButtonBorder: Int {
    
    case all
    case top
    case bottom
    case left
    case right
    case topBottom
    case leftRight
}

@IBDesignable class KBRoundedButton: UIButton {
    
    @IBInspectable var shadowEnabled: Bool = false
    @IBInspectable var working: Bool = false
    
    
    @IBInspectable var backgroundColorForStateNormal: UIColor = UIColor.clear {
        didSet {
        }
    }
    @IBInspectable var backgroundColorForStateSelected: UIColor = UIColor.clear
    @IBInspectable var backgroundColorForStateHighlighted: UIColor = UIColor.clear
    @IBInspectable var backgroundColorForStateSelectedAndHighlighted: UIColor = UIColor.clear
    @IBInspectable var backgroundColorForStateDisabled: UIColor = UIColor.clear
    
    @IBInspectable var titleColorForStateNormal:UIColor = UIColor.clear
    @IBInspectable var titleColorForStateSelected: UIColor = UIColor.clear
    @IBInspectable var titleColorForStateHighlighted: UIColor = UIColor.clear
    @IBInspectable var titleColorForStateSelectedAndHighlighted: UIColor = UIColor.clear
    @IBInspectable var titleColorForStateDisable: UIColor = UIColor.clear
    
    
    @IBInspectable var activityIndicator: UIActivityIndicatorView
    
}
