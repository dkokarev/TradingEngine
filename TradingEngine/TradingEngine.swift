//
//  TradingEngine.swift
//  TradingEngine
//
//  Created by Danil Kokarev on 18.07.2018.
//  Copyright © 2018 Danil Kokarev. All rights reserved.
//

import Foundation

class TradingEngine {
    
    private(set) var orders = [Order]()
    
    // MARK: - Public Methods
    
    func place(orders: [Order]) {
        for var order in orders {
            place(order: &order)
        }
    }
    
    func place(order: inout Order) {
        let initialNumberOfOrders = orders.count
        
        for (index, var placedOrder) in orders.enumerated() {
            if !order.matches(to: placedOrder) {
                continue
            }
            
            let actualIndex = index - (initialNumberOfOrders - orders.count)
            
            if order.amount > placedOrder.amount {
                order.amount -= placedOrder.amount
                
                removeOrder(atIndex: actualIndex)
            } else {
                placedOrder.amount -= order.amount
                order.amount = 0
                
                if placedOrder.amount > 0 {
                    orders[actualIndex] = placedOrder
                } else {
                    removeOrder(atIndex: actualIndex)
                }
                
                break
            }
        }
        
        if order.amount > 0 {
            addOrder(order)
        } else {
            print("OrderClosed")
        }
    }
    
    // MARK: - Private Methods
    
    private func addOrder(_ order: Order) {
        orders.append(order)
        print("OrderPlaced")
    }
    
    private func removeOrder(atIndex index: Int) {
        orders.remove(at: index)
        print("OrderClosed")
    }
    
}
