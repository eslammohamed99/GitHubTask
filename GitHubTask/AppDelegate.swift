//
//  AppDelegate.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    public var rootCoordinator: BaseCoordinatorProtocol?
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupWindow()
        openSplashCoordinator()
        return true
    }
    
    private func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
    
    private func openSplashCoordinator() {
        guard let window = window else { return }
        
        struct UseCase: MainViewCoordinatorUseCaseProtocol {
            var window: UIWindow
        }
        
        let root = MainViewCoordinator(useCase: UseCase(window: window))
        rootCoordinator = root
        root.start()
    }
    
}
class AppWindow {
    static let shared = UIWindow(frame: UIScreen.main.bounds)
}

let appDelegate = UIApplication.shared.delegate as? AppDelegate


