//
//  DetailViewUi.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//

import SwiftUI

struct DetailUIView: View {
    @ObservedObject  var viewModel: DetailViewModel

    var body: some View {
        VStack(spacing: 0) {
            // Custom Navigation Bar
            CustomNavigationBar(title: viewModel.displayModel?.repoOwnerName ?? "") {
                self.viewModel.callback(.back)
            }
            
            VStack(alignment: .center, spacing: 30) {
                // Content Section
                AvatarImageView(IconImg: viewModel.displayModel?.repoImage ?? "",
                                IconSize: .larg)
                VStack(alignment: .leading, spacing: 12) {
                    // 2. Owner name
                    Text("Repo Owner: \(viewModel.displayModel?.repoOwnerName ?? "")")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    // 1. Repository name
                    Text("Repo Name: \(viewModel.displayModel?.repoName ?? "")")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    // 2. Owner name
                    Text("Repo Decription: \(viewModel.displayModel?.repoDesciption ?? "")")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(nil)
                    Button {
                        self.viewModel.callback(.gotoRepoLink(viewModel.displayModel?.repoLink ?? ""))
                    } label: {
                        Text("Repo Link: \(viewModel.displayModel?.repoLink ?? "")")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(nil)
                            .underline(true)
                    }
                    
                    Text( "CreatedAt: \(viewModel.displayModel?.repoCreatedDate ?? "")")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
                
            }
            .padding(.top, 16)
            
        }.padding(.horizontal, 16)
        .ignoresSafeArea(SafeAreaRegions.all, edges: .top)
    }
}

