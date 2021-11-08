//
//  OnboardingVC.swift
//  weather
//
//  Created by Rodrigo Torres on 01/11/2021.
//

import UIKit
import MaterialComponents


class OnboardingVC: UIViewController {

    @IBOutlet weak var skipButton: MDCButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let containerScheme = MDCContainerScheme()
    var slices = [Slices]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        slices = invoke()
        setButtons()
        setCollectionView()
    }
    
    func setButtons() {
        skipButton.setTitle("Comenzar", for: .normal)
        skipButton.setTitleColor(.black, for: .normal)
        skipButton.setBackgroundColor(.white)
    }
    
    @IBAction func onboardingButton(_ sender: Any) {
        if pageControl.currentPage == slices.count - 1 {
            presentVC(controller: LoginVC())
            UserDefaultsManager.shared.setOnboardingKey()
        }
        else {
            OnboardingUseCasesImp.shared.updatePageButton(pageControl: pageControl, collectionView: collectionView, buttonOnboarding: skipButton)
        }
    }
    
}

//MARK: - PageControl Configuration

extension OnboardingVC {
    
    func setupPageControl() {
        pageControl.numberOfPages = slices.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .gray
    }
}

//MARK: - CollectionView Configuration

extension OnboardingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setCollectionView() {
        collectionView.register(OnboardingCell.nib(), forCellWithReuseIdentifier: OnboardingCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.bounces = false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slices.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.identifier, for: indexPath) as! OnboardingCell
        cell.setupCell(slice: slices[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        OnboardingUseCasesImp.shared.updatePageScrollView(scrollView: scrollView, pageControl: pageControl, buttonOnboarding: skipButton)
    }
    
}

//MARK: - Slices Configuration

extension OnboardingVC: GetSlicesUseCase {
    
    func invoke() -> [Slices] {
        return GetSlicesUseCaseImp.invoke()
    }
    
}
