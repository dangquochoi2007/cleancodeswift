//
//  ArtistsView.swift
//  CleanStore
//
//  Created by hoi on 1/6/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import Foundation
import BaseViewSwift


final class ArtistView: BaseView {
    
    let tableView = UITableView()
    let refreshControl = UIRefreshControl()
    
    
    private struct Constants {
        static let rowHeight: CGFloat = 160.0
    }
    
    
    // MARK: - Setup
    override func setup() {
        super.setup()
        
        setupTableView()
    }
    
    
    private func setupTableView() {
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = Constants.rowHeight
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor.white
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.showsVerticalScrollIndicator = false
        tableView.insertSubview(refreshControl, at: 0)
        addSubview(tableView)
    }
    
    // MARK: - Layout
    override func setupConstraints() {
        super.setupConstraints()
        
        setupTableViewConstraints()
    }
    
    private func setupTableViewConstraints() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
    }
    
}
