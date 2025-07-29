//
//  MainViewProtocol.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//

import Foundation


enum MainViewModelCallbackType {
    case back
    case detailRepo(Repository)
}

typealias MainViewModelCallback = (MainViewModelCallbackType) -> Void

protocol MainViewModelProtocol: AnyObject {
    var callback: MainViewModelCallback { get set }
    func viewLoaded()
    func refreshData()
    func toggleLoading(_ bool: Bool)
}
