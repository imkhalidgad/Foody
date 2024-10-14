//
//  OperationTableViewCell.swift
//  Me-True-Pay
//
//  Created by Khalid Gad on 19/04/2024.
//

import UIKit

class OperationTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imgOperationCell: UIImageView!
    @IBOutlet weak var nameLabelOperationCell: UILabel!
    @IBOutlet weak var DateLabelOperationCell: UILabel!
    @IBOutlet weak var moneyLabelOperationCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
