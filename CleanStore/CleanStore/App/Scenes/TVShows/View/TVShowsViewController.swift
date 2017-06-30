//
//  TVShowsViewController.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol TVShowsViewControllerInput: TVShowsPresenterOutput {

}

protocol TVShowsViewControllerOutput {

    func doSomething()
}

final class TVShowsViewController: UIViewController {

    var output: TVShowsViewControllerOutput!
    var router: TVShowsRouterProtocol!
    
    var tvShowsBackgrounColor: UIColor = UIColor(red: 22.0/255.0, green: 23.0/255.0, blue: 27.0/255.0, alpha: 0.95)
    var tvShowsForegroundColor: UIColor = UIColor(red: 26.0/255.0, green: 206.0/255.0, blue: 239.0/255.0, alpha: 1)

    lazy var tvShowsTableView: UITableView = { [unowned self] in
        
        var tableView = UITableView()
        tableView.register(TVShowsTableViewCell.nib, forCellReuseIdentifier: TVShowsTableViewCell.nibName)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.estimatedRowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = self.tvShowsBackgrounColor
        tableView.tableHeaderView = self.segmentControl
        
        return tableView
    }()
    
    
    lazy var segmentControl: TZSegmentedControl = { [unowned self] in
        let titleCont = TZSegmentedControl(sectionTitles: ["", "FOR YOU", "TOP","ACTION", "COMEDY", "FAMILY" , "ENGLISH", "VIDEO EPIC"])
        titleCont.frame = CGRect(x: 0, y: 50, width: self.view.frame.width, height: 50)
        titleCont.indicatorWidthPercent = 1.5
        titleCont.backgroundColor = self.tvShowsBackgrounColor
        titleCont.borderType = .none
        titleCont.borderColor = self.tvShowsBackgrounColor
        titleCont.borderWidth = 2.0
        titleCont.segmentWidthStyle = .dynamic
        titleCont.verticalDividerEnabled = false
        titleCont.verticalDividerWidth = 0
        titleCont.verticalDividerColor = self.tvShowsBackgrounColor
        titleCont.selectionStyle = .fullWidth
        titleCont.selectionIndicatorLocation = .down
        titleCont.selectionIndicatorColor = self.tvShowsForegroundColor
        titleCont.selectionIndicatorHeight = 4.0
        titleCont.edgeInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        titleCont.selectedTitleTextAttributes = [NSForegroundColorAttributeName: self.tvShowsForegroundColor]
        titleCont.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white,
                                         NSFontAttributeName:UIFont(name: "Lato-Bold", size: 11.0) ?? UIFont.systemFont(ofSize: 11)]
        return titleCont
        }()
    // MARK: - Initializers

    init(configurator: TVShowsConfigurator = TVShowsConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: TVShowsConfigurator = TVShowsConfigurator.sharedInstance) {

        configurator.configure(viewController: self)
    }


    // MARK: - View lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()

        title = "TV SHOWS"
        configureControllerWhenLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureControllerWhenAppear()
    }


    // MARK: - Load data

    func doSomethingOnLoad() {

        // TODO: Ask the Interactor to do some work

        output.doSomething()
    }
    
    func configureControllerWhenLoad() {
        
        constraintsLayoutTableView()
        configureRightMenuBarButton()
    }
    
    func configureControllerWhenAppear() {
        navigationController?.navigationBar.barTintColor = tvShowsBackgrounColor
        navigationController?.navigationBar.tintColor = tvShowsForegroundColor
        navigationController?.navigationBar.isTranslucent = false
        
        tabBarController?.tabBar.barTintColor = tvShowsBackgrounColor
        tabBarController?.tabBar.tintColor = tvShowsForegroundColor
        
        title = "TV SHOWS"
        
        guard let latoBoldFont = UIFont(name: "Lato-Bold", size: 15) else {
            return
        }
        navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName : latoBoldFont,
            NSForegroundColorAttributeName: tvShowsForegroundColor
        ]
    }
    
    
    func configureRightMenuBarButton() {
        let mainMenuImage = UIImage(named: "artboard_ico")
        let mainMenuBarButton = UIBarButtonItem(image: mainMenuImage, style: .plain, target: self, action: #selector(MainMenuTapped))
        
        //optionButton.action = something (put your action here)
        self.navigationItem.leftBarButtonItem = mainMenuBarButton
    }
    
    
    func MainMenuTapped(sender: UIButton) {
        
    }
}


// MARK: - TVShowsPresenterOutput

extension TVShowsViewController: TVShowsViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: TVShowsViewModel) {

        // TODO: Update UI
    }
}

extension TVShowsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func constraintsLayoutTableView() {
        [tvShowsTableView].forEach {
            self.view.addSubview($0)
        }
        
        let attributes: [NSLayoutAttribute] = [.top, .left, .bottom, .right]
        for attribute in attributes {
            view.addConstraint(NSLayoutConstraint(item: self.tvShowsTableView, attribute: attribute, relatedBy: .equal, toItem: view, attribute: attribute, multiplier: 1, constant: 0))
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TVShowsTableViewCell.nibName, for: indexPath) as! TVShowsTableViewCell
        return cell
    }
}
