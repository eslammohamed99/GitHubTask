//
//  DetailViewModelProtocol.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//

import UIKit
enum DetailViewModelCallbackType {
    case back
    case gotoRepoLink(String)
}

typealias DetailViewModelCallback = (DetailViewModelCallbackType) -> Void

protocol DetailViewModelProtocol: AnyObject {
    var callback: DetailViewModelCallback { get set }
    func viewDidLoad()
}
