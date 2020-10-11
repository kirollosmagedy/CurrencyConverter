//
//  BaseModel.swift
//  CurrencyExchangeApp
//
//  Created by Kiro on 10/10/20.
//  Copyright © 2020 Kiro. All rights reserved.
//

import Foundation

protocol BaseModel: Codable {
    var success: Bool? { get set }
    var timeStamp: Int? { get set }
}
