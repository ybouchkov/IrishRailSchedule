//
//  Endpoind.swift
//  IrishRailSchedule
//
//  Created by Yani Buchkov on 1.05.20.
//  Copyright © 2020 Yani Buchkov. All rights reserved.
//

import Foundation
import Alamofire
/**
    Endpoint enum
 
 - Description: Enum, which define all endpoints for the application. If you
 need to add new one, you need to implement also the whole properties from APIConfiguration protocol
 
*/

enum Endpoint: APIConfiguration {
    
    // MARK: - Endpoints
    
    

    // Base url
    static let baseUrl = Environment.shared.baseURLString

    // MARK: - APIConfiguration protocol

    var method: HTTPMethod {
        return .get
    }

    // NOTE: The Endpoint paths
    
    var path: String {
        return ""
    }
    
    // MARK: - Optionals
    
    var parameters: Parameters? {
        return nil
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }

    func absoluteURL() throws -> URL {
        guard let baseUrl = URL(string: urlString) else {
            throw URLError.invalid
        }

        let url = baseUrl.appendingPathComponent(path)

        guard let encodedURL = URL(string: url.absoluteString.removingPercentEncoding ?? "") else {
            throw URLError.invalid
        }

        return encodedURL
    }

    private var urlString: String {
        return ""
    }

    // MARK: - URLRequestConvertible

    func asURLRequest() throws -> URLRequest {
        let url = try absoluteURL()
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return try encoding.encode(request, with: parameters)
    }

    // MARK: - Helpers

    private func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?,
                                      request: inout URLRequest) {
        guard let headers = additionalHeaders else {
            return
        }

        for header in headers {
            request.setValue(header.value, forHTTPHeaderField: header.name)
        }
    }

}

// MARK: - Custom Errors

enum URLError: Error {
    case invalid
}

// MARK: - Helper

extension Encodable {
    
    var dictionary: Parameters? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? Parameters }
    }
}
