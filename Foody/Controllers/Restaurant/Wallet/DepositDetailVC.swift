//
//  DepositDetailVC.swift
//  Me-True-Pay
//
//  Created by Khalid Gad on 20/04/2024.
//

import UIKit


class DepositDetailVC: UIViewController {
    
    var cellDeposit = 1
    
    @IBOutlet weak var logoPaymentIMG: UIImageView!
    @IBOutlet weak var nameDepositLabel: UILabel!
    @IBOutlet weak var detailsdepositTextField: CustomTextField!
    @IBOutlet weak var transactionDetails: UITextView!
    @IBOutlet weak var confirmBTN: UIButton!
    @IBOutlet weak var receiptIMG: UIImageView!
    @IBOutlet weak var dateTransactionTextField: CustomTextField!
    @IBOutlet weak var amountTransactionTextField: CustomTextField!
    @IBOutlet weak var addressUserTransactionTextField: CustomTextField!
    @IBOutlet weak var addressUserTransactionLabel: CustomTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirmBTN.layer.cornerRadius = 18
        confirmBTN.layer.masksToBounds = true
        
        switch cellDeposit {
        case 0: do {
            logoPaymentIMG.image = UIImage.banktransferImg
            nameDepositLabel.text = "InstaPay Payment Address"
            detailsdepositTextField.text = "foody@instapay"
            transactionDetails.text = "please, make sure to use these Payment Address by copied it and go to the InstaPay to make your transaction, Then must be Confirm Deposit By:"
            addressUserTransactionLabel.text = "InstaPay Address:"
            addressUserTransactionTextField.placeholder = "enter your InstaPay Address"
        }
        case 1: do {
            logoPaymentIMG.image = UIImage.instapayImg
            nameDepositLabel.text = "InstaPay Payment Address"
            detailsdepositTextField.text = "foody@instapay"
            transactionDetails.text = "please, make sure to use these Payment Address by copied it and go to the InstaPay to make your transaction, Then must be Confirm Deposit By:"
            addressUserTransactionLabel.text = "InstaPay Address:"
            addressUserTransactionTextField.placeholder = "enter your InstaPay Address"
        }
        case 2: do {
            logoPaymentIMG.image = UIImage.vodafonecashImg
            nameDepositLabel.text = "Vodafone Cash Number"
            detailsdepositTextField.text = "0109 114 9971"
            transactionDetails.text = "please, make sure to use these number by copied it and go to the Vodafone Cash to make your transaction, Then must be Confirm Deposit By:"
            addressUserTransactionLabel.text = "Vodafone Cash Number:"
            addressUserTransactionTextField.placeholder = "enter your Vodafone Cash Number"
        }
        case 3: do {
            logoPaymentIMG.image = UIImage.fawryImg
            nameDepositLabel.text = "Vodafone Cash Number"
            detailsdepositTextField.text = "0109 114 9971"
            transactionDetails.text = "please, make sure to use these number by copied it and go to the Vodafone Cash to make your transaction, Then must be Confirm Deposit By:"
            addressUserTransactionLabel.text = "Vodafone Cash Number:"
            addressUserTransactionTextField.placeholder = "enter your Vodafone Cash Number"
        }
        default:
            print("error")
        }
        
    }
    
    @IBAction func confirmButton(_ sender: Any) {
        
        let deposit = recentActivityCell(operationName: "Deposit",operationImage: UIImage.init(systemName: "plus"), operationDate: getCurrentShortDate(), operationMoney: amountTransactionTextField.text ?? "")
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "MoneyDeposited"), object: nil, userInfo: ["addmoney":deposit])
        
        let alert = UIAlertController(title: "Confirmed", message: "Your Details is Sent Successfully", preferredStyle: UIAlertController.Style.alert)
        
        let closeAction = UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: {_ in self.dismiss(animated: true)
            
            self.dateTransactionTextField.text = ""
            self.amountTransactionTextField.text = ""
            self.addressUserTransactionTextField.text = ""
            self.receiptIMG.image = UIImage.noImg
        })
        
        alert.addAction(closeAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func addReceiptImg(_ sender: Any) {
        
        let imagePaker = UIImagePickerController()
        imagePaker.delegate = self
        imagePaker.allowsEditing = true
        present(imagePaker, animated: true, completion: nil)
        
    }
    
}


extension DepositDetailVC: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        dismiss(animated: true)
        receiptIMG.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
    }
    
    func getCurrentShortDate() -> String {
        var todaysDate = NSDate()
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        var DateInFormat = dateFormatter.string(from: todaysDate as Date)
        
        return DateInFormat
    }
    
}

