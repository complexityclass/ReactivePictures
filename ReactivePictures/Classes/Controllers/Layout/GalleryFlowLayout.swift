//
// Created by Popov Valery on 06/03/16.
// Copyright (c) 2016 complexityclass. All rights reserved.
//

import UIKit

class GalleryFlowLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        configureLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: setup layout
    func configureLayout() {
        itemSize = CGSizeMake(145, 145)
        minimumInteritemSpacing = 10
        minimumLineSpacing = 10
        sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
    }
}
