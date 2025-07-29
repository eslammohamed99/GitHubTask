//
//  MainViewUseCase.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//

class MainViewUseCase: MainViewUseCaseProtocol {
    private let networkService: Requestable
    private let apiSettings: ApiSettings
    
    init() {
            self.networkService = NativeRequestable()
            self.apiSettings = ApiSettings()
        }

    func getReposList() async throws -> [Repository]? {
        let headers = AppNetworkServices.getGeneralHeaders()
        let baseUrl = apiSettings.baseURL + APIEndPoints.getReposEndPoint()
        
        let request = NetworkRequest(url: baseUrl, headers: headers, reqBody: nil, httpMethod: .GET)
        return try await networkService.request(request, true)
    }
}
