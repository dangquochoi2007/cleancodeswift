//
//  SVMenuViewController.swift
//  CleanStore
//
//  Created by hoi on 30/6/17.
//  Copyright © 2017 hoi. All rights reserved.
//


//
// Copyright (c) 2016 Sachin Verma
// 
// SVMenuViewController.swift
// SVSlidingPanel
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import UIKit

class SVMenuViewController: UIViewController {
    
    
    lazy var contentTableView: UITableView = { [weak self] in
        var tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TouchMovieTableViewCell.nib, forCellReuseIdentifier: TouchMovieTableViewCell.nibName)
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.clear
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        return tableView
    }()

    let menuItems = [TouchMovieAction.LIVETV, TouchMovieAction.MOVIES, TouchMovieAction.TVSHOWS, TouchMovieAction.WATCHLISTS, TouchMovieAction.PROFILE, TouchMovieAction.LOGOUT]
    
    var menuSelectionClosure: ((SVMenuOptions, Bool)-> Void)!
    
    
    // MARK: - Initializers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureControllerWhenLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureControllerWhenAppear()
    }
    
    func configureControllerWhenLoad() {
        constraintsTableView()
    }
    
    func configureControllerWhenAppear() {
        navigationController?.navigationBar.barTintColor =  UIColor.clear
        navigationController?.navigationBar.isTranslucent = false
    }
}

//MARK: UITableViewDelegate
extension SVMenuViewController:UITableViewDelegate
{
    
    func constraintsTableView() {
        
        [contentTableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
        
        let attributes:[NSLayoutAttribute] = [.top, .left, .bottom, .right]
        for attribute in attributes {
            view.addConstraint(NSLayoutConstraint(item: self.contentTableView, attribute: attribute, relatedBy: .equal, toItem: view, attribute: attribute, multiplier: 1, constant: 0))
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        switch menuItems[indexPath.row] {
        case .PROFILE:
            let frontViewController = ProfileSettingsViewController()
            self.revealViewController().pushFrontViewController(frontViewController, animated: true)
        default:
            break
            
        }
    }
    
}


//MARK: UITableViewDataSource
extension SVMenuViewController:UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return menuItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: TouchMovieTableViewCell.nibName, for: indexPath) as! TouchMovieTableViewCell
        let menuItem = self.menuItems[indexPath.row]
        cell.touchAction = menuItem
        return cell
    }
    
}
