//
//  DataProvider.swift
//  TradingEngine
//
//  Created by Danil Kokarev on 18.07.2018.
//  Copyright © 2018 Danil Kokarev. All rights reserved.
//

import Foundation

class DataProvider {
    
    class func orders(fromContentOfCSVFile filename:String) -> [Order]? {
        guard let filepath = Bundle.main.path(forResource: filename, ofType: "csv"),
              let content = try? String(contentsOfFile: filepath, encoding: .utf8) else { return nil }
        
        let rows = content.components(separatedBy: .newlines)
        return rows.compactMap { Order(rawValue: $0) }
    }
    
}
