//
//  ProductDetailsCard.swift
//  MishiPay-Task
//
//  Created by Rajaram Mohanty on 15/08/20.
//  Copyright © 2020 Rajaram Mohanty. All rights reserved.
//

import UIKit

class ProductDetailsCard: UIView {

    @IBOutlet var contenerView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    @IBOutlet weak var productImageView: UIImageView!{
        didSet{
            productImageView.image = nil
            productImageView.backgroundColor = .lightGray
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commitInit()
    }
    
    private func commitInit(){
        Bundle.main.loadNibNamed("ProductDetailsCard", owner: self, options: nil)
        addSubview(contenerView)
        contenerView.frame = self.bounds
        //contenerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.contenerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.contenerView.topAnchor.constraint(equalTo: self.topAnchor),
            self.contenerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.contenerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.contenerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }

    var titleStr:String = ""{
       didSet{
           titleLbl.text = titleStr
       }
    }
    
    var priceStr:String = ""{
       didSet{
           priceLbl.text = priceStr
       }
    }
    
    func setupCell(withData:Product) {
    
        if let title = withData.title {
            self.titleStr = title
        }
        
        if let price = withData.price {
            self.priceStr = price
        }
        
        if let imageStr = withData.image {
            productImageView.image = UIImage(named: imageStr)
        }
    }
}
