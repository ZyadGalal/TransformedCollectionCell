//
//  CustomCollectionViewFlowLayout.swift
//  CustomParallaxCollectionCell
//
//  Created by Zyad Galal on 6/11/20.
//  Copyright © 2020 Zyad Galal. All rights reserved.
//

import UIKit

func degreesToRadius(degrees: Double) -> CGFloat {
    return CGFloat(Double.pi * (degrees / 180.0))
}

protocol CustomTransformedCellDelegate: class {
    func isClockWise() -> Bool
}

class CustomCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    weak var delegate: CustomTransformedCellDelegate?
    private let contentInsets = UIEdgeInsets(top: 60, left: 0, bottom: 50, right: 0)
    
    override func prepare() {
        guard let cv = collectionView else {return}
        cv.contentInset = contentInsets
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)!
        
        let isClockWised = delegate?.isClockWise()
        var attributesCopies = [UICollectionViewLayoutAttributes]()

        for attributes in layoutAttributes {
            let itemAttributesCopy = attributes.copy() as! UICollectionViewLayoutAttributes
            itemAttributesCopy.transform = CGAffineTransform(rotationAngle: degreesToRadius(degrees: isClockWised == true ? 14 : -14))
            attributesCopies.append(itemAttributesCopy)
        }
        
        return attributesCopies
    }

}
