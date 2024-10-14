//
//  OrderConfirmationViewController.swift
//  Foody
//
//  Created by Khalid Gad on 06/09/2024.
//

import UIKit


class OrderConfirmationViewController: UIViewController {
    
    @IBOutlet weak var timeRemainingLabel: UILabel!
    var minutes: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        timeRemainingLabel.text = "Thank you for your order! your wait time is approximately \(minutes!) minutes."
    }



}
