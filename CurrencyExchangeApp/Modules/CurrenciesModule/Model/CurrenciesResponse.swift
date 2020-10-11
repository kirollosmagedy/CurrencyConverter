//
//  CurrenciesResponse.swift
//  CurrencyExchangeApp
//
//  Created by Kiro on 10/10/20.
//  Copyright © 2020 Kiro. All rights reserved.
//

import Foundation


class CurrenciesBaseResponse: BaseModel {
    var success: Bool?
    var timeStamp: Int?
    var rates: [String: Double]?
}
