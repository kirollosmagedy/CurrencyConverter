//
//  CurrenciesRouter.swift
//  CurrencyExchangeApp
//
//  Created by Kiro on 10/11/20.
//  Copyright © 2020 Kiro. All rights reserved.
//

import Foundation



class CurrenciesRouter: CurrenciesRouterProtocol {
    weak var viewController: CurrenciesViewControllerProtocol?
   
    init(viewController: CurrenciesViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func go(to destination : Destination) {
        switch destination {
        case .currencySelector(let rates , let currencySubject):
            let vc = CurrencySelectorRouter.assemble(rates: rates, selectedCountryCode: currencySubject)
            self.viewController?.present(vc, animated: false)
        case .calculator( let selectedCurrency,let factor,let currentCurrent):
            let vc = CurrencyConverterRouter.assemble(selectedCurrency: selectedCurrency, factor: factor, currentCurrent: currentCurrent)
            self.viewController?.present(vc, animated: false)
        case .dismiss:
            break
        }
    }
}
