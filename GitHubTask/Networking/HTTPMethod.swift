//
//  NetworkModels.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//

import Foundation


public enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

public struct NetworkError: Swift.Error {
    var code: Int?
    var message: String?
    var description: String?
}

struct ErrorModel:Codable {
    let error:String?
    let error_description:String?
}
