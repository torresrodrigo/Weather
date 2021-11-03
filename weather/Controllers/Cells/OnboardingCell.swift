//
//  OnboardingCell.swift
//  weather
//
//  Created by Rodrigo Torres on 01/11/2021.
//

import UIKit

class OnboardingCell: UICollectionViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var textCell: UILabel!
    
    static let identifier = String(describing: OnboardingCell.self)
    static func nib() -> UINib {
        return UINib(nibName: String(describing: OnboardingCell.self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell(slice: Slices) {
        textCell.text = slice.text
        imageCell.image = slice.image
    }

}
