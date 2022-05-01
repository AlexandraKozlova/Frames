//
//  ViewController+Ext.swift
//  Frames
//
//  Created by Aleksandra on 28.04.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        
        DispatchQueue.main.async {
            let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            let alertButton = UIAlertAction(title: buttonTitle, style: .cancel)
            alertVC.addAction(alertButton)
            self.present(alertVC, animated: true)
        }
        
    }
}

