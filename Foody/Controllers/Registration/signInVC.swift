//
//  SignInViewController.swift
//  Foody
//
//  Created by Khalid Gad on 06/09/2024.
//

import UIKit
import LocalAuthentication

class SignInViewController: UIViewController {

    var context = LAContext()

    var user: User!
    
    @IBOutlet weak var signInEmailTF: CustomTextField!
    @IBOutlet weak var signInPasswordTF: CustomTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        self.navigationItem.hidesBackButton = true
        title = "Sign In"
    }
    
    private func configureTextFields() {
        signInEmailTF.setType(.email)
        signInEmailTF.placeholder = "Enter your Email"
        
        signInPasswordTF.setType(.password)
        signInPasswordTF.placeholder = "Enter your Password"
    }
    
    @IBAction func signUpBtnTapped(_ sender: Any) {
        let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignupVC
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @IBAction func signInBtnTapped(_ sender: Any) {
        
        guard let email = signInEmailTF.text, let password = signInPasswordTF.text else {return}
        
        if email == user.email && password == user.password {
            
            let profileVC = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC
            profileVC?.user = user!
            
            let newuser = user
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NewUser"), object: nil, userInfo: ["User":newuser!])
        
            let homeVC = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC
            homeVC?.user = user
            homeVC?.modalPresentationStyle = .fullScreen
            self.present(homeVC!, animated: true)
        
            goToProfileScreen(with: newuser!)
            
            signInEmailTF.text = ""
            signInPasswordTF.text = ""
        } else {
            self.showAlert(title: "Sorry", message: "Please Enter a Valid Email & Passowrd" )
        }
    }
    
    private func goToProfileScreen(with user: User) {
        let profile = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        profile.user = user
    }
    
}
