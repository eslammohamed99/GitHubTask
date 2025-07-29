//
//  MainViewModel.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//
import Foundation
import Combine
class MainViewModel: MainViewModelProtocol, ObservableObject {

    // MARK: - Published Variables
  //  @Published var displayModel = [BugPresentedDataViewModel]()
    @Published var reposList: [Repository]?
    @Published var reposPresnetationList: [PresentedDataViewModel] = PresentedDataViewModel.dumpyDataForShimring
    @Published var isLoading = true
    // MARK: - Variables
    var callback: MainViewModelCallback
    private var cancellables = Set<AnyCancellable>()
    private let mainViewtUseCase: MainViewUseCaseProtocol

    init(callback: @escaping MainViewModelCallback, mainViewtUseCase: MainViewUseCaseProtocol) {
        self.callback = callback
        self.mainViewtUseCase = mainViewtUseCase
    }
    // MARK: - Functions
    
    func viewLoaded() {
        Task {
            await fetchReposList()
        }
    }

    func refreshData() {
        Task {
            await fetchReposList()
        }
    }

    func repoSelectionAction(item: PresentedDataViewModel) {
        if let repo = reposList?.first(where: {$0.id == item.repoId}) {
            self.callback(.detailRepo(repo))
        }
    }

    @MainActor
    func fetchReposList() async {
        toggleLoading(true)
        defer { toggleLoading(false) } // Ensures it always runs, success or failure

        do {
            let response = try await mainViewtUseCase.getReposList()
            self.reposList = response
            self.reposPresnetationList = response?.mapToRepresentbalType() ?? []
        } catch {
            self.reposList = nil
            self.reposPresnetationList = []
        }
    }

    @MainActor
    func toggleLoading(_ bool: Bool) {
        isLoading = bool
    }
}
