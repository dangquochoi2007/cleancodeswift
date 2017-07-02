//
//  TouchTVShowsViewController.swift
//  CleanStore
//
//  Created by QuocHoi on 2/7/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol TouchTVShowsViewControllerInput: TouchTVShowsPresenterOutput {

}

protocol TouchTVShowsViewControllerOutput {

    func doSomething()
}

final class TouchTVShowsViewController: UIViewController {

    var output: TouchTVShowsViewControllerOutput!
    var router: TouchTVShowsRouterProtocol!

    
    var tvShowsBackgrounColor: UIColor = UIColor(red: 22.0/255.0, green: 23.0/255.0, blue: 27.0/255.0, alpha: 0.95)
    var tvShowsForegroundColor: UIColor = UIColor(red: 26.0/255.0, green: 206.0/255.0, blue: 239.0/255.0, alpha: 1)
    
    var touchActionList:[TouchMovieAction] = [TouchMovieAction.AddtoWatchList, TouchMovieAction.ShowLastEpisode, TouchMovieAction.ShowTVShowDetails]
    
    @IBOutlet weak var touchTVShowTableView: UITableView!

    // MARK: - Initializers

    init(configurator: TouchTVShowsConfigurator = TouchTVShowsConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: TouchTVShowsConfigurator = TouchTVShowsConfigurator.sharedInstance) {

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
        touchTVShowTableView.delegate = self
        touchTVShowTableView.dataSource = self
        touchTVShowTableView.showsHorizontalScrollIndicator = false
        touchTVShowTableView.showsVerticalScrollIndicator = false
        touchTVShowTableView.rowHeight = UITableViewAutomaticDimension
        touchTVShowTableView.estimatedRowHeight = 60
        touchTVShowTableView.showsVerticalScrollIndicator = false
        touchTVShowTableView.showsHorizontalScrollIndicator = false
        touchTVShowTableView.contentInset = UIEdgeInsets.zero
        touchTVShowTableView.separatorColor = tvShowsBackgrounColor
        touchTVShowTableView.register(TouchMovieTableViewCell.nib, forCellReuseIdentifier: TouchMovieTableViewCell.nibName)
        touchTVShowTableView.tableHeaderView = TouchTVShowHeaderView.fromNib()
        
        let footerView = TouchTVShowFooterView.fromNib() as TouchTVShowFooterView
        footerView.closeTvShowsButton.addTarget(self, action: #selector(TouchTVShowsViewController.closeTvButtonPressed), for: UIControlEvents.touchUpInside)
        touchTVShowTableView.tableFooterView = footerView
        
        // fix hieght space header view
        automaticallyAdjustsScrollViewInsets = false
        
    }
    
    func closeTvButtonPressed(sender: UIButton) {
        router.dismissViewController()
    }
}


// MARK: - TouchTVShowsPresenterOutput

extension TouchTVShowsViewController: TouchTVShowsViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: TouchTVShowsViewModel) {

        // TODO: Update UI
    }
}


extension TouchTVShowsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return touchActionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: TouchMovieTableViewCell.nibName, for: indexPath) as! TouchMovieTableViewCell
        cell.touchAction = touchActionList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.navigationTVShowDetailsViewController()
    }
}
