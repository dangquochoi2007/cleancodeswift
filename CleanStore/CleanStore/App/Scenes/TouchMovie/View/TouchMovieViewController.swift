//
//  TouchMovieViewController.swift
//  CleanStore
//
//  Created by hoi on 29/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol TouchMovieViewControllerInput: TouchMoviePresenterOutput {

}

protocol TouchMovieViewControllerOutput {

    func doSomething()
}

final class TouchMovieViewController: UIViewController {

    var output: TouchMovieViewControllerOutput!
    var router: TouchMovieRouterProtocol!
    
    var touchActionList:[TouchMovieAction] = [TouchMovieAction.AddtoWatchList, TouchMovieAction.PlayLastTrailer, TouchMovieAction.ShowAllDetails]

    @IBOutlet weak var touchTableView: UITableView!
    

    // MARK: - Initializers

    init(configurator: TouchMovieConfigurator = TouchMovieConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: TouchMovieConfigurator = TouchMovieConfigurator.sharedInstance) {

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
        self.touchTableView.delegate = self
        self.touchTableView.dataSource = self
        self.touchTableView.register(TouchMovieTableViewCell.nib, forCellReuseIdentifier: TouchMovieTableViewCell.nibName)
        self.touchTableView.rowHeight = UITableViewAutomaticDimension
        self.touchTableView.estimatedRowHeight = 60
        self.touchTableView.showsVerticalScrollIndicator = false
        self.touchTableView.showsHorizontalScrollIndicator = false
        self.touchTableView.tableHeaderView = TouchMoviesHeaderView.fromNib()
        
        let footerView = TouchMoviesFooterView.fromNib()
        footerView.closeTouchMoviesButton.addTarget(self, action: #selector(TouchMovieViewController.closeButtonPressed), for: UIControlEvents.touchUpInside)
        self.touchTableView.tableFooterView = footerView
        
        
    }
    
    func closeButtonPressed(sender: UIButton) {
        router.dismissViewController()
    }
}


// MARK: - TouchMoviePresenterOutput

extension TouchMovieViewController: TouchMovieViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: TouchMovieViewModel) {

        // TODO: Update UI
    }
}


extension TouchMovieViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return touchActionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TouchMovieTableViewCell.nibName, for: indexPath) as! TouchMovieTableViewCell
        cell.touchAction = touchActionList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.navigateToMoviesDetailsViewController()
    }
}
