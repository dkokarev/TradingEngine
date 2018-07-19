//
//  CurrencyPair.swift
//  TradingEngine
//
//  Created by Danil Kokarev on 19.07.2018.
//  Copyright © 2018 Danil Kokarev. All rights reserved.
//

import Foundation

enum Currency: String {
    
    case usd = "USD",
         eur = "EUR"
    
}

struct CurrencyPair {
    
    let base: Currency
    let quoted: Currency
    
}

extension CurrencyPair: Equatable {
    
    static func == (lhs: CurrencyPair, rhs: CurrencyPair) -> Bool {
        return lhs.base == rhs.base &&
               lhs.quoted == rhs.quoted
    }
    
}

extension CurrencyPair: RawRepresentable {
    
    typealias RawValue = String
    
    var rawValue: RawValue {
        return "\(base.rawValue)/\(quoted.rawValue)"
    }
    
    // MARK: - Initialization
    
    init?(rawValue: RawValue) {
        let components = rawValue.components(separatedBy: "/")
        if components.count < 2 { return nil }
        
        guard let base = Currency(rawValue: components[0]),
              let quoted = Currency(rawValue: components[1])
              else { return nil }
        
        self.base = base
        self.quoted = quoted
    }
    
}

