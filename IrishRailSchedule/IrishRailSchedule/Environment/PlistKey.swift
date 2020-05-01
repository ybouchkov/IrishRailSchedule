//
//  PlistKey.swift
//  IrishRailSchedule
//
//  Created by Yani Buchkov on 1.05.20.
//  Copyright © 2020 Yani Buchkov. All rights reserved.
//

import Foundation

/**
 PlistKey enum

 - Description: Define all properties, which are added in .plist file

 You can add whenever you need and declare them into Environment

 */
enum PlistKey {

    /// API Base URL
    case serverUrl

    /// Helpers
    case version
    case build
    case bundleId

    var value: String {
        switch self {
        case .serverUrl:
            return "Application_API_URL"
        case .version:
            return "CFBundleShortVersionString"
        case .build:
            return "CFBundleVersion"
        case .bundleId:
            return "CFBundleIdentifier"
        }
    }

    var description: String {
        return "IrishRail-DEV" // for example
    }

}
