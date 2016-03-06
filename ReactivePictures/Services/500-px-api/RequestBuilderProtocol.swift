//
// Created by Popov Valery on 06/03/16.
// Copyright (c) 2016 complexityclass. All rights reserved.
//

import Foundation

protocol RequestBuilderProtocol {

    func buildRequestString(apiEndpoint: ApiEndpoints500Px) -> String

}