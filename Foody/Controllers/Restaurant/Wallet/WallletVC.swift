//
//  WallletVC.swift
//  Me-True-Pay
//
//  Created by Khalid Gad on 19/04/2024.
//

import UIKit

class WallletVC: UIViewController {
    
    var hiddenFlag:Bool = true
    
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var topupBTN: UIButton!
    @IBOutlet weak var withdrawBTN: UIButton!
    @IBOutlet weak var hideBTN: UIButton!
    @IBOutlet weak var hideLabel: UILabel!
    @IBOutlet weak var clearBTN: UIButton!
    @IBOutlet weak var walletTableView: UITableView!
    
    var activityCellArray = [
        recentActivityCell(operationName: "Deposit", operationImage: UIImage.init(systemName: "plus"), operationDate: "16/8/2023", operationMoney: "515"),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityCellArray.remove(at: 0)
        
        self.tabBarController?.selectedIndex = 1
        
        clearBTN.layer.cornerRadius = clearBTN.frame.width/2
        clearBTN.layer.masksToBounds = true
        
        topupBTN.layer.cornerRadius = topupBTN.frame.width/2
        topupBTN.layer.masksToBounds = true
        
        withdrawBTN.layer.cornerRadius = withdrawBTN.frame.width/2
        withdrawBTN.layer.masksToBounds = true
        
        hideBTN.layer.cornerRadius = hideBTN.frame.width/2
        hideBTN.layer.masksToBounds = true
        
        walletTableView.dataSource = self
        walletTableView.delegate = self
        
        
        // notification for Deposit money
        NotificationCenter.default.addObserver(self, selector: #selector (addDeposit), name: NSNotification.Name(rawValue: "MoneyDeposited"), object: nil)
        
        // notification for Withdraw money
        NotificationCenter.default.addObserver(self, selector: #selector (addWithdraw), name: NSNotification.Name(rawValue: "MoneyWithdrawed"), object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    
    // function for Deposit money
    @objc func addDeposit(notification: Notification){
        
        var deposit = notification.userInfo?["addmoney"] as? recentActivityCell
        
        if let myDeposit = deposit {
            
            var result = (Float(String(moneyLabel.text ?? "")) ?? 0) + (Float(String(myDeposit.operationMoney)) ?? 0)
            moneyLabel.text = String(result)
            
            activityCellArray.append(myDeposit)
            walletTableView.reloadData()
            // storeDeposit(deposit: myDeposit)
        }
    }
    
    
    // function for Withdraw money
    @objc func addWithdraw(notification: Notification){
        
        var withdraw = notification.userInfo?["minusmoney"] as? recentActivityCell
        
        if let myWithdraw = withdraw {
            var result = (Float(String(moneyLabel.text ?? "")) ?? 0) - (Float(String(myWithdraw.operationMoney)) ?? 0)
            moneyLabel.text = String(result)
            
            activityCellArray.append(myWithdraw)
            walletTableView.reloadData()
            // storeDeposit(deposit: myDeposit)
        }
    }
    
    
    @IBAction func hideButton(_ sender: Any) {
        
        //        let moneyLabelblur = BlurredLabel()
        //        moneyLabelblur.text = moneyLabel.text
        //        moneyLabelblur.frame = moneyLabel.bounds
        
        let blur = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blur)
        
        blurView.frame = moneyLabel.bounds
        
        blurView.layer.cornerRadius = 20
        blurView.layer.masksToBounds = true
        
        
        if hiddenFlag == true {
            
            moneyLabel.addSubview(blurView)
            // blurView = UIVisualEffectView(effect: blur)
            // moneyLabel.addSubview(blurView)
            
            //            moneyLabelblur.blur()
            //            moneyLabel.addSubview(moneyLabelblur)
            
            hideLabel.text = "Show"
            hideBTN.setImage(UIImage.init(systemName: "eye"), for: .normal)
            
            hiddenFlag = false
        } else {
            
            for view in self.moneyLabel.subviews {
                view.removeFromSuperview()
            }
            
            //            moneyLabelblur.unblur()
            //            moneyLabel.willRemoveSubview(moneyLabelblur)
            
            hideLabel.text = "Hide"
            hideBTN.setImage(UIImage.init(systemName: "eye.slash.fill"), for: .normal)
            
            hiddenFlag = true
        }
        
    }
    
    @IBAction func clearButton(_ sender: Any) {
        
        activityCellArray.removeAll()
        walletTableView.reloadData()
    }
}

extension WallletVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return activityCellArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "operationCell") as! OperationTableViewCell
        
        let currentOperationCell = activityCellArray[indexPath.row]
        
        cell.nameLabelOperationCell.text = currentOperationCell.operationName
        
        cell.DateLabelOperationCell.text = currentOperationCell.operationDate
        
        cell.moneyLabelOperationCell.text = currentOperationCell.operationMoney
        
        cell.imgOperationCell.image = currentOperationCell.operationImage
        
        cell.imgOperationCell.layer.cornerRadius = cell.imgOperationCell.frame.height/2
        cell.imgOperationCell.layer.masksToBounds = true
        
        return cell
    }
}

extension WallletVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
}

