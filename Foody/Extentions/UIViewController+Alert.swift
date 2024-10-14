//
//  UIViewController+Alert.swift
//  Foody
//
//  Created by Khalid Gad on 06/09/2024.
//

import UIKit

extension UIViewController{
    func showAlert (title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
    
    func showLogoutAlert(logoutHandler: @escaping () -> Void) {
            let alert = UIAlertController(title: "Logout", message: "Are you sure you want to logout?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { _ in
                logoutHandler()
            }))
            alert.addAction(UIAlertAction(title: "No", style: .cancel))
            present(alert, animated: true)
        }
}
