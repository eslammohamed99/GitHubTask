//
//  MainView.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//

import UIKit
class MainViewVC: UIViewController, MainViewViewProtocol {
    
    var viewModel: MainViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        title = "Repo's List"
        let navbarImage = UIImage(named: "your-background-image")
        // Create a custom appearance for the navigation bar
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground() // Start with a clean slate
        // Set the background image
        appearance.backgroundImage = navbarImage
        // Keep your existing large title settings
        appearance.largeTitleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 40, weight: .ultraLight)
        ]
        // Apply the appearance to all navigation bar states
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.viewModel?.viewLoaded()
    }
}

private extension MainViewVC {
    func setupUI() {
        if let viewModel = viewModel as? MainViewModel {
            let swiftuiView = MainViewUi(viewModel: viewModel)
            addSubSwiftUIView(swiftuiView, to: view, backgroundColor: .white)
        }
    }
}
