//
//  LaunchVC.swift
//  Foody
//
//  Created by Khalid Gad on 06/09/2024.
//

import UIKit

class LaunchVC: UIViewController {
    @IBOutlet weak var LAunchScreenLabel: UILabel!
    @IBOutlet weak var speedoImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateLogo()

        // Do any additional setup after loading the view.
    }
    

    func animateLogo() {
        // Start with the label at its original size and fully opaque
        LAunchScreenLabel.transform = CGAffineTransform.identity
        LAunchScreenLabel.alpha = 1.0
        
        speedoImg.transform = CGAffineTransform.identity
        speedoImg.alpha = 1.0
        // Animate the label to zoom in significantly and become transparent
        UIView.animate(withDuration: 1.5, delay: 0.5, options: [.curveEaseInOut], animations: {
            self.LAunchScreenLabel.transform = CGAffineTransform(scaleX: 5.0, y: 5.0)
            self.LAunchScreenLabel.alpha = 0.0
            
            self.speedoImg.transform = CGAffineTransform(scaleX: 5.0, y: 5.0)
            self.speedoImg.alpha = 0.0
        }, completion: { _ in

            self.transitionToMainView()
        })
    }
    
    func transitionToMainView() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = mainStoryboard.instantiateViewController(withIdentifier: "MainNavigationVC") as! MainNavigationVC
        mainViewController.modalPresentationStyle = .fullScreen
        self.present(mainViewController, animated: true, completion: nil)
    }

}
