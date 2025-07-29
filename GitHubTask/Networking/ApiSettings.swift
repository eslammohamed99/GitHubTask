//  ApiSettings.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//


import Foundation
import SwiftUI

enum EnvironmentTypes {
    case dev
    case production
    
    var baseUrl: String {
        switch self {
        case .dev: return "https://api.github.com/"
        case .production: return "https://api.github.com/"
        }
    }
}

//MARK: - API SETTING ...
class ApiSettings {
    init() {}
    static let shared = ApiSettings()

    let currentEnviroment: EnvironmentTypes = .production

    var baseURL: String {
        return currentEnviroment.baseUrl
    }
}
