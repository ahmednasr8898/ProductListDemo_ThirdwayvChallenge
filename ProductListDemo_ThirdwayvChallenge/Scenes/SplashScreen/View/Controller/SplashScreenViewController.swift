//
//  SplashScreenViewController.swift
//  ProductListDemo_ThirdwayvChallenge
//
//  Created by Semicolon on 16/12/2022.
//

import UIKit

class SplashScreenViewController: UIViewController {

    //MARK: - outlets
    //
    @IBOutlet weak var splashTextLabel: UILabel!
    
    //MARK: - variables
    //
    weak var coordinator: SplashCoordinatorProtocol?
    
    //MARK: - life cycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        animationSplash()
    }
}


//MARK: - animation
//
extension SplashScreenViewController {
    private func animationSplash() {
        splashTextLabel.text = ""
        let title = "Thirdwayv"
        var charIndex = 0.0
        
        for letter in title {
            
            Timer.scheduledTimer(withTimeInterval: 0.25 * charIndex, repeats: false) { [weak self] timer in
                guard let self = self else {return}
                self.splashTextLabel.text?.append(letter)
            }
            charIndex += 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            guard let self = self else { return }
            self.coordinator?.presentProducts()
        }
    }
}
