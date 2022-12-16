//
//  HelperReachability.swift
//  ProductListDemo_ThirdwayvChallenge
//
//  Created by Semicolon on 16/12/2022.
//

import Foundation

class HelperReachability {
    static let shared = HelperReachability()
    
    private init() {}
    
     var bindToReachabilityStatus: (() -> Void)?
     var status: Bool? {
        didSet {
            bindToReachabilityStatus?()
        }
    }
    
    func handleReachability(reachability: Reachability) {
        DispatchQueue.main.async {
            reachability.whenReachable = { [weak self] reachability in
                guard let self = self else { return }
                
                if reachability.connection == .wifi {
                    self.status = true
                } else {
                    self.status = true
                }
            }
            reachability.whenUnreachable = { _ in
                self.status = false
            }
            
            do {
                try reachability.startNotifier()
            } catch {
                self.status = false
            }
        }
    }
}

