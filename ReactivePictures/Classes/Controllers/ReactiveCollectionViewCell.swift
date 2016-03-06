//
//  ReactiveCollectionViewCell.swift
//  ReactivePictures
//
//  Created by Popov Valery on 06/03/16.
//  Copyright © 2016 complexityclass. All rights reserved.
//

import UIKit
import AlamofireImage

class ReactiveCollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.darkGrayColor()
        let imageView = UIImageView(frame: bounds)
        imageView.autoresizingMask = [.FlexibleWidth , .FlexibleHeight]
        contentView.addSubview(imageView)
        
        self.imageView = imageView
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func updateWithModel(photoModel: PhotoModel) {
        if let imagePath = photoModel.thumbnailURL {
            imageView.af_setImageWithURL(NSURL(string: imagePath)!)
        }
    }
    
}
