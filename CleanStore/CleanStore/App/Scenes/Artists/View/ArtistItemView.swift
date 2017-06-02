//
//  ArtistItemView.swift
//  CleanStore
//
//  Created by hoi on 1/6/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import Foundation
import BaseViewSwift


extension UIImageView {
    
    func setImageURL(url: URL?, placeholder: UIImage? = nil) {
        
        guard let imageURL = url else {
            image = placeholder
            return
        }
        
        ImageManager.shareInstance.loadImage(url: imageURL) { [weak self] image, error in
            
            if let strongSelf = self {
                
                strongSelf.image = image
                
            }
        }
        
    }
    
}

// MARK: - ArtistItemView

/// _ArtistItemView_ is a view responsible for the display of artist details (title and image)
final class ArtistsItemView: BaseView {
    
    lazy var imageView = UIImageView()
    lazy var imageOverlayView = UIView()
    lazy var titleLabel = UILabel()
    
    var viewModel: ArtistsViewModel.FetchArtists.ViewModel.DisplayedArtist?  {
        didSet {
            titleLabel.text = viewModel?.title
            imageView.setImageURL(url: viewModel?.imageURL)
        }
    }
    
    
    private struct Constants {
        
        struct Margin {
            
            static let left: CGFloat = 10.0
            
        }
        
        struct Alpha {
            
            static let transparency: CGFloat = 0.7
            
        }
    }
    
    
    // MARK: -Setup
    override func setup() {
        
        super.setup()
        
        setupImageView()
        setupImageOverlayView()
        setupTitleLabel()
    }
    
    
    private func setupImageView() {
        
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
    }
    
    
    private func setupImageOverlayView() {
        
        imageOverlayView.backgroundColor = UIColor.darkGray
        imageOverlayView.alpha = Constants.Alpha.transparency
        addSubview(imageOverlayView)
    }
    
    private func setupTitleLabel() {
        
        titleLabel.textColor = UIColor.white
        addSubview(titleLabel)
    }
    
    
    // MARK: - Constraints
    override func setupConstraints() {
        
        super.setupConstraints()
        
        setupTitleLabelConstraints()
        setupImageOverlayViewConstraints()
        setupImageViewConstraints()
    }
    
    
    private func setupImageViewConstraints() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    
    private func setupImageOverlayViewConstraints() {
        
        imageOverlayView.translatesAutoresizingMaskIntoConstraints = false
        
        imageOverlayView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageOverlayView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageOverlayView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageOverlayView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func setupTitleLabelConstraints() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
}
