//
//  MainViewResources.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//

import Foundation

struct PresentedDataViewModel {
    let repoId: Int
    let repoName: String
    let repoImage: String
    let repoOwnerName: String
    let repoOwnerId: Int
    let repoCreatedDate: String
    init(repoId: Int, repoName: String, repoImage: String, repoOwnerName: String, repoOwnerId: Int, repoCreatedDate: String) {
        self.repoId = repoId
        self.repoName = repoName
        self.repoImage = repoImage
        self.repoOwnerName = repoOwnerName
        self.repoOwnerId = repoOwnerId
        self.repoCreatedDate = repoCreatedDate
    }
    static var dumpyDataForShimring: [PresentedDataViewModel] {
        var array: [PresentedDataViewModel] = []
        for _ in 1...5 {
            array.append(PresentedDataViewModel(repoId: 0, repoName: "",
                                                repoImage: "dummy", repoOwnerName: "dummy", repoOwnerId: 0, repoCreatedDate: "dummy"))
        }
        return array
    }
}

func formattedDate(createDate:Date) -> String {
    return createDate.formattedDisplay(neededDateMonthes: 6)
}

// MARK: - Repository Model
struct Repository: Codable {
    static let dummy = Repository(id: 0, name:"dummy", owner: Owner(login: "dummy", id: 0))
    let id: Int
    var nodeID: String?
    var name: String?
    var fullName: String?
    var isPrivate: Bool?
    var owner: Owner?
    var htmlURL: String?
    var description: String?
    var fork: Bool?
    var url: String?
    var forksURL: String?
    var keysURL: String?
    var collaboratorsURL: String?
    var teamsURL: String?
    var hooksURL: String?
    var issueEventsURL: String?
    var eventsURL: String?
    var assigneesURL: String?
    var branchesURL: String?
    var tagsURL: String?
    var blobsURL: String?
    var gitTagsURL: String?
    var gitRefsURL: String?
    var treesURL: String?
    var statusesURL: String?
    var languagesURL: String?
    var stargazersURL: String?
    var contributorsURL: String?
    var subscribersURL: String?
    var subscriptionURL: String?
    var commitsURL: String?
    var gitCommitsURL: String?
    var commentsURL: String?
    var issueCommentURL: String?
    var contentsURL: String?
    var compareURL: String?
    var mergesURL: String?
    var archiveURL: String?
    var downloadsURL: String?
    var issuesURL: String?
    var pullsURL: String?
    var milestonesURL: String?
    var notificationsURL: String?
    var labelsURL: String?
    var releasesURL: String?
    var deploymentsURL: String?
    var createdDate = DateManager.randomCreatedDate()

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case isPrivate = "private"
        case owner
        case htmlURL = "html_url"
        case description
        case fork, url
        case forksURL = "forks_url"
        case keysURL = "keys_url"
        case collaboratorsURL = "collaborators_url"
        case teamsURL = "teams_url"
        case hooksURL = "hooks_url"
        case issueEventsURL = "issue_events_url"
        case eventsURL = "events_url"
        case assigneesURL = "assignees_url"
        case branchesURL = "branches_url"
        case tagsURL = "tags_url"
        case blobsURL = "blobs_url"
        case gitTagsURL = "git_tags_url"
        case gitRefsURL = "git_refs_url"
        case treesURL = "trees_url"
        case statusesURL = "statuses_url"
        case languagesURL = "languages_url"
        case stargazersURL = "stargazers_url"
        case contributorsURL = "contributors_url"
        case subscribersURL = "subscribers_url"
        case subscriptionURL = "subscription_url"
        case commitsURL = "commits_url"
        case gitCommitsURL = "git_commits_url"
        case commentsURL = "comments_url"
        case issueCommentURL = "issue_comment_url"
        case contentsURL = "contents_url"
        case compareURL = "compare_url"
        case mergesURL = "merges_url"
        case archiveURL = "archive_url"
        case downloadsURL = "downloads_url"
        case issuesURL = "issues_url"
        case pullsURL = "pulls_url"
        case milestonesURL = "milestones_url"
        case notificationsURL = "notifications_url"
        case labelsURL = "labels_url"
        case releasesURL = "releases_url"
        case deploymentsURL = "deployments_url"
    }
}

// MARK: - Owner Model
struct Owner: Codable {
    var login: String?
    let id: Int
    var nodeID: String?
    var avatarURL: String?
    var gravatarID: String?
    var url: String?
    var htmlURL: String?
    var followersURL: String?
    var followingURL: String?
    var gistsURL: String?
    var starredURL: String?
    var subscriptionsURL: String?
    var organizationsURL: String?
    var reposURL: String?
    var eventsURL: String?
    var receivedEventsURL: String?
    var type: String?
    var userViewType: String?
    var siteAdmin: Bool?

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case userViewType = "user_view_type"
        case siteAdmin = "site_admin"
    }
}
extension [Repository] {
    func mapToRepresentbalType() -> [PresentedDataViewModel] {
        return self.map { repo in
            return PresentedDataViewModel(repoId: repo.id,
                                          repoName:  repo.name ?? "",
                                          repoImage: repo.owner?.avatarURL ?? "",
                                          repoOwnerName: repo.owner?.login ?? "",
                                          repoOwnerId: repo.owner?.id ?? 0,
                                          repoCreatedDate: formattedDate(createDate: repo.createdDate))
        }
    }
}

