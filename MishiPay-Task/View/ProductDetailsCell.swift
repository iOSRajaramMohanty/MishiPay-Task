//
//  ProductDetailsCell.swift
//  MishiPay-Task
//
//  Created by Rajaram Mohanty on 15/08/20.
//  Copyright © 2020 Rajaram Mohanty. All rights reserved.
//

import UIKit

class ProductDetailsCell: UITableViewCell {

    @IBOutlet weak var productDetailsCard: ProductDetailsCard!
    
    var product: Product?{
        didSet{
            if let product = product {
                productDetailsCard.setupCell(withData: product)
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
