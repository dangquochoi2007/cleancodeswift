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
    
    lazy var liveTVTableView: UITableView = { [unowned self] in
        var tableView = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        tableView.register(LiveTVTableViewCell.self, forCellReuseIdentifier: "LiveTVTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80
        tableView.backgroundColor = UIColor.red
        return tableView
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

        title = "LIVE TV"
        configureControllerWhenLoad()
    }


    // MARK: - Load data

    func doSomethingOnLoad() {

        // TODO: Ask the Interactor to do some work

        output.doSomething()
    }
    
    func configureControllerWhenLoad() {
        
        constraintsLayoutTableView()
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
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LiveTVTableViewCell", for: indexPath) as! LiveTVTableViewCell
        return cell
    }
    
}
