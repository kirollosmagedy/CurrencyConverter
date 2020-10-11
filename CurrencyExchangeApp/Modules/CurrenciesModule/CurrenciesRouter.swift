//
//  CurrenciesRouter.swift
//  CurrencyExchangeApp
//
//  Created by Kiro on 10/11/20.
//  Copyright © 2020 Kiro. All rights reserved.
//

import Foundation



class CurrenciesRouter {
    weak var viewController: CurrenciesViewController?
   
    init(viewController: CurrenciesViewController) {
        self.viewController = viewController
    }
    
    func go(to destination : Destination) {
        switch destination {
        case .currencySelector(let rates , let currencySubject):
            let vc = CurrencySelectorRouter.assemble(rates: rates, selectedCountryCode: currencySubject)
            self.viewController?.present(vc, animated: false)
        default:
            break
        }
    }
}