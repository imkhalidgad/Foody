//
//  secondSignupVC.swift
//  Foody
//
//  Created by Khalid Gad on 06/09/2024.
//


import UIKit
import FittedSheets

class secondSignupVC: UIViewController, CountrySelectionDelegate {
    
    var user: User!
    
    @IBOutlet weak var signUpPhoneTF: CustomTextField!
    @IBOutlet weak var signUpAddressTF: CustomTextField!
    @IBOutlet weak var signUpCountryTF: CustomTextField!
    @IBOutlet weak var signUpDateTF: CustomTextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign Up"
        print(user!)
        TxtFields()
    }
    
    @IBAction func signUpBtnTapped(_ sender: Any){
        if isValidData() {
            user = getUserData()
            print(user!)
            self.goToLoginScreen(with: user!)
        }
    }
    
    private func goToLoginScreen(with user: User) {
        let SignIn = self.storyboard?.instantiateViewController(withIdentifier: "SignInVC") as! SignInViewController
        SignIn.user = user
        self.navigationController?.pushViewController(SignIn, animated: true)
    }
    
    @objc func showCountryPicker() {
        guard let countrySheet = storyboard?.instantiateViewController(withIdentifier: "countrySheetVC") as? countrySheetVC else {
            print("Could not instantiate countrySheetVC")
            return
        }
        countrySheet.delegate = self
        
        let sheetController = SheetViewController(controller: countrySheet, sizes: [.fixed(500), .percent(0.5), .intrinsic])
        sheetController.cornerRadius=50
        sheetController.gripColor=UIColor(named: "LabelColor")
        self.present(sheetController, animated: true, completion: nil)
    }
    
    func didSelectCountry(country: Country) {
        signUpCountryTF.text = country.label
    }
}


// MARK: Private Functions
extension secondSignupVC {
    private func isValidData() -> Bool {
        
        guard signUpPhoneTF.text?.trimmed != "", isValidPhoneNumber(signUpPhoneTF.text!) else {
            self.showAlert(title: "Sorry", message: "Please enter your correct phone number!")
            return false
        }
        
        guard signUpAddressTF.text?.trimmed != "" else {
            self.showAlert(title: "Sorry", message: "Please enter your address!")
            return false
        }
        
        guard signUpCountryTF.text?.trimmed != "" else {
            self.showAlert(title: "Sorry", message: "Please Select your Country!")
            return false
        }
        
        guard signUpDateTF.text?.trimmed != "" else {
            self.showAlert(title: "Sorry", message: "Please Select your Date of Birth!")
            return false
        }
        return true
    }
    
    private func getUserData() -> User {
        user?.address = signUpAddressTF.text
        user?.phoneNumber = signUpPhoneTF.text
        user?.country = signUpCountryTF.text
        user?.dateOfBirth = signUpDateTF.text
        return user!
    }
    
    private func isValidPhoneNumber(_ number: String) -> Bool {
        let phoneNumberRegex = "^(010|011|012|015)\\d{8}$"
        return NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex).evaluate(with: number)
    }
    
    private func TxtFields(){
        
        signUpPhoneTF.setType(.phone)
        signUpPhoneTF.placeholder = "Enter your Phone Number"
        
        signUpAddressTF.setType(.address)
        signUpAddressTF.placeholder = "Enter your Address"
        
        signUpCountryTF.setType(.country)
        signUpCountryTF.placeholder = "Select your Country"
        
        signUpCountryTF.addTarget(self, action: #selector(showCountryPicker), for: .editingDidBegin)
        
        signUpDateTF.setType(.dateOfBirth)
        signUpDateTF.placeholder = "dd/MM/yyyy"
        
    }
}
