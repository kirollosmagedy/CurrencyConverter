//
//  Dict+Extension.swift
//  CurrencyExchangeApp
//
//  Created by Kiro on 10/10/20.
//  Copyright © 2020 Kiro. All rights reserved.
//

import Foundation

extension Dictionary {
    mutating func merge(dict: [Key: Value]){
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
}
