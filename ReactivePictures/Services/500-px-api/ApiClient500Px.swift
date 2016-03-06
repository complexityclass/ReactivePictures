//
// Created by Popov Valery on 06/03/16.
// Copyright (c) 2016 complexityclass. All rights reserved.
//

import Foundation
import Alamofire

class ApiClient500Px: ApiClient500PxProtocol {
    
    var requestBuilder: RequestBuilderProtocol?
    
    func editorsChoicePhotos(completion: Completion) {
        
        guard let requestString = requestBuilder?.buildRequestString(ApiEndpoints500Px.EditorsChoice) else {
            return
        }
        
        Alamofire.request(.GET, requestString).responseJSON {
            response in switch response.result {
            case .Success(let json):
                let response = json as! NSDictionary
                completion(response, nil)
                
            case .Failure(let error):
                completion(nil, error)
            }
        }
    }
    
}
