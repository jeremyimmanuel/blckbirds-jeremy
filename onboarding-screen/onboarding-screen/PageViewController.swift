//
//  PageViewController.swift
//  onboarding-screen
//
//  Created by Jeremy's Macbook Pro 16 on 6/26/20.
//  Copyright © 2020 Jeremy Tandjung. All rights reserved.
//

import SwiftUI
import UIKit

struct PageViewController: UIViewControllerRepresentable {
    var viewControllers: [UIViewController]
    
    @Binding var currentPageIndex: Int
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
            
    }
    
    
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers([viewControllers[currentPageIndex]], direction: .forward, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    

    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
        var parent: PageViewController
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = parent.viewControllers.firstIndex(of: viewController) else {
                return nil
            }
            
            if index == 0 {
                return parent.viewControllers.last
            }
            
            return parent.viewControllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            
            // get index of currentViewController
            guard let index = parent.viewControllers.firstIndex(of: viewController) else {
                return nil
            }
            
            // if index is the last index then go to first VC
            if index + 1 == parent.viewControllers.count {
                return parent.viewControllers.first
            }
            
            return parent.viewControllers[index + 1]
        }
        
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed, let visibleViewController = pageViewController.viewControllers?.first, let index = parent.viewControllers.firstIndex(of: visibleViewController) {
                parent.currentPageIndex = index
            }
        }
        
        
        init(_ pageViewController: PageViewController) {
            self.parent = pageViewController
        }
    }
}

