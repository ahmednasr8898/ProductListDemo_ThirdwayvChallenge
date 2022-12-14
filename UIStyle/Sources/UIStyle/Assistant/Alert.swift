//
//  File.swift
//  
//
//  Created by Semicolon on 14/12/2022.
//

import UIKit

public struct Alert {
    private static func createBasicAlert(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
        alert.addAction(okButton)
        vc.present(alert, animated: true, completion: nil)
    }
    
    public static func failedToConnectWithServerAlert(on vc: UIViewController){
        createBasicAlert(on: vc, with: "", message: "Faield To Connect With Server")
    }
    
    public static func failedToFetchResponseAlert(on vc: UIViewController){
        createBasicAlert(on: vc, with: "", message: "Faield To Fetch Response")
    }
    
    public static func defaultAlert(on vc: UIViewController, title: String = "", message: String){
        createBasicAlert(on: vc, with: title, message: message)
    }
}
