//
// Created by Popov Valery on 06/03/16.
// Copyright (c) 2016 complexityclass. All rights reserved.
//

import Foundation

typealias Completion = (NSDictionary?, NSError?) -> Void

protocol ApiClient500PxProtocol {

    /**
    Get editors choice photos

    - returns: Array of photo models
    */
    func editorsChoicePhotos(completion: Completion)
}