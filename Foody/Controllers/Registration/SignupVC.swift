//
//  SignupVC.swift
//  Foody
//
//  Created by Khalid Gad on 06/09/2024.
//

import UIKit

class SignupVC: UIViewController {
    
   
    @IBOutlet weak var signUpEmailTF: CustomTextField!
    @IBOutlet weak var signUpPasswordTF: CustomTextField!
    @IBOutlet weak var signUpNameTF: CustomTextField!
    @IBOutlet weak var signUpProfileIMG: UIImageView!
    
    private let imagePaker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePaker.delegate = self
        signUpProfileIMG.layer.cornerRadius = 20
        signUpProfileIMG.layer.masksToBounds = true
        
        TxtFields()
        setupNavBar()
    }
    
    @IBAction func profileIMGBTN(_ sender: Any){
        imagePaker.allowsEditing = true
        imagePaker.sourceType = .photoLibrary
        present(imagePaker, animated: true, completion: nil)
    }
    
    @IBAction func continueButton(_ sender: Any) {
        if isValidData() {
            let user = getUserData()
            self.goToCompleteRegisterScreen(with: user)
        }
    }
        
    @IBAction func signInButton(_ sender: Any) {
        let SignIn = self.storyboard?.instantiateViewController(withIdentifier: "SignInVC") as! SignInViewController
        self.navigationController?.pushViewController(SignIn, animated: true)
    }
    
}


// MARK: - Private Methods
extension SignupVC {
    private func isValidData() -> Bool {
        guard signUpProfileIMG.image != UIImage(systemName: "person.crop.circle.badge.plus") else {
            self.showAlert(title: "Sorry", message: "Please Add Profile Pic!")
            return false
        }
        
        guard signUpNameTF.text?.trimmed != "" else {
            self.showAlert(title: "Sorry", message: "Please enter your name!")
            return false
        }
        
        guard signUpEmailTF.text?.trimmed != "", isValidEmail(signUpEmailTF.text!) else {
        self.showAlert(title: "Sorry", message: "Please enter your correct email!")
            return false
        }
        
        guard signUpPasswordTF.text?.trimmed != "", isValidPassword(signUpPasswordTF.text!) else {
            self.showAlert(title: "Sorry", message: "Please enter a correct password! your password must contain at least 8 characters, including Uppercase, Lowercase, Special Characters and numbers")
            return false
        }
        
        guard signUpPasswordTF.text?.trimmed != "" else {
            self.showAlert(title: "Sorry", message: "Please confirm your password!")
            return false
        }
  
        return true
    }
    
    
    private func goToCompleteRegisterScreen(with user: User) {
        let SignUp2 = self.storyboard?.instantiateViewController(withIdentifier: "secondSignupVC") as! secondSignupVC
        SignUp2.user = user
        self.navigationController?.pushViewController(SignUp2, animated: true)
    }
    
    private func getUserData() -> User {
        let user = User(image: signUpProfileIMG.image!, fullName: signUpNameTF.text!, email: signUpEmailTF.text!, password: signUpPasswordTF.text!)
        return user
    }
    
    private func isPasswordConfirmed(password: String, conrimPassword: String) -> Bool {
        if password == conrimPassword {
            return true
        }
        self.showAlert(title: "Sorry", message: "The password isn't confirmed successfully!")
        return false
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[a-z._%+a-z-0-9]+@[A-Za-z0-9.-]+\\.(com|net|org)$"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d).{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
    
    private func isValidPhoneNumber(_ number: String) -> Bool {
        let phoneNumberRegex = "^(010|011|012|015)\\d{8}$"
        return NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex).evaluate(with: number)
    }
    
    
    private func setupNavBar(){
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "DRop down 1")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "DRop down 1")
        navigationItem.leftItemsSupplementBackButton = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        title = "Sign Up"
    }
    
    private func TxtFields() {
        signUpNameTF.setType(.name)
        signUpNameTF.placeholder = "Enter your name"
        
        signUpEmailTF.setType(.email)
        signUpEmailTF.placeholder = "Enter your Email"
        
        signUpPasswordTF.setType(.password)
        signUpPasswordTF.placeholder = "Enter your Password"
    }
    
}

// MARK: Image Packer Function
extension SignupVC: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        dismiss(animated: true)
        signUpProfileIMG.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
    }
    
}
