//
//  SplashCoordinator.swift
//  ProductListDemo_ThirdwayvChallenge
//
//  Created by Semicolon on 16/12/2022.
//

import UIKit

protocol SplashCoordinatorProtocol: AnyObject {
    func showSplashScreen()
    func presentProducts()
}

class SplashCoordinator: Coordinator {
    let navigationController: UINavigationController
    private let presentProductsClosure: (()->())?
    
    init(presentProductsClosure: @escaping () -> Void) {
        self.navigationController = UINavigationController()
        self.presentProductsClosure = presentProductsClosure
    }
    
    func start() {
        showSplashScreen()
    }
}

extension SplashCoordinator: SplashCoordinatorProtocol {
    func showSplashScreen() {
        let splashScreenController = SplashScreenViewController()
        splashScreenController.coordinator = self
        show(viewController: splashScreenController)
    }
    
    func presentProducts() {
        presentProductsClosure?()
    }
}
