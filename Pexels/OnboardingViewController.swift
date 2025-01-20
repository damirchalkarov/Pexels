//
//  OnboardingViewController.swift
//  Pexels
//
//  Created by Damir Chalkarov on 12.01.2025.
//

import UIKit

class OnboardingViewController: UIViewController, UICollectionViewDelegate {
    
    static let KEY: String = "UserDidSeeOnboarding"
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var pages: [OnboardingModel] = [] {
        didSet {
            
            pageControl.numberOfPages = pages.count
            
            collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: OnboardingCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        generatePages()

    }
    
    override func viewDidLayoutSubviews() {
        
        skipButton.layer.cornerRadius = skipButton.frame.height / 2
        nextButton.layer.cornerRadius = nextButton.frame.height / 2
        
    }
    
    func generatePages() {
        
        pages = [
            OnboardingModel(imageName: "onboarding1", title: "Play Anywhere", subTitle: "The video call feature can be accessed from anywhere in your house to help you."),
            OnboardingModel(imageName: "onboarding2", title: "Stay Healthy", subTitle: "Nobody likes to be alone and the built-in group video call feature helps you connect."),
            OnboardingModel(imageName: "onboarding3", title: "Make Connections", subTitle: "While working the app reminds you to smile, laugh, walk and talk with those who matters.")
        ]
        
    }
    
    @IBAction func skipButtonClicked(_ sender: UIButton) {
        
        start()
        
    }
    
    @IBAction func nextButtonClicked(_ sender: UIButton) {
        
        if pageControl.currentPage == pageControl.numberOfPages - 1 {
            start()
        } else {
            
            pageControl.currentPage += 1
            
            collectionView.scrollToItem(at: IndexPath(item: pageControl.currentPage, section: 0), at: .centeredHorizontally, animated: true)
            
            handlePageChanges()
            
//            let x: CGFloat = collectionView.frame.width * CGFloat(pageControl.currentPage)
//            collectionView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
            
        }
        
    }
    
    func start() {
        
        UserDefaults.standard.set(true, forKey: OnboardingViewController.KEY)
        
        let mainVC = MainViewController()
        let navC = UINavigationController(rootViewController: mainVC)
        view.window?.rootViewController = navC
        view.window?.makeKeyAndVisible()
        
    }
    
    func handlePageChanges() {
        
        if pageControl.currentPage == pageControl.numberOfPages - 1 {
            
            skipButton.isHidden = true
            nextButton.setTitle("Start", for: .normal)
            
        } else {
            
            skipButton.isHidden = false
            nextButton.setTitle("Next", for: .normal)
            
        }
        
    }

}

extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        
        let onboardingModel = pages[indexPath.item]
        cell.setup(onboardingModel: onboardingModel)
        
        return cell
    }
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
}

extension OnboardingViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
        
        handlePageChanges()
    }
    
    
}

