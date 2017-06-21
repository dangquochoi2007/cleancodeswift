//
//  SignUpConfigurator.swift
//  CleanStore
//
//  Created by hoi on 16/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

final class SignUpConfigurator {

    // MARK: Public Configuration
    public var backgroundImage = UIImage()
    public var mainLogoImage = UIImage()
    public var secondaryLogoImage = UIImage()
    
    public var tintColor: UIColor = UIColor(red: 185.0/255.0, green: 177.0/255.0, blue: 216.0/255.0, alpha: 1)
    public var errorTintColor: UIColor = UIColor(red: 241.0/255.0, green: 196.0/255.0, blue: 15.0/255.0, alpha: 1)
    
    public var signupButtonText = "Sign Up"
    public var emailPlaceHolder = "Email"
    public var passwordPlaceHolder = "Password"
    public var repeatPasswordPlaceHolder = "Repeat Password"
    public var namePlaceHolder = "Full Name"

    // MARK: - Singleton

    static let sharedInstance: SignUpConfigurator = SignUpConfigurator()


    // MARK: - Configuration

    func configure(viewController: SignUpViewController) {

        let router = SignUpRouter(viewController: viewController)
        let presenter = SignUpPresenter(output: viewController)
        let interactor = SignUpInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
