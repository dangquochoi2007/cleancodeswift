//
//  ProfileSettingsHeaderView.swift
//  CleanStore
//
//  Created by hoi on 4/7/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import UIKit


class ProfileSettingsHeaderView: UIView {
    
    let profileForegroundColor = UIColor(red: 159.0/255.0, green: 86.0/255.0, blue: 220.0/255.0, alpha: 1)
    let profileBackgroundColor = UIColor(red: 22.0/255.0, green: 23.0/255.0, blue: 27.0/255.0, alpha: 0.95)
    @IBOutlet weak var profileSegmentControl: TZSegmentedControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureViewWhenLoad()
        
    }
    
    func configureViewWhenLoad() {
        profileSegmentControl.indicatorWidthPercent = 1.5
        profileSegmentControl.backgroundColor = profileBackgroundColor
        profileSegmentControl.borderType = .none
        profileSegmentControl.borderColor = self.profileBackgroundColor
        profileSegmentControl.borderWidth = 2.0
        profileSegmentControl.segmentWidthStyle = .dynamic
        profileSegmentControl.verticalDividerEnabled = false
        profileSegmentControl.verticalDividerWidth = 0
        profileSegmentControl.verticalDividerColor = self.profileBackgroundColor
        profileSegmentControl.selectionStyle = .fullWidth
        profileSegmentControl.selectionIndicatorLocation = .down
        profileSegmentControl.selectionIndicatorColor = self.profileForegroundColor
        profileSegmentControl.selectionIndicatorHeight = 4.0
        profileSegmentControl.edgeInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        profileSegmentControl.selectedTitleTextAttributes = [NSForegroundColorAttributeName: self.profileForegroundColor]
        profileSegmentControl.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white,
                                         NSFontAttributeName:UIFont(name: "Lato-Bold", size: 11.0) ?? UIFont.systemFont(ofSize: 11)]
        profileSegmentControl.sectionTitles = ["", "FOR YOU", "TOP","ACTION", "COMEDY", "FAMILY" , "ENGLISH", "VIDEO EPIC"]
    }
    
}
