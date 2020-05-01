//
//  IrishRailEnvironment.swift
//  IrishRailSchedule
//
//  Created by Yani Buchkov on 1.05.20.
//  Copyright © 2020 Yani Buchkov. All rights reserved.
//

import Foundation

protocol IrishRailEnvironment {

    // Get Data from Server
    var baseURLString: String { get }

    // App version - helpers
    var bundleVersion: String { get }
    var buildNumber: String { get }
    var bundleId: String { get }
}

// MARK: - IrishRailEnvironment

extension Environment: IrishRailEnvironment {
    
     /// API Base URL

    var baseURLString: String {
        guard let url = try? self.configuration(.serverUrl) else {
            fatalError("Missing Environment Configuration: Base URL String")
        }

        return url
    }
    
    /// Helpers

    var bundleVersion: String {
        guard let version = try? self.configuration(.version) else {
            fatalError("Missing Environment Configuration: Bundle Short Version String")
        }
        
        return version
    }

    var buildNumber: String {
        guard let number = try? self.configuration(.build) else {
            fatalError("Missing Environment Configuration: Bundle Version String")
        }
        
        return number
    }

    var bundleId: String {
        guard let number = try? self.configuration(.bundleId) else {
            fatalError("Missing Environment Configuration: Bundle Version String")
        }
        
        return number
    }
}
