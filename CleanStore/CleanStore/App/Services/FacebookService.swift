//
//  FacebookService.swift
//  CleanStore
//
//  Created by hoi on 16/6/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import Foundation
import FBSDKLoginKit


public typealias FacebookCompletion = (SocialResult) -> Void

public enum SocialResult {
    
    case success(SocialProfile)
    case error(Error)
    case missingPermissions
    case unknownError
    case cancelled
}

public struct SocialProfile {
    
    public let socialId: String
    public let socialToken: String
    public let firstName: String
    public let lastName: String
    public let email: String
    
    public var fullName: String {
        return firstName + " " + lastName
    }
}


public class FacebookService {
    
    let loginManager: FBSDKLoginManager = {
        
        let manager = FBSDKLoginManager()
        manager.loginBehavior = FBSDKLoginBehavior.systemAccount
        return manager
    }()
    
    
    let permissions = ["email", "public_profile"]
    
    public func login(from viewcontroller: UIViewController, completion: @escaping FacebookCompletion) {
        
        loginManager.logIn(withReadPermissions: permissions, from: viewcontroller) { (result, error) in
            
            guard let result = result else {
                
                if let error = error {
                    
                    print("Facebook login: Error")
                    print(error)
                    completion(.error(error))
                } else {
                    print("Facebook login: Missing result")
                    completion(.unknownError)
                }
                return
            }
            
            if result.isCancelled {
                print("Facebook login: cancelled")
                completion(.cancelled)
            } else {
                print("Facebook login: Success")
                print("Permissions: \(result.grantedPermissions)")
                
                if (result.grantedPermissions.contains("email") && result.grantedPermissions.contains("public_profile")) {
                    
                    print("Facebook login: Permission granted")
                    self.getUserInfo(loginResult: result, completion: completion)
                } else {
                    print("Facebook login: Missing required permission")
                    completion(.missingPermissions)
                }
            }
        }
    }
    
    
    
    public func getUserInfo(loginResult: FBSDKLoginManagerLoginResult, completion: @escaping FacebookCompletion) {
        
        guard FBSDKAccessToken.current() != nil else {
            print("Facebook: Not logged in: Abort")
            completion(.unknownError)
            return
        }
        
        let params = ["fields": "id, name, email"]
        
        let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: params)
        _ = graphRequest?.start { (connection, result, error) in
            
            guard let userData = result as? [String: String] else {
                
                if let error = error {
                    print("Facebook: Graph request: Error")
                    completion(.error(error))
                } else {
                    
                    print("Facebook: Graph request: Missing Result")
                    completion(.unknownError)
                }
                return
            }
            
            guard let facebookId = userData["id"], let fullName = userData["name"], let email = userData["email"] else {
                
                print("Facebook: Graph request: Missing data")
                completion(.unknownError)
                return
            }
            
            let fullNameArray = fullName.components(separatedBy: " ")
            guard let firstName = fullNameArray.first, let lastName = fullNameArray.last else {
                
                print("Facebook: Graph request: Missing Data")
                completion(.unknownError)
                return
            }
            
            let facebookToken = loginResult.token.tokenString as String
            print("Facebook: Graph Request: Success")
            
            let profile = SocialProfile(socialId: facebookId, socialToken: facebookToken, firstName: firstName, lastName: lastName, email: email)
            completion(.success(profile))
        }
    }
    
    public func logout() {
        loginManager.logOut()
    }
}

