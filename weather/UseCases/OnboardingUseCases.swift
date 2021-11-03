//
//  OnboardingUseCases.swift
//  weather
//
//  Created by Rodrigo Torres on 02/11/2021.
//

import Foundation
import UIKit
import MaterialComponents


class OnboardingUseCasesImp {
    
    static let shared = OnboardingUseCasesImp()
    var currentPage = 0
    
    func updatePageButton(pageControl: UIPageControl, collectionView: UICollectionView, buttonOnboarding: MDCButton) {
        currentPage += 1
        pageControl.currentPage = currentPage
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        changeTextButton(page: currentPage, button: buttonOnboarding)
    }
    
    func updatePageScrollView(scrollView: UIScrollView, pageControl: UIPageControl, buttonOnboarding: MDCButton) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
        changeTextButton(page: currentPage, button: buttonOnboarding)
    }
    
    private func changeTextButton(page: Int, button: UIButton) {
        switch page {
        case 1:
            button.setTitle("Siguiente", for: .normal)
        case 2:
            button.setTitle("Finalizar", for: .normal)
        default:
            button.setTitle("Comenzar", for: .normal)
        }
    }
    
}
