//
//  LiveTVViewController.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol LiveTVViewControllerInput: LiveTVPresenterOutput {

}

protocol LiveTVViewControllerOutput {

    func doSomething()
}

final class LiveTVViewController: UIViewController {

    var output: LiveTVViewControllerOutput!
    var router: LiveTVRouterProtocol!
    
    var liveTvList: [LiveTV] = LiveTVStore.shareInstance.items()
    
    var liveTVBackgroundColor: UIColor = UIColor(red: 22.0/255.0, green: 23.0/255.0, blue: 27.0/255.0, alpha: 1)
    var liveTVForegroundColor: UIColor = UIColor(red: 233.0/255.0, green: 205.0/255.0, blue: 38.0/255.0, alpha: 1)
    
    lazy var liveTVTableView: UITableView = { [unowned self] in
        var tableView = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        tableView.register(LiveTVTableViewCell.nib, forCellReuseIdentifier: LiveTVTableViewCell.nibName)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80
        tableView.backgroundColor = self.liveTVBackgroundColor
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.tableHeaderView = self.segmentControl
        return tableView
    }()
    
    
    lazy var segmentControl: TZSegmentedControl = { [unowned self] in
        let titleCont = TZSegmentedControl(sectionTitles: ["", "FOR YOU", "TOP","ACTION", "COMEDY", "FAMILY" , "ENGLISH", "VIDEO EPIC"])
        titleCont.frame = CGRect(x: 0, y: 50, width: self.view.frame.width, height: 50)
        titleCont.indicatorWidthPercent = 1.5
        titleCont.backgroundColor = self.liveTVBackgroundColor
        titleCont.borderType = .none
        titleCont.borderColor = self.liveTVBackgroundColor
        titleCont.borderWidth = 2.0
        titleCont.segmentWidthStyle = .dynamic
        titleCont.verticalDividerEnabled = false
        titleCont.verticalDividerWidth = 0
        titleCont.verticalDividerColor = self.liveTVBackgroundColor
        titleCont.selectionStyle = .fullWidth
        titleCont.selectionIndicatorLocation = .down
        titleCont.selectionIndicatorColor = self.liveTVForegroundColor
        titleCont.selectionIndicatorHeight = 4.0
        titleCont.edgeInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        titleCont.selectedTitleTextAttributes = [NSForegroundColorAttributeName: self.liveTVForegroundColor]
        titleCont.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white,
                                         NSFontAttributeName:UIFont(name: "Lato-Bold", size: 11.0) ?? UIFont.systemFont(ofSize: 11)]
        return titleCont
    }()
    
    


    // MARK: - Initializers

    init(configurator: LiveTVConfigurator = LiveTVConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: LiveTVConfigurator = LiveTVConfigurator.sharedInstance) {

        configurator.configure(viewController: self)
    }


    // MARK: - View lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()

        configureControllerWhenLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureControllerWhenAppear()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
      
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
        navigationController?.navigationBar.barTintColor = liveTVBackgroundColor
        navigationController?.navigationBar.tintColor = liveTVForegroundColor
        navigationController?.navigationBar.isTranslucent = false
        
        tabBarController?.tabBar.barTintColor = liveTVBackgroundColor
        tabBarController?.tabBar.tintColor = liveTVForegroundColor
  
        title = "LIVE TV"
        
        guard let latoBoldFont = UIFont(name: "Lato-Bold", size: 15) else {
            return
        }
        navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName : latoBoldFont,
            NSForegroundColorAttributeName: liveTVForegroundColor
        ]
    }
    
    
    func configureRightMenuBarButton() {
        
        if self.revealViewController() != nil {
            let mainMenuImage = UIImage(named: "artboard_ico")
            let mainMenuBarButton = UIBarButtonItem(image: mainMenuImage, style: .plain, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
            self.navigationItem.leftBarButtonItem = mainMenuBarButton
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
   
    
  
    
    
}


// MARK: - LiveTVPresenterOutput

extension LiveTVViewController: LiveTVViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: LiveTVViewModel) {

        // TODO: Update UI
    }
}


extension LiveTVViewController: UITableViewDelegate, UITableViewDataSource {
    
    func constraintsLayoutTableView() {
        [liveTVTableView].forEach {
            self.view.addSubview($0)
        }
        
        let attributes:[NSLayoutAttribute] = [.top, .left, .bottom, .right]
        for attribute in attributes {
            view.addConstraint(NSLayoutConstraint(item: self.liveTVTableView, attribute: attribute, relatedBy: .equal, toItem: view, attribute: attribute, multiplier: 1, constant: 0))
        }
        
        self.segmentControl.indexChangeBlock = { (index) in
            debugPrint("Segmented \(self.segmentControl.sectionTitles[index]) is visible now")
        }
        
        for attribute:NSLayoutAttribute in [ NSLayoutAttribute.right ] {
            liveTVTableView.tableHeaderView?.addConstraint(NSLayoutConstraint(item: self.segmentControl, attribute: attribute, relatedBy: .equal, toItem: liveTVTableView.tableHeaderView, attribute: attribute, multiplier: 1, constant: 50))
        }
    }
    
  
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liveTvList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LiveTVTableViewCell.nibName, for: indexPath) as! LiveTVTableViewCell
        cell.liveTv = liveTvList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.navigateToTouchTVShowsViewController()
    }
    
}
