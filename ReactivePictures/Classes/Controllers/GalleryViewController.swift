//
// Created by Popov Valery on 06/03/16.
// Copyright (c) 2016 complexityclass. All rights reserved.
//

import UIKit
import ReactiveCocoa

let CellReuseIdentifier = "ReactiveCell"

class GalleryViewController : UICollectionViewController {
    
    var photosArray = MutableProperty<[PhotoModel]>([])
    var apiClient: ApiClient500PxProtocol?

    convenience init() {
        self.init(collectionViewLayout: GalleryFlowLayout())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Popular on 500 px"
        
        photosArray.producer.startWithNext { [weak self] _ in
            self!.collectionView?.reloadData()
        }
        
        collectionView?.registerClass(ReactiveCollectionViewCell.self, forCellWithReuseIdentifier: CellReuseIdentifier)
        
        loadPopularPhotos()
    }
    
    private func loadPopularPhotos() {
        PhotoImporter.importPhotos(apiClient!).startWithNext { [weak self] newModels in
            self!.photosArray.value = newModels
        }
    }
    
    // MARK: Collectionview delegates
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosArray.value.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CellReuseIdentifier, forIndexPath: indexPath) as! ReactiveCollectionViewCell
        cell.updateWithModel(photosArray.value[indexPath.row])
        
        return cell
    }

}
