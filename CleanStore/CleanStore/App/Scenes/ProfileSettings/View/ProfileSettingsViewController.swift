//
//  ProfileSettingsViewController.swift
//  CleanStore
//
//  Created by hoi on 16/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

// ## 0c0d0f
// ## 111215
// ## 9f56dc
protocol ProfileSettingsViewControllerInput: ProfileSettingsPresenterOutput {

}

protocol ProfileSettingsViewControllerOutput {

    func doSomething()
}

final class ProfileSettingsViewController: UIViewController {

    var output: ProfileSettingsViewControllerOutput!
    var router: ProfileSettingsRouterProtocol!

    @IBOutlet weak var profileSettingTableView: UITableView!

    // MARK: - Initializers

    init(configurator: ProfileSettingsConfigurator = ProfileSettingsConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: ProfileSettingsConfigurator = ProfileSettingsConfigurator.sharedInstance) {

        configurator.configure(viewController: self)
    }


    // MARK: - View lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()

        configureControllerWhenLoad()
    }


    // MARK: - Load data

    func doSomethingOnLoad() {

        // TODO: Ask the Interactor to do some work

        output.doSomething()
    }
    
    func configureControllerWhenLoad() {
        profileSettingTableView.delegate = self
        profileSettingTableView.dataSource = self
        profileSettingTableView.showsVerticalScrollIndicator = false
        profileSettingTableView.showsHorizontalScrollIndicator = false
        profileSettingTableView.register(ProfileSettingsTableViewCell.nib, forCellReuseIdentifier: ProfileSettingsTableViewCell.nibName)
        profileSettingTableView.rowHeight = UITableViewAutomaticDimension
        profileSettingTableView.estimatedRowHeight = 60
        profileSettingTableView.separatorStyle = .none
        
        if let profileSettingsHeaderView = ProfileSettingsHeaderView.fromNib() as? ProfileSettingsHeaderView {
            profileSettingsHeaderView.backButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            profileSettingTableView.tableHeaderView = profileSettingsHeaderView
        }
    
    }
    
    func buttonAction(sender: UIButton!) {
       dismiss(animated: true, completion: nil)
    }
}


// MARK: - ProfileSettingsPresenterOutput

extension ProfileSettingsViewController: ProfileSettingsViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: ProfileSettingsViewModel) {

        // TODO: Update UI
    }
}


extension ProfileSettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileSettingsTableViewCell.nibName, for: indexPath) as! ProfileSettingsTableViewCell
        
        return cell
    }
}
