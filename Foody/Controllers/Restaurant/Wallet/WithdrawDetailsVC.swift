//
//  WithdrawDetailsVC.swift
//  Me-True-Pay
//
//  Created by Khalid Gad on 22/04/2024.
//

import UIKit

class WithdrawDetailsVC: UIViewController {
    
    var cellWithdraw = 1
    
    
    
    @IBOutlet weak var logoPaymentIMG: UIImageView!
    @IBOutlet weak var nameWithdrawLabel: UILabel!
    @IBOutlet weak var detailsWithdrawTextField: CustomTextField!
    @IBOutlet weak var transactionDetails: UITextView!
    @IBOutlet weak var confirmBTN: UIButton!
    @IBOutlet weak var amountTransactionTextField: CustomTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirmBTN.layer.cornerRadius = 18
        confirmBTN.layer.masksToBounds = true
        
        switch cellWithdraw {
        case 0: do {
            logoPaymentIMG.image = UIImage.banktransferImg
            nameWithdrawLabel.text = "InstaPay Payment Address"
            detailsWithdrawTextField.placeholder = "InstaPayAddress@instapay"
            transactionDetails.text = "please, make sure to use your correct Payment Address by copied it and paste it here, Then set the amount you want to withdraw it."
        }
        case 1: do {
            logoPaymentIMG.image = UIImage.instapayImg
            nameWithdrawLabel.text = "InstaPay Payment Address"
            detailsWithdrawTextField.placeholder = "InstaPayAddress@instapay"
            transactionDetails.text = "please, make sure to use your correct Payment Address by copied it and paste it here, Then set the amount you want to withdraw it."
        }
        case 2: do {
            logoPaymentIMG.image = UIImage.vodafonecashImg
            nameWithdrawLabel.text = "Vodafone Cash Number"
            detailsWithdrawTextField.placeholder = "enter your number"
            transactionDetails.text = "please, make sure to use your correct Number by copied it and paste it here, Then set the amount you want to withdraw it."
            detailsWithdrawTextField.placeholder = "enter your number"
        }
        case 3: do {
            logoPaymentIMG.image = UIImage.fawryImg
            nameWithdrawLabel.text = "Vodafone Cash Number"
            detailsWithdrawTextField.placeholder = "enter your number"
            transactionDetails.text = "please, make sure to use your correct Number by copied it and paste it here, Then set the amount you want to withdraw it."
        }
        default:
            print("error")
        }
    }
    
    @IBAction func confirmButton(_ sender: Any) {
                
            let withdraw = recentActivityCell(operationName: "Withdraw",operationImage: UIImage.init(systemName: "minus"), operationDate: getCurrentShortDate(), operationMoney: amountTransactionTextField.text ?? "")
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "MoneyWithdrawed"), object: nil, userInfo: ["minusmoney":withdraw])
            
            let alert = UIAlertController(title: "Submitted", message: "Your Details is Sent Successfully", preferredStyle: UIAlertController.Style.alert)
            
            let closeAction = UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: {_ in self.dismiss(animated: true)
                
                self.detailsWithdrawTextField.text = ""
                self.amountTransactionTextField.text = ""
            })
            
            alert.addAction(closeAction)
            
            self.present(alert, animated: true, completion: nil)
            
    }
    func getCurrentShortDate() -> String {
        var todaysDate = NSDate()
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        var DateInFormat = dateFormatter.string(from: todaysDate as Date)
        
        return DateInFormat
    }
}


