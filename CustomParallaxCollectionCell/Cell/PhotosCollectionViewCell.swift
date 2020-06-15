//
//  PhotosCollectionViewCell.swift
//  CustomParallaxCollectionCell
//
//  Created by Zyad Galal on 6/11/20.
//  Copyright © 2020 Zyad Galal. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var naturalImageView: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var imageViewTopConstraints: NSLayoutConstraint!
    @IBOutlet weak var imageViewBottomConstraints: NSLayoutConstraint!
    
}
