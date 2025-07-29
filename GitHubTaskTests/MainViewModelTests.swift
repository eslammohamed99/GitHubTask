//
//  MainViewModelTests.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//

import XCTest
@testable import GitHubTask
import Combine

final class MainViewModelTests: XCTestCase {
    var viewModel: MainViewModel!
    var mockUseCase: MockMainViewUseCase!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        cancellables = []
        mockUseCase = MockMainViewUseCase()
        viewModel = MainViewModel(callback: { _ in }, mainViewtUseCase: mockUseCase)
    }

    override func tearDown() {
        viewModel = nil
        mockUseCase = nil
        cancellables = nil
        super.tearDown()
    }

    func testFetchReposSuccess() async throws {
        let sampleRepo = Repository(
            id: 1,
            name: "TestRepo",
            owner: .init(login: "Eslam", id: 101),
            createdDate: Date()
        )
        mockUseCase.mockRepos = [sampleRepo]

        let expectation = XCTestExpectation(description: "Wait for reposList to be populated")
        
        viewModel.$reposList
            .dropFirst() // skip initial nil
            .sink { repos in
                if let repos = repos, repos.count == 1 {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        await viewModel.viewLoaded()
        
        wait(for: [expectation], timeout: 2.0)
        
        XCTAssertEqual(viewModel.reposPresnetationList.first?.repoId, 1)
    }


    func testFetchReposFailure() async throws {
        // GIVEN
        mockUseCase.shouldReturnError = true

        // Expectation to wait for loading to stop
        let expectation = XCTestExpectation(description: "Wait for loading to stop")

        viewModel.$isLoading
            .dropFirst() // skip initial
            .sink { isLoading in
                if !isLoading {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        // WHEN
        await viewModel.fetchReposList()
        // THEN (wait for state updates)
   //     wait(for: [expectation], timeout: 2.0)

        XCTAssertFalse(viewModel.isLoading, "Loading should stop even on error")
        XCTAssertNil(viewModel.reposList)
        XCTAssertTrue(viewModel.reposPresnetationList.isEmpty)
    }


    func testRepoSelectionAction() {
        // GIVEN
        let sampleRepo = Repository(
            id: 1,
            name: "TestRepo",
            owner: .init(login: "Eslam", id: 101),
            description: "test descrip",
            createdDate: Date()
        )
        mockUseCase.mockRepos = [sampleRepo]
        
        var callbackCalled = false
        
        // Initialize ViewModel first (with callback)
        viewModel = MainViewModel(callback: { event in
            if case .detailRepo(_) = event {
                callbackCalled = true
            }
        }, mainViewtUseCase: mockUseCase)
        
        // Now set the repo data AFTER the viewModel is initialized
        viewModel.reposList = [sampleRepo]
        viewModel.reposPresnetationList = [
            PresentedDataViewModel(
                repoId: 1,
                repoName: "TestRepo",
                repoImage: "",
                repoOwnerName: "Eslam",
                repoOwnerId: 101,
                repoCreatedDate: "2025-07-29"
            )
        ]
        
        // WHEN
        viewModel.repoSelectionAction(item: viewModel.reposPresnetationList.first!)
        
        // THEN
        XCTAssertTrue(callbackCalled, "Callback should be triggered on selection")
    }

}
