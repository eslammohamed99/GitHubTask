//
//  PresentedDataViewModel.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//

import Foundation
import SafariServices
import UIKit

class DetailCoordinator: BaseCoordinator, DetailCoordinatorProtocol {

    private var callback: DetailCoordinatorCall?
    private var viewModel: DetailViewModelProtocol?
    required init(useCase: DetailCoordinatorUseCaseProtocol) {
        super.init(navigationController: useCase.navigationController)
        viewModel = DetailViewModel(repoInfo: useCase.Info, callback: processViewModelCallback())
    }

    func start(callback: @escaping DetailCoordinatorCall) {
        self.callback = callback
        let view: DetailViewProtocol & UIViewController = DetailView()
        view.viewModel = viewModel
        navigationController?.pushViewController(view, animated: true)
    }
    
//    func openInSafari(urlString: String) {
//        guard let url = URL(string: urlString) else { return }
//        UIApplication.shared.open(url, options: [:], completionHandler: nil)
//    }
    func openInAppSafari(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemBlue // Optional: customize tint
        self.navigationController?.present(safariVC, animated: true)
    }

}

private extension DetailCoordinator {
    func processViewModelCallback() -> DetailViewModelCallback {
        return { [weak self] type in
            switch type {
            case .back:
                self?.callback?(.back)
            case .gotoRepoLink(let link):
                self?.openInAppSafari(urlString: link)
            }
        }
    }
}
