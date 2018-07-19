//
//  TradingEngineTests.swift
//  TradingEngineTests
//
//  Created by Danil Kokarev on 18.07.2018.
//  Copyright © 2018 Danil Kokarev. All rights reserved.
//

import XCTest
@testable import TradingEngine

class TradingEngineTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTradingEnginePlacedOrders() {
        let trandingEngine = TradingEngine()
        
        let orders = [Order(rawValue: "BUY,560.50,50,USD/EUR")!,
                      Order(rawValue: "BUY,560.55,50,USD/EUR")!,
                      Order(rawValue: "BUY,560.60,40,USD/EUR")!,
                      Order(rawValue: "SELL,580.60,100,USD/EUR")!]
        
        trandingEngine.place(orders: orders)
        
        XCTAssertEqual(trandingEngine.orders.count, 4, "Wrong number of placed orders")
    }
    
    func testOrdersMatch() {
        let order1 = Order(rawValue: "BUY,560.50,50,USD/EUR")!
        let order2 = Order(rawValue: "SELL,550.60,120,USD/EUR")!
        
        XCTAssertTrue(order1.matches(to: order2), "Orders not matched")
    }
    
}
