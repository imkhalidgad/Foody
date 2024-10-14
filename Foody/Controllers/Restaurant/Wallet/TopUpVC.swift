//
//  TopUpVC.swift
//  Me-True-Pay
//
//  Created by Khalid Gad on 19/04/2024.
//

import UIKit

class TopUpVC: UIViewController {
    
    var paymentCellArray = [
        PaymentCell (name: "Bank Transfer", image: UIImage(named:"banktransferImg"), arrowimg: UIImage.init(systemName: "arrowshape.right"), fees:"No Fees", index: 0),
        PaymentCell (name: "InstaPay", image: UIImage(named:"instapayImg"), arrowimg: UIImage.init(systemName: "arrowshape.right"), fees:"No Fees", index: 1),
        PaymentCell (name: "Vodafone Cash", image: UIImage(named:"vodafonecashImg"), arrowimg: UIImage.init(systemName: "arrowshape.right"), fees:"Fees Apply", index: 2),
        PaymentCell (name: "Fawry", image: UIImage(named:"fawryImg"), arrowimg: UIImage.init(systemName: "arrowshape.right"), fees:"Fees Apply", index: 3)
    ]
    
    
    @IBOutlet weak var topupTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topupTableView.dataSource = self
        topupTableView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
}


    extension TopUpVC: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            115
        }
        
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            tableView.deselectRow(at: indexPath, animated: true)
           
            let currentCell = paymentCellArray[indexPath.row]
            
            let vc = storyboard?.instantiateViewController(identifier: "DepositDetails") as? DepositDetailVC
       
            vc?.cellDeposit = currentCell.index
            
           
            self.present(vc!, animated: true)
            
            // self.show(vc!, sender: nil)
            
//            vc?.navigationItem.title = "Deposit Request (\(currentCell.name))"
//            vc?.navigationItem.largeTitleDisplayMode = .never
            
        }
        
    }
        

    extension TopUpVC: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return paymentCellArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "paymentCell") as! PaymentTableViewCell
            
            let currentPaymentCell = paymentCellArray[indexPath.row]
            
            cell.namePaymentCell.text = currentPaymentCell.name
            cell.feesPaymentCell.text = currentPaymentCell.fees
            
            cell.imgPaymentCell.image = currentPaymentCell.image
            
            cell.imgPaymentCell.layer.cornerRadius = cell.imgPaymentCell.frame.height/2
            cell.imgPaymentCell.layer.masksToBounds = true
            
            cell.arrowPaymentCell.image = currentPaymentCell.arrowimg
            
            return cell
        }
    }
