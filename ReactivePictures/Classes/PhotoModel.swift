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
    let identifier: Int?
    let photographerName: String?
    let rating: Double?
    let thumbnailURL: String?
    let thumbnailData: NSData?
    let fullsizedURL: String?
    let fullsizedData: NSData?
    
}