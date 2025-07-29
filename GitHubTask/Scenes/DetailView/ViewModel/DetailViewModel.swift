//
//  DetailViewModel.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//

import Foundation
import UIKit

class DetailViewModel: DetailViewModelProtocol, ObservableObject {

    // MARK: - Published Variables
    @Published var displayModel: DetailPresentedDataResource?
    @Published var repoInfo: Repository?

    // MARK: - Variables
    var callback: DetailViewModelCallback
    init(repoInfo: Repository?, callback: @escaping DetailViewModelCallback) {
        self.repoInfo = repoInfo
        self.displayModel = repoInfo?.mapToRepresentbalType()
        self.callback = callback
    }

    // MARK: - Functions
    func viewDidLoad() {

    }

}

extension DetailViewModel {
    enum DetailActions {
        case back
    }
}
