//
//  Order.swift
//  TradingEngine
//
//  Created by Danil Kokarev on 18.07.2018.
//  Copyright © 2018 Danil Kokarev. All rights reserved.
//

import Foundation

enum OrderSide: String {
    
    case sell = "SELL",
         buy  = "BUY"
    
}

struct Order {
    
    let identifier: String
    var amount: Double
    let price: Double
    let side: OrderSide
    let currencyPair: CurrencyPair
    
    // MARK: - Public Methods
    
    func matches(to order: Order) -> Bool {
        return currencyPair == order.currencyPair &&
               side != order.side &&
               (side == .buy && price >= order.price ||
                side == .sell && price <= order.price)
    }
    
}

extension Order: RawRepresentable {
    
    typealias RawValue = String
    
    var rawValue: RawValue {
        return "\(side.rawValue),\(price),\(amount),\(currencyPair.rawValue)"
    }
    
    // MARK: - Initialization
    
    init?(rawValue: RawValue) {
        let components = rawValue.components(separatedBy: ",")
        if components.count < 4 { return nil}
        
        guard let side = OrderSide(rawValue: components[0]),
              let price = Double(components[1]),
              let amount = Double(components[2]),
              let currencyPair = CurrencyPair(rawValue: components[3])
              else { return nil }
        
        self.identifier = UUID().uuidString
        self.currencyPair = currencyPair
        self.side = side
        self.price = price
        self.amount = amount
    }
    
}
