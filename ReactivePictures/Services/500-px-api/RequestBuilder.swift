//
// Created by Popov Valery on 06/03/16.
// Copyright (c) 2016 complexityclass. All rights reserved.
//

import Foundation

class RequestBuilder: RequestBuilderProtocol {
    
    func buildRequestString(apiEndpoint: ApiEndpoints500Px) -> String {
        return "\(Base500PxApiURL)\(apiEndpoint.rawValue)&page=1&consumer_key=\(ConsumerKey)"
    }

}
