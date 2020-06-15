//
//  ViewController.swift
//  CustomParallaxCollectionCell
//
//  Created by Zyad Galal on 6/11/20.
//  Copyright © 2020 Zyad Galal. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var transformSwitch: UISwitch!
    @IBOutlet weak var collectionView: UICollectionView!
    let photos: [String] = ["1","2","3","4","5","6","1","2","3","4","5","6","1","2","3","4","5","6","1","2","1","2","3","4","5","6","1","2","3","4","5","6","1","2","3","4","5","6","1","2","2","3","4","5","6","1","2","3","4","5","6","1","2","3","4","5","6","1","2","1","2","3","4","5","6","1","2","3","4","5","6","1","2","3","4","5","6","1","2"]
    
    let parallaxEffectSpeed: CGFloat = 30
    var cellHeight: CGFloat = 140
    var parallaxDirection: ParallaxDirection = .down
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let flowLayout = collectionView.collectionViewLayout as? CustomCollectionViewFlowLayout {
            flowLayout.itemSize = CGSize(width: collectionView.bounds.width, height: 140)
            flowLayout.delegate = self
        }
    }

    @IBAction func didSwitchValueChange(_ sender: Any) {
        collectionView.reloadData()
    }
    
    func parallaxEffect (newOffsetY: CGFloat, cell: UICollectionViewCell) -> CGFloat {
        return (newOffsetY - (cell.frame.origin.y)) / 140 * parallaxEffectSpeed
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotosCollectionViewCell
        cell.headerLabel.text = "Zyad Galal"
        cell.subtitleLabel.text = "iOS Developer"
        cell.naturalImageView.image = UIImage(named: photos[indexPath.row])
        if parallaxDirection == .up {
        cell.imageViewTopConstraints.constant = parallaxEffect(newOffsetY: collectionView.contentOffset.y, cell: cell)
        }
        else{
            cell.imageViewBottomConstraints.constant = parallaxEffect(newOffsetY: collectionView.contentOffset.y, cell: cell)
        }
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let cells = collectionView!.visibleCells as! [PhotosCollectionViewCell]
        for cell in cells {
            if parallaxDirection == .up {
                cell.imageViewTopConstraints.constant = parallaxEffect(newOffsetY: collectionView.contentOffset.y, cell: cell)
            }
            else{
                cell.imageViewBottomConstraints.constant = parallaxEffect(newOffsetY: collectionView.contentOffset.y, cell: cell)
            }
        }
    }
}

extension ViewController: CustomTransformedCellDelegate {
    func isClockWise() -> Bool {
        return transformSwitch.isOn
    }
}
