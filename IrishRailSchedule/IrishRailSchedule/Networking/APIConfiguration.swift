//
//  APIConfiguration.swift
//  IrishRailSchedule
//
//  Created by Yani Buchkov on 1.05.20.
//  Copyright © 2020 Yani Buchkov. All rights reserved.
//

import Foundation
import Alamofire

/**
 APIConfiguration protocol
 
 Confirming this protocol to have all necessary properties for
 networking
 
 - method: HTTPMethod - Getting from Alamofire: Options: GET, POST, UPDATE, DELETE
 - path: The path for the endpoint
 - parameters: Alamofire Parameters
 - encoding: Alamofire Encoding
 - headers: Alamofire HTTPHeaders - optionl and depends on the backend
 
*/

protocol APIConfiguration: URLRequestConvertible {
    
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
    var headers: HTTPHeaders? { get }

    func absoluteURL() throws -> URL
}
