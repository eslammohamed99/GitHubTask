//
//  DetailViewVC.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//

import UIKit

class DetailView: UIViewController, DetailViewProtocol {
    var detailUIView: DetailUIView?
    var viewModel: DetailViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureNavigation()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigation()
    }
    private func configureNavigation() {
            navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

private extension DetailView {
    func setupUI() {
        if let viewModel = viewModel as? DetailViewModel {
            detailUIView = DetailUIView(viewModel: viewModel)
            addSubSwiftUIView(detailUIView, to: view, backgroundColor: .white)
        }
    }
}

