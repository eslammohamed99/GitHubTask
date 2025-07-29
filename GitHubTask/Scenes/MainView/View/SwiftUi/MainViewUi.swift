//
//  MainViewUi.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//

import SwiftUI

struct MainViewUi: View {
    @ObservedObject var viewModel: MainViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            MainViewUIView(viewModel: viewModel).shimmering(active: viewModel.isLoading)
        }
        .padding(20)
//        .onAppear { Task { viewModel.viewLoaded() } }
    }
}

