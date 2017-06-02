//
//  ArtistTableViewCell.swift
//  CleanStore
//
//  Created by hoi on 1/6/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    // MARK: - Initializers
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        setupConstraints()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Setup
    func setup() {
        // Abstract method.
        
    }
    
    func setupConstraints() {
        // Abstract method.
    }
    
    
    // MARK: - Reuse Identifier
    class func reuseIdentifier() -> String {
        return NSStringFromClass(self)
    }
    
}


final class ArtistTableViewCell: BaseTableViewCell {

    let itemView = ArtistsItemView()
    
    var viewModel: ArtistsViewModel.FetchArtists.ViewModel.DisplayedArtist? {
        
        didSet {
            itemView.viewModel = viewModel
        }
    }
    
    
    override func setup() {
        
        super.setup()
        
        clipsToBounds = true
        selectionStyle = .none
        
        setupItemView()
    }
    
    
    private func setupItemView() {
        
        contentView.addSubview(itemView)
    }
    
    
    override func setupConstraints() {
        
        super.setupConstraints()
        
        setupItemViewConstraints()
    }
    
    private func setupItemViewConstraints() {
        
        itemView.translatesAutoresizingMaskIntoConstraints = false
        
        itemView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        itemView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        itemView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        itemView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    // MARK: - Reuse
    override func prepareForReuse() {
        
        super.prepareForReuse()
        
        self.viewModel = nil
    }

}
