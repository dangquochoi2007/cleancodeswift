//
//  SignUpViewController.swift
//  CleanStore
//
//  Created by hoi on 16/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

protocol SignUpViewControllerInput: SignUpPresenterOutput {

}

protocol SignUpViewControllerOutput {

    func doSomething()
}

final class SignUpViewController: UIViewController, KeyboardMovable {

    var output: SignUpViewControllerOutput!
    var router: SignUpRouterProtocol!
    
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    

    
    @IBOutlet weak var signinButton: KBRoundedButton!
    
    
    // MARK: Keyboard movable
    var scrollAbleView: UIScrollView?
    var selectedField: UITextField?
    var offset: CGFloat = 0.0


    // MARK: - Initializers

    init(configurator: SignUpConfigurator = SignUpConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: SignUpConfigurator = SignUpConfigurator.sharedInstance) {

        configurator.configure(viewController: self)
    }


    // MARK: - View lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()

        initKeyboardMover()
        customizeAppearance()
        
        doSomethingOnLoad()
    }


    // MARK: - Load data

    func doSomethingOnLoad() {

        // TODO: Ask the Interactor to do some work

        output.doSomething()
    }
    
    
    func customizeAppearance() {
        configureTextFieldFromSource()
    }
}


// MARK: - SignUpPresenterOutput

extension SignUpViewController: SignUpViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: SignUpViewModel) {

        // TODO: Update UI
    }
}


extension SignUpViewController: UITextFieldDelegate {
    
    func configureTextFieldFromSource() {
        emailTextField.delegate = self
        nameTextField.delegate = self
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        selectedField = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        let nextResponder = view.viewWithTag(nextTag) as UIResponder!
        
        if nextResponder != nil {
            nextResponder?.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
}
