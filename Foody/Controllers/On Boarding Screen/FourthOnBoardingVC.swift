//
//  FourthOnBoardingVC.swift
//  Foody
//
//  Created by Khalid Gad on 06/09/2024.
//

import UIKit

class FourthOnBoardingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
    }
    
    @IBAction func nextBtnTapped(_ sender: Any) {
        let SignIn = self.storyboard?.instantiateViewController(withIdentifier: "SignInVC") as! SignInViewController
        self.navigationController?.pushViewController(SignIn, animated: true)
    }

}
