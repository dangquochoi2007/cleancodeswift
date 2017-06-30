//
//  SVMenuOptionManager.swift
//  CleanStore
//
//  Created by hoi on 30/6/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import Foundation
import UIKit

enum SVMenuOptions {
    case Audi
    case BMW
    case Honda
    case Tata
    case Toyota
    case Suzuki
    case Nissan
    case Volkswagen
    case Volvo
    case Jaguar
    case Fiat
    case Ford
    
    var menuTitle: String {
        
        return String(describing: self)
    }
    
}

class SVMenuOptionManager: NSObject {
    
    static let sharedInstance = SVMenuOptionManager()
    
    let slidingPanel: SVSlidingPanelViewController
    
    
    override init() {
        
        self.slidingPanel = SVSlidingPanelViewController()
        
        super.init()
   
    
       
        let  lefthamburgerMenuController = SVMenuViewController()
        
        
        self.slidingPanel.leftPanel = lefthamburgerMenuController
    
        
        
        lefthamburgerMenuController.menuSelectionClosure = {[weak self](selectedMenuOption: SVMenuOptions, animated:Bool) in
            
            self?.showScreenForMenuOption(menuOntion: selectedMenuOption, animation: animated)
        }
        
    }
    
    func showScreenForMenuOption(menuOntion: SVMenuOptions, animation animated: Bool) {
        self.slidingPanel.showCenterPanel(animated: animated)
        
    }
}
