//
//  ViewController.swift
//  TradingEngine
//
//  Created by Danil Kokarev on 18.07.2018.
//  Copyright © 2018 Danil Kokarev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let orders = DataProvider.orders(fromContentOfCSVFile: "Orders") else { return }
        
        TradingEngine().place(orders: orders)
    }

}

