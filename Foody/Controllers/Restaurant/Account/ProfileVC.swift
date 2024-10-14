//
//  ProfileVC.swift
//  Foody
//
//  Created by Khalid Gad on 06/09/2024.
//

import UIKit

class ProfileVC: UIViewController {

    var user: User!
    
    @IBOutlet weak var logOutBTN: UIButton!
    @IBOutlet weak var updateProfileIMGBTN: UIButton!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var fullNameUser: CustomTextField!
    @IBOutlet weak var dateOfBirthUser: CustomTextField!
    @IBOutlet weak var addressUser: CustomTextField!
    @IBOutlet weak var phoneNumberUser: CustomTextField!
    @IBOutlet weak var emailUser: CustomTextField!
    @IBOutlet weak var passwordUser: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector (newUser), name: NSNotification.Name(rawValue: "NewUser"), object: nil)
        
        profileImg.layer.cornerRadius = profileImg.frame.height/2
        
        updateProfileIMGBTN.layer.cornerRadius = 20
        updateProfileIMGBTN.layer.masksToBounds = true
       
    }
    
    @objc func newUser(notification: Notification){
        
        let user = notification.userInfo?["User"] as? User
        print("======================================================")
        print(user!)
        fullNameUser.text = user?.fullName
        addressUser.text = user?.address
        phoneNumberUser.text = user?.phoneNumber
        emailUser.text = user?.email
        passwordUser.text = user?.password
        profileImg.image = user?.image
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = mainStoryboard.instantiateViewController(withIdentifier: "MainNavigationVC") as! MainNavigationVC
        mainViewController.modalPresentationStyle = .fullScreen
        self.present(mainViewController, animated: true, completion: nil)
    }
    
    @IBAction func updateProfileIMGButton(_ sender: Any) {
        
        let imagePaker = UIImagePickerController()
        imagePaker.delegate = self
        imagePaker.allowsEditing = true
        present(imagePaker, animated: true, completion: nil)
        
    }
    
}

extension ProfileVC: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        dismiss(animated: true)
        profileImg.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
    }
    
}
