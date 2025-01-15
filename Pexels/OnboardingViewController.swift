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
    
    var pages: [OnboardingModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: OnboardingCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
        collectionView.dataSource = self

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

extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        return cell
    }
}


