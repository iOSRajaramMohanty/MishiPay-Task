//
//  ScannerVC.swift
//  MishiPay-Task
//
//  Created by Rajaram Mohanty on 15/08/20.
//  Copyright © 2020 Rajaram Mohanty. All rights reserved.
//

import UIKit

class ScannerVC: UIViewController {
    
    @IBOutlet weak var scannerView: ScannerView! {
        didSet {
            scannerView.delegate = self
        }
    }
    @IBOutlet weak var scanButton: UIButton! {
        didSet {
            scanButton.setTitle("STOP", for: .normal)
        }
    }
    
    var scData = [Product]() {
        didSet {
            if scData.count != 0 {
                self.performSegue(withIdentifier: "detailSeuge", sender: self)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if !scannerView.isRunning {
            scannerView.startScanning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if !scannerView.isRunning {
            scannerView.stopScanning()
        }
    }

    @IBAction func scanButtonAction(_ sender: UIButton) {
        scannerView.isRunning ? scannerView.stopScanning() : scannerView.startScanning()
        let buttonTitle = scannerView.isRunning ? "STOP" : "SCAN"
        sender.setTitle(buttonTitle, for: .normal)
    }
}


extension ScannerVC: ScannerViewDelegate {
    func scanningDidStop() {
        let buttonTitle = scannerView.isRunning ? "STOP" : "SCAN"
        scanButton.setTitle(buttonTitle, for: .normal)
    }
    
    func scanningDidFail() {
        presentAlert(withTitle: "Error", message: "Scanning Failed. Please try again")
    }
    
    func scanningSucceededWithCode(_ str: String?) {
        self.scData.append(Product(title: "Demo Product", price: "$205", image: "tshirt"))
    }
        
}


extension ScannerVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSeuge", let viewController = segue.destination as? ProductDetailsVC {
            viewController.scData = self.scData
        }
    }
}
