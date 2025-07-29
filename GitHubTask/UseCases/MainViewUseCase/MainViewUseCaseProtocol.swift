//
//  MainViewUseCaseProtocol.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//


protocol MainViewUseCaseProtocol {
    func getReposList() async throws -> [Repository]?
}
