//
//  Coordinator.swift
//  ProductListDemo_ThirdwayvChallenge
//
//  Created by Semicolon on 14/12/2022.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start()
}

extension Coordinator {
    func show(viewController: UIViewController, animated: Bool = true) {
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func pop(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool = true) {
        navigationController.popToRootViewController(animated: animated)
    }
    
    func present(coordinator: Coordinator, animated: Bool = true, completion: @escaping () -> Void = {}) {
        navigationController.present(coordinator.navigationController, animated: animated, completion: completion)
    }
    
    func dismiss(animated: Bool = true, completion: @escaping () -> Void = {}) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
}


 
