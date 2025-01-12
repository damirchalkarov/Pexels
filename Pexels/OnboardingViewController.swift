//
//  OnboardingViewController.swift
//  Pexels
//
//  Created by Damir Chalkarov on 12.01.2025.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    
    override func viewDidLayoutSubviews() {
        
        skipButton.layer.cornerRadius = skipButton.frame.height / 2
        nextButton.layer.cornerRadius = nextButton.frame.height / 2
        
    }
    
    @IBAction func skipButtonClicked(_ sender: UIButton) {
    }
    
    @IBAction func nextButtonClicked(_ sender: UIButton) {
    }
    

}
