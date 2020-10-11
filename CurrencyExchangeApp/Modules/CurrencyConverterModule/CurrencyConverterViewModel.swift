//
//  CurrencyConverterViewModel.swift
//  CurrencyExchangeApp
//
//  Created by Kiro on 10/11/20.
//  Copyright © 2020 Kiro. All rights reserved.
//

import Foundation


class CurrencyConverterViewModel {

    let currentCurrent : String
    let currency: String
    let value: Double
    let router: CurrencyConverterRouter
    
    init(currency: String, value: Double, currentCurrent:  String , router: CurrencyConverterRouter) {
        self.currency = currency
        self.value = value
        self.router = router
        self.currentCurrent = currentCurrent
    }
    
    func goBack() {
        router.go(to: .dismiss)
    }
}
