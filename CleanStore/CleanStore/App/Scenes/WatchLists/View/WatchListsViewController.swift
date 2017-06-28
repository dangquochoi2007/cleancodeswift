//
//  WatchListsViewController.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol WatchListsViewControllerInput: WatchListsPresenterOutput {

}

protocol WatchListsViewControllerOutput {

    func doSomething()
}

final class WatchListsViewController: UIViewController {

    var output: WatchListsViewControllerOutput!
    var router: WatchListsRouterProtocol!
    
    var watchListsBackgroundColor: UIColor = UIColor(red: 22.0/255.0, green: 23.0/255.0, blue: 27.0/255.0, alpha: 0.95)
    var watchListsForegroundColor: UIColor = UIColor(red: 24.0/255.0, green: 235.0/255.0, blue: 188.0/255.0, alpha: 1)
    
    lazy var watchListsCollectionView: UICollectionView = { [unowned self] in
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(WatchListMoviesCollectionViewCell.self, forCellWithReuseIdentifier: "WatchListMoviesCollectionViewCell")
        collectionView.register(WatchListTVShowsCollectionViewCellCollectionViewCell.self, forCellWithReuseIdentifier: "WatchListTVShowsCollectionViewCellCollectionViewCell")
        collectionView.backgroundColor = UIColor.red
        return collectionView
    }()
    
    lazy var collectionViewLayout: UICollectionViewLayout = { [unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets.zero
        return layout
    }()
    
    

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

        title = "WATCHLIST"
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
        
        constraintsLayoutCollectionView()
    }
    
    func configureControllerWhenAppear() {
        navigationController?.navigationBar.barTintColor = watchListsBackgroundColor
        navigationController?.navigationBar.tintColor = watchListsForegroundColor
        navigationController?.navigationBar.isTranslucent = false
        
        tabBarController?.tabBar.barTintColor = watchListsBackgroundColor
        tabBarController?.tabBar.tintColor = watchListsForegroundColor
        
        title = "MOVIES"
        
        guard let latoBoldFont = UIFont(name: "Lato-Bold", size: 22) else {
            return
        }
        navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName : latoBoldFont,
            NSForegroundColorAttributeName: watchListsForegroundColor
        ]
    }
}


// MARK: - WatchListsPresenterOutput

extension WatchListsViewController: WatchListsViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: WatchListsViewModel) {

        // TODO: Update UI
    }
}

extension WatchListsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func constraintsLayoutCollectionView() {
        
        [watchListsCollectionView].forEach {
            self.view.addSubview($0)
        }
        
        let attributes:[NSLayoutAttribute] = [.top, .left, .bottom, .right]
        for attribute in attributes {
            view.addConstraint(NSLayoutConstraint(item: self.watchListsCollectionView, attribute: attribute, relatedBy: .equal, toItem: view, attribute: attribute, multiplier: 1, constant: 0))
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WatchListMoviesCollectionViewCell", for: indexPath) as! WatchListMoviesCollectionViewCell
        return cell
    }
}
