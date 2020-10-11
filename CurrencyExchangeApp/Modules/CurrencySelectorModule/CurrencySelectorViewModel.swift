//
//  CurrencySelectorViewModel.swift
//  CurrencyExchangeApp
//
//  Created by Kiro on 10/11/20.
//  Copyright © 2020 Kiro. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CurrencySelectorViewModel {
    var rates = BehaviorSubject<[String]>(value: [])
    var selectedCountryCode: BehaviorSubject<String>
    let router: CurrencySelectorRouter
    init(selectedCountryCode: BehaviorSubject<String>, router: CurrencySelectorRouter) {
        self.selectedCountryCode = selectedCountryCode
        self.router = router
    }
    
    func dismiss() {
        router.go(to: .dismiss)
    }
}
