//
//  OnboardingCollectionViewCell.swift
//  Pexels
//
//  Created by Damir Chalkarov on 15.01.2025.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "OnboardingCollectionViewCell"
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var innerStackView: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
    
    func setup(onboardingModel: OnboardingModel) {
        imageView.image = UIImage(named: onboardingModel.imageName)
        titleLabel.text = onboardingModel.title
        subtitleLabel.text = onboardingModel.subTitle
    }

}
