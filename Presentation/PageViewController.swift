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
        "Ну и наконец последняя страница призентации с напуствием в добрый путь"
    ]
    
    let emojiArray = ["👻", "🤩", "🤪", "😇"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let contentViewController = showViewControllerAtIndex(0) {
            setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func showViewControllerAtIndex(_ index: Int) -> ContentViewController? {
        guard index >= 0 else { return nil }
        guard index < presentScreenContent.count else { return nil }
        guard let contentViewController = storyboard?.instantiateViewController(
            withIdentifier: "ContentViewController") as? ContentViewController else { return nil }
        
        contentViewController.presentText = presentScreenContent[index]
        contentViewController.emoji = emojiArray[index]
        contentViewController.currentPage = index
        contentViewController.numberOfPage = presentScreenContent.count
        
        return contentViewController
    }
    


}
