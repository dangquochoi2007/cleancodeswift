//
//  LeftSideMenuViewController.swift
//  CleanStore
//
//  Created by hoi on 29/6/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import UIKit

enum MainMenuRootOption {
    
    case LIVETV
    case MOVIES
    case TVSHOWS
    case WATCHLIST
    
    case Default
    
    
    var menuTitle: String {
        return String(describing: self)
    }
    
    var menuIconImage: String {
        switch self {
        case .LIVETV:
            return "live"
        case .MOVIES:
            return "movies"
        case .TVSHOWS:
            return "tvshows"
        case .WATCHLIST:
            return "watchlist"
        default:
            fatalError("Not have this menu")
        }
    }
}

class LeftSideMenuTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    
}

class LeftSideMenuViewController: UIViewController {
    
    lazy var menuItems:[MainMenuRootOption] = [MainMenuRootOption.LIVETV, MainMenuRootOption.MOVIES, MainMenuRootOption.TVSHOWS, MainMenuRootOption.WATCHLIST]
    
    lazy var contentMenuTableView: UITableView = { [unowned self] in
        var tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureControllerWhenLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureControllerWhenAppear()
    }
    
    func configureControllerWhenLoad() {
        
        constraintsLayoutTableView()
    }
    
    func configureControllerWhenAppear() {
    }
}


extension LeftSideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func constraintsLayoutTableView() {
        [contentMenuTableView].forEach {
            self.view.addSubview($0)
        }
        
        let attributes:[NSLayoutAttribute] = [.top, .left, .bottom, .right]
        
        for attribute in attributes {
            view.addConstraint(NSLayoutConstraint(item: self.contentMenuTableView, attribute: attribute, relatedBy: .equal, toItem: view, attribute: attribute, multiplier: 1, constant: 0))
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select at index \(indexPath.row)")
    }
}



class ContainerMenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
