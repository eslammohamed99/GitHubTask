//
//  DetailViewResource.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//

struct DetailPresentedDataResource {
    let repoId: Int
    let repoName: String
    let repoImage: String
    let repoDesciption: String
    let repoLink: String
    let repoOwnerName: String
    let repoOwnerId: Int
    let repoCreatedDate: String
    init(repoId: Int, repoName: String, repoImage: String, repoDesciption: String, repoLink: String, repoOwnerName: String, repoOwnerId: Int, repoCreatedDate: String) {
        self.repoId = repoId
        self.repoName = repoName
        self.repoImage = repoImage
        self.repoDesciption = repoDesciption
        self.repoLink = repoLink
        self.repoOwnerName = repoOwnerName
        self.repoOwnerId = repoOwnerId
        self.repoCreatedDate = repoCreatedDate
    }

}


extension Repository {
    func mapToRepresentbalType() -> DetailPresentedDataResource {
        return DetailPresentedDataResource(repoId: self.id,
                                            repoName: self.name ?? "",
                                            repoImage: self.owner?.avatarURL ?? "",
                                            repoDesciption: self.description ?? "",
                                           repoLink: self.htmlURL ?? "",
                                            repoOwnerName: self.owner?.login ?? "",
                                            repoOwnerId: self.owner?.id ?? 0,
                                            repoCreatedDate: formattedDate(createDate: self.createdDate))
    }
}
