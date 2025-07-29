//
//  MainViewCoordinator.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//

import UIKit

class MainViewCoordinator: BaseCoordinator, MainViewCoordinatorProtocol {
    private var callback: MainViewCoordinatorCall?
    private var viewModel:MainViewModelProtocol?
    private weak var window: UIWindow?
    required init(useCase: MainViewCoordinatorUseCaseProtocol) {
        window = useCase.window
        super.init()
        self.viewModel = MainViewModel(
                    callback: processViewModelCallback(),
                    mainViewtUseCase: MainViewUseCase()
                )
    }

    func start() {
        let view:MainViewViewProtocol & UIViewController = MainViewVC()
        view.viewModel = viewModel
        let navigationController = UINavigationController(rootViewController: view)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        self.navigationController = navigationController
    }
    
    func gotoRepoDetail(repoInfo: Repository){
        struct UseCase: DetailCoordinatorUseCaseProtocol {
            var Info: Repository?
            var navigationController: UINavigationController
        }
        guard let navigationController = navigationController else {
            return
        }
        let coordinator = DetailCoordinator(
            useCase: UseCase(Info: repoInfo, navigationController: navigationController))
        addChild(coordinator)
        coordinator.start(
            callback: { [weak self] type in
                guard let self = self else {
                    return
                }
                switch type {
                case.back:
                    self.navigationController?.popViewController(animated: true)
                }
            })
    }
}

private extension MainViewCoordinator {
    func processViewModelCallback() ->MainViewModelCallback {
        return { [weak self] type in
            switch type {
            case .back:
                break
            case .detailRepo(let repoInfo):
                self?.gotoRepoDetail(repoInfo: repoInfo)
            }
        }
    }
}
