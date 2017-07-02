//
//  MoviesDetailsViewController.swift
//  CleanStore
//
//  Created by hoi on 29/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol MoviesDetailsViewControllerInput: MoviesDetailsPresenterOutput {

}

protocol MoviesDetailsViewControllerOutput {

    func doSomething()
}

final class MoviesDetailsViewController: UIViewController {

    var output: MoviesDetailsViewControllerOutput!
    var router: MoviesDetailsRouterProtocol!

    
    @IBOutlet weak var movieDetailTable: UITableView!

    // MARK: - Initializers

    init(configurator: MoviesDetailsConfigurator = MoviesDetailsConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: MoviesDetailsConfigurator = MoviesDetailsConfigurator.sharedInstance) {

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
        movieDetailTable.delegate = self
        movieDetailTable.dataSource = self
        movieDetailTable.register(SYNOPSISTableViewCell.nib, forCellReuseIdentifier: SYNOPSISTableViewCell.nibName)
        movieDetailTable.rowHeight = UITableViewAutomaticDimension
        movieDetailTable.estimatedRowHeight = 60
        movieDetailTable.separatorStyle = UITableViewCellSeparatorStyle.none
        movieDetailTable.showsVerticalScrollIndicator = false
        movieDetailTable.showsHorizontalScrollIndicator = false
        movieDetailTable.tableHeaderView = MoviesDetailsHeaderView.fromNib()
        movieDetailTable.tableFooterView = MoviesDetailsFooterView.fromNib()
    }
}


// MARK: - MoviesDetailsPresenterOutput

extension MoviesDetailsViewController: MoviesDetailsViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: MoviesDetailsViewModel) {

        // TODO: Update UI
    }
}

extension MoviesDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SYNOPSISTableViewCell.nibName, for: indexPath) as! SYNOPSISTableViewCell
        
        return cell
    }
}
