//
//  MainViewCoordinatorProtocol.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//

import Foundation
import UIKit
enum MainViewCoordinatorCallbackType {
    case back
}
typealias MainViewCoordinatorCall = ((MainViewCoordinatorCallbackType) -> Void)
protocol MainViewCoordinatorUseCaseProtocol {
    var window: UIWindow { get set }
}
protocol MainViewCoordinatorProtocol: AnyObject {
    init(useCase: MainViewCoordinatorUseCaseProtocol)
    func start()
}
