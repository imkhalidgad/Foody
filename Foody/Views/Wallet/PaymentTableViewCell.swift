//
//  PaymentTableViewCell.swift
//  Me-True-Pay
//
//  Created by Khalid Gad on 19/04/2024.
//

import UIKit

class PaymentTableViewCell: UITableViewCell {

   
    @IBOutlet weak var imgPaymentCell: UIImageView!
    @IBOutlet weak var namePaymentCell: UILabel!
    @IBOutlet weak var feesPaymentCell: UILabel!
    @IBOutlet weak var arrowPaymentCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
