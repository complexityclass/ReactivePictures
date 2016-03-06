//
//  PhotoModel.swift
//  ReactivePictures
//
//  Created by Popov Valery on 06/03/16.
//  Copyright © 2016 complexityclass. All rights reserved.
//

import Foundation

struct PhotoModel {
    
    let photoName: String
    var identifier: Int?
    var photographerName: String?
    var rating: Double?
    var thumbnailURL: String?
    var thumbnailData: NSData?
    var fullsizedURL: String?
    var fullsizedData: NSData?
    
    init(photoName: String) {
        self.photoName = photoName
    }
    
}

// MARK: Mapping

extension PhotoModel {
    
    static func photoModelFromDictionary(dict: NSDictionary) -> PhotoModel? {
        
        guard let photoName = dict["name"] as? String else { return nil }
        
        var model = PhotoModel(photoName: photoName)
        model.identifier = dict["id"] as? Int
        
        if let user = dict["user"] as? NSDictionary {
            model.photographerName = user["username"] as? String
        }
        
        model.rating = dict["rating"] as? Double
        model.thumbnailURL = dict["image_url"] as? String
        
        if let images = dict["images"] as? NSArray,  image = images.firstObject as? NSDictionary {
            model.fullsizedURL = image["url"] as? String
        }
        
        return model
    }
}