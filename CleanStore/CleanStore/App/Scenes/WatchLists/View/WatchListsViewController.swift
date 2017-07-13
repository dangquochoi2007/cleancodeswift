//
//  WatchListsViewController.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit
import AVFoundation

protocol WatchListsViewControllerInput: WatchListsPresenterOutput {

}

protocol WatchListsViewControllerOutput {

    func doSomething()
}

final class WatchListsViewController: SJSegmentedViewController {

    var output: WatchListsViewControllerOutput!
    var router: WatchListsRouterProtocol!
    
    var watchListsBackgroundColor: UIColor = UIColor(red: 22.0/255.0, green: 23.0/255.0, blue: 27.0/255.0, alpha: 0.95)
    var watchListsForegroundColor: UIColor = UIColor(red: 24.0/255.0, green: 235.0/255.0, blue: 188.0/255.0, alpha: 1)
    
    var selectedSegment: SJSegmentTab?
   
    

    // MARK: - Initializers

    init(configurator: WatchListsConfigurator = WatchListsConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: WatchListsConfigurator = WatchListsConfigurator.sharedInstance) {

        configurator.configure(viewController: self)
    }


    // MARK: - View lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()

        configureControllerWhenLoad()
        configureRightMenuBarButton()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureControllerWhenAppear()
    }
    
    override func viewWillLayoutSubviews()
    {
        super.viewWillLayoutSubviews()
        
        //recalculate the collection view layout when the view layout changes
            }

    // MARK: - Load data

    func doSomethingOnLoad() {

        // TODO: Ask the Interactor to do some work

        output.doSomething()
    }
    
    func configureControllerWhenLoad() {
        let moviesViewController = FirstTableViewController()
        moviesViewController.title = "MOVIES"
        let tvShowViewController = SecondViewController()
        tvShowViewController.title = "TV-SHOWS"
        segmentControllers = [moviesViewController, tvShowViewController]
    }
    
    
    
    func configureControllerWhenAppear() {
        navigationController?.navigationBar.barTintColor = watchListsBackgroundColor
        navigationController?.navigationBar.tintColor = watchListsForegroundColor
        navigationController?.navigationBar.isTranslucent = false
        
        tabBarController?.tabBar.barTintColor = watchListsBackgroundColor
        tabBarController?.tabBar.tintColor = watchListsForegroundColor
        
        title = "WATCHLIST"
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName : UIFont(name: "Lato-Bold", size: 15) ?? UIFont.systemFont(ofSize: 15),
            NSForegroundColorAttributeName: watchListsForegroundColor
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


// MARK: - WatchListsPresenterOutput

extension WatchListsViewController: WatchListsViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: WatchListsViewModel) {

        // TODO: Update UI
    }
}


class FirstTableViewController: UITableViewController {
    
    // MARK: - Table view data source
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl?.addTarget(self,
                                  action: #selector(handleRefresh(_:)),
                                  for: UIControlEvents.valueChanged)
    }
    
    func handleRefresh(_ refreshControl: UIRefreshControl) {
        
        self.perform(#selector(self.endRefresh), with: nil, afterDelay: 1.0)
    }
    
    func endRefresh() {
        
        refreshControl?.endRefreshing()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        
        cell.textLabel?.text = "Row " + String((indexPath as NSIndexPath).row)
        
        return cell
    }
    
    func viewForObserve() -> UIView{
        
        return self.tableView
    }
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var customTableView: UITableView!
}

extension SecondViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        
        cell.textLabel?.text = "Second View Row " + String((indexPath as NSIndexPath).row)
        
        return cell
    }
}

extension SecondViewController: SJSegmentedViewControllerViewSource {
    
    func viewForSegmentControllerToObserveContentOffsetChange() -> UIView {
        
        return customTableView
    }
}
