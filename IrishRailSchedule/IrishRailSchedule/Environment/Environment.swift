//
//  Environment.swift
//  IrishRailSchedule
//
//  Created by Yani Buchkov on 1.05.20.
//  Copyright © 2020 Yani Buchkov. All rights reserved.
//

import Foundation

/**
 Environment
 
 - Description: Define all properties from PlistKey enum
 
 */
final class Environment {

    // MARK: - Singleton

    static let shared = Environment()
    private init() {}

    /// infoDict: Property for finding the exact .plist
    private var infoDictionary: [String: Any] {
        if let infoDictionary = Bundle.main.infoDictionary {
            return infoDictionary
        } else {
            fatalError("Plist file not found")
        }
    }

    /// - Parameters: key - from PlistKey Type
    /// - Returns: String
    ///  The real string of the property with the same name like into .plist file
    func configuration(_ key: PlistKey) throws -> String {
        guard let value = infoDictionary[key.value] as? String else {
            throw EnvironmentError.invalidConfiguration(key: key)
        }

        return value
    }

}

// MARK: - Custom Error

enum EnvironmentError: Error {

    case invalidConfiguration(key: PlistKey)

}
