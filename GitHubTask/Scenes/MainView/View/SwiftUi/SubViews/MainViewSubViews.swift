//
//  MainViewSubViews.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//
enum Avatarsize: CGFloat{
    case small = 50.0
    case larg  = 120.0
}

import SwiftUI
 struct MainViewUIView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.reposPresnetationList, id: \.repoId) { repo in
                Button(action: {
                    self.viewModel.repoSelectionAction(item:repo)
                }, label: {
                    HStack(alignment: .top, spacing: 12) {
                        AvatarImageView(IconImg: repo.repoImage,
                                        IconSize: .small)

                        VStack(alignment: .leading, spacing: 4) {
                            // 1. Repository name
                            Text(repo.repoName)
                                .font(.headline)
                            
                            // 2. Owner name
                            Text(repo.repoOwnerName)
                                .font(.subheadline)
                                .foregroundColor(.secondary)

                            Text(repo.repoCreatedDate)
                                                    .font(.caption)
                                                    .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .inset(by: 0.5)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                    .padding(.vertical, 4)
                    .shimmering(active: viewModel.isLoading)
                })
                }
        }
    }
}

struct AvatarImageView: View {
    var IconImg:String
    var IconSize:Avatarsize = .small
    
    var body: some View {
        AsyncImage(url: URL(string: IconImg)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: IconSize.rawValue, height: IconSize.rawValue)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: IconSize.rawValue, height: IconSize.rawValue)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            case .failure:
                Image(systemName: "person.crop.circle.fill.badge.xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: IconSize.rawValue, height: IconSize.rawValue)
                    .foregroundColor(.gray)
            @unknown default:
                EmptyView()
            }
        }
    }
}
