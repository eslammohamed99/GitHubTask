//
//  ApiServices.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//

import SwiftUI

protocol ApiServices {}

class AppNetworkServices: ApiServices {
    let apiSettings: ApiSettings = ApiSettings.shared
    
    var networkRequest: Requestable
    
    init(networkRequest: Requestable) {
        self.networkRequest = networkRequest
    }
    
    static func getGeneralHeaders() -> [String : String]{
        
      //  let apiSettings: ApiSettings = ApiSettings.shared
        let headers : [String:String] = [:]
//        headers["Authorization"] = apiSettings.token
//        headers["Profile"] = apiSettings.userProfile ?? apiSettings.account?.profiles?.first?.id
//        headers["Lang"] = LocaleManager.currentLanguage().rawValue
        return headers
    }
    
}


