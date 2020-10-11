//
//  BaseRouter.swift
//  CurrencyExchangeApp
//
//  Created by Kiro on 10/11/20.
//  Copyright © 2020 Kiro. All rights reserved.
//

import Foundation
import RxSwift

enum Destination {
    case currencySelector(rates: [String], currencyBehaviorSubject: BehaviorSubject<String> )
    case calculator (selectedCurrency: String, factor: Double, currentCurrent: String)
    case dismiss
}
