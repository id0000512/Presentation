//
//  PageViewController.swift
//  Presentation
//
//  Created by Valeriy Pokatilo on 15/06/2019.
//  Copyright © 2019 Valeriy Pokatilo. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    let presentScreenContent = [
        "Первая страница презентации, рассказывает о том, что наша страница представляет",
        "Второая страница презентации, рассказывает о какой удобной фишке приложени",
        "Третья страница презентации тоже рассказывает о чем то интересном",
        "Ну и наконец последняя страница призентации с напуствием в добрый путь",
        ""
    ]
    
    let emojiArray = ["👻", "🤩", "🤪", "😇", ""]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        if let contentViewController = showViewControllerAtIndex(0) {
            setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func showViewControllerAtIndex(_ index: Int) -> ContentViewController? {
        guard index >= 0 else { return nil }
        guard index < presentScreenContent.count else {
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "wasViewed")
            dismiss(animated: true, completion: nil)
            return nil }
        guard let contentViewController = storyboard?.instantiateViewController(
            withIdentifier: "ContentViewController") as? ContentViewController else { return nil }
        
        contentViewController.presentText = presentScreenContent[index]
        contentViewController.emoji = emojiArray[index]
        contentViewController.currentPage = index
        contentViewController.numberOfPage = presentScreenContent.count
        
        return contentViewController
    }

}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber -= 1
        
        return showViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber += 1
        
        return showViewControllerAtIndex(pageNumber)
    }
    
    
}
