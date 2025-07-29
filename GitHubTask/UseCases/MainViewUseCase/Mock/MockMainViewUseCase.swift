//
//  MockMainViewUseCase.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//
import Foundation
class MockMainViewUseCase: MainViewUseCaseProtocol {
    var shouldReturnError = false
    var mockRepos: [Repository] = []

    func getReposList() async throws -> [Repository]? {
        if shouldReturnError {
            throw URLError(.badServerResponse)
        }
        return mockRepos
    }
}
