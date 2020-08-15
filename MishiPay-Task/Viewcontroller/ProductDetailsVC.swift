//
//  ProductDetailsVC.swift
//  MishiPay-Task
//
//  Created by Rajaram Mohanty on 15/08/20.
//  Copyright © 2020 Rajaram Mohanty. All rights reserved.
//

import UIKit

class ProductDetailsVC: UIViewController {

    @IBOutlet weak var productListTableView: UITableView!

    var scData = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension ProductDetailsVC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailsCell", for: indexPath) as! ProductDetailsCell

        cell.product = scData[indexPath.row]
        
        return cell
    }
    
}
