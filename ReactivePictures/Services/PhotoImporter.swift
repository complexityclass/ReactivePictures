//
//  PhotoImporter.swift
//  ReactivePictures
//
//  Created by Popov Valery on 06/03/16.
//  Copyright © 2016 complexityclass. All rights reserved.
//

import Foundation
import ReactiveCocoa
import Alamofire

class PhotoImporter {
    
    class func importPhotos(apiClient: ApiClient500PxProtocol) -> SignalProducer<[PhotoModel], NSError> {
        
        let (producer, sink) = SignalProducer<[PhotoModel], NSError>.buffer()
        apiClient.editorsChoicePhotos { json, error in
            
            if let json = json, photosJson = json["photos"] as? [NSDictionary] {
                
                let modelsArray = photosJson.flatMap { photoDict in PhotoModel.photoModelFromDictionary(photoDict) }
                sink.sendNext(modelsArray)
                sink.sendCompleted()
                
            } else {
                if let error = error {
                    sink.sendFailed(error)
                }
            }
        }
        
        return producer
    }
}
