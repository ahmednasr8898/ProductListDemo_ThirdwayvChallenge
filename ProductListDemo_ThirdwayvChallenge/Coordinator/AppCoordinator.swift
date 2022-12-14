//
//  AppCoordinator.swift
//  ProductListDemo_ThirdwayvChallenge
//
//  Created by Semicolon on 14/12/2022.
//

import UIKit

class AppCoordinator: Coordinator {
    let navigationController: UINavigationController
    let window: UIWindow
    private var children: [Coordinator] = []
    
    init(window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        presentProductCoordinator()
    }
}

extension AppCoordinator {
    private func presentProductCoordinator() {
        let productCoordinator = ProductCoordinator()
        children.removeAll()
        startCoordinator(productCoordinator)
        replaceWindowRootViewController(productCoordinator.navigationController)
    }
}

//MARK: start coordinator
//
private extension AppCoordinator {
    private func startCoordinator(_ coordinator: Coordinator) {
        children = [coordinator]
        coordinator.start()
    }
}

// MARK: replace root view controller Window
//
private extension AppCoordinator {
    func replaceWindowRootViewController(_ viewController: UIViewController) {
        UIView.transition(with: window, duration: 0.3, options: [.transitionCrossDissolve], animations: {
            self.window.rootViewController = viewController
            self.window.makeKeyAndVisible()
        }, completion: { _ in
            // maybe do something on completion here
        })
    }
}
