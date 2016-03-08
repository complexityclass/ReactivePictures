//
//  FullsizePhotoViewController.swift
//  ReactivePictures
//
//  Created by Popov Valery on 08/03/16.
//  Copyright © 2016 complexityclass. All rights reserved.
//

import UIKit

protocol FullSizeViewControllerDelegate: class {
    
    func userDidScroll(controller: UIViewController, toIndex index: Int)
}


class FullsizePhotoViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    weak var delegate: FullSizeViewControllerDelegate?
    private(set) var photoModels: [PhotoModel]?
    private var pageViewController: UIPageViewController?
    
    convenience init(photoModels models: [PhotoModel], currentPhotoIndex index: Int) {
        self.init()
        photoModels = models
        title = photoModels![index].photoName
        self.pageViewController = configurePageViewController(index)
        self.addChildViewController(self.pageViewController!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blackColor()
        pageViewController?.view.frame = view.bounds
        view.addSubview((pageViewController?.view)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Helpers
    
    func photoViewControllerAt(index: Int) -> UIViewController? {
        guard index >= 0 && index < photoModels?.count else { return nil }
        
        let photoModel = photoModels![index]
        let photoViewController = PhotoViewController(photoModel: photoModel, photoIndex: index)
        
        return photoViewController
    }
    
    // MARK: PageViewController
    
    func configurePageViewController(currentPhotoIndex: Int) -> UIPageViewController {
        
        let pageViewController = UIPageViewController(transitionStyle: .Scroll,
            navigationOrientation: .Horizontal, options: [UIPageViewControllerOptionInterPageSpacingKey : 30])
        pageViewController.dataSource = self
        pageViewController.delegate = self
        pageViewController.setViewControllers([photoViewControllerAt(currentPhotoIndex)!], direction: .Forward, animated: false, completion: nil)
        
        return pageViewController
    }
    
    // MARK: UIPageViewControllerDelegate
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if let photoController = pageViewController.viewControllers?.first as? PhotoViewController {
            title = photoController.photoModel?.photoName
            delegate?.userDidScroll(self, toIndex: photoController.photoIndex)
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        guard let photoController = viewController as? PhotoViewController else { return nil }
        return photoViewControllerAt(photoController.photoIndex - 1)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        guard let photoController = viewController as? PhotoViewController else { return nil }
        return photoViewControllerAt(photoController.photoIndex + 1)
    }
    
}
