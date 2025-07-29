//
//  DetailViewCoordinatorProtocol.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//

import Foundation
import UIKit
enum DetailCoordinatorCallbackType {
    case back
}
typealias DetailCoordinatorCall = ((DetailCoordinatorCallbackType) -> Void)
protocol DetailCoordinatorUseCaseProtocol {
    var navigationController: UINavigationController { get set }
    var Info: Repository? { get }
}
protocol DetailCoordinatorProtocol: AnyObject {
    init(useCase: DetailCoordinatorUseCaseProtocol)
    func start(callback: @escaping DetailCoordinatorCall)
}
