//
//  PhotoViewController.swift
//  ReactivePictures
//
//  Created by Popov Valery on 08/03/16.
//  Copyright © 2016 complexityclass. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotoViewController: UIViewController {
    
    private(set) var photoIndex: Int = 0
    private(set) var photoModel: PhotoModel?
    
    var imageView: UIImageView?
    
    convenience init(photoModel model: PhotoModel, photoIndex index: Int) {
        self.init()
        photoModel = model
        photoIndex = index
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blackColor()
        let imageView = UIImageView(frame: view.bounds)
        
        if let fullsizedUrl = photoModel?.fullsizedURL, imageUrl = NSURL(string: fullsizedUrl) {
            imageView.af_setImageWithURL(imageUrl)
        }
        
        imageView.contentMode = .ScaleAspectFit
        view.addSubview(imageView)
        
        self.imageView = imageView
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
