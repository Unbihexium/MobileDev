//
//  PuzzleCollectionViewCell.swift
//  MobileDev
//
//  Created by Egor Nalobin on 27.02.2020.
//  Copyright © 2020 Egor Nalobin. All rights reserved.
//

import UIKit

class PuzzleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var coloredView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        coloredView.backgroundColor = UIColor.randomColor()
    }

}


extension UIColor{
    
    static func randomColor() -> UIColor {
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
}
