//
//  GeneralBahryModel.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//

import Foundation

struct GeneralModel: Codable {
   
    var set:Int?
    var error:String?
    var message:String?
    var obj:Any?
    
    enum CodingKeys: String, CodingKey {
        case set = "set", error, message
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        set = try? container.decodeIfPresent(Int.self, forKey: .set)
        error = try? container.decodeIfPresent(String.self, forKey: .error)
        message = try? container.decodeIfPresent(String.self, forKey: .message)
    }
}

