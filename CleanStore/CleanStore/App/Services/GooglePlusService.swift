//
//  GooglePlusService.swift
//  CleanStore
//
//  Created by hoi on 16/6/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import Foundation
import Firebase
import GoogleSignIn

// https://github.com/xeieshan/GoogleLoginManager/blob/master/GoogleLoginManager/GoogleLoginManagerSwift.swift

public typealias GoogleSignInCompletion = (SocialResult) -> Void

public final class GooglePlusService  {
    
    let loginManager: GIDSignIn? = {
        
        var manager = GIDSignIn.sharedInstance()
        return manager
    }()
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        
    }
}
