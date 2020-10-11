//
//  CurrencyAssembler.swift
//  CurrencyExchangeApp
//
//  Created by Kiro on 10/11/20.
//  Copyright © 2020 Kiro. All rights reserved.
//

import Foundation
import RxSwift

class CurrencySelectorRouter: CurrencySelectorRouterProtcol {
    weak var viewController: CurrencySelectorViewController!
    
    static func assemble(rates: [String], selectedCountryCode: BehaviorSubject<String>) -> UIViewController {
        let router = CurrencySelectorRouter()
        router.viewController = UIStoryboard(name: "\(CurrencySelectorViewController.self)", bundle: .main).instantiateViewController(identifier: "\(CurrencySelectorViewController.self)") as? CurrencySelectorViewController
        let viewModel = CurrencySelectorViewModel(selectedCountryCode: selectedCountryCode, router: router)
        router.viewController.viewModel = viewModel
        viewModel.rates.onNext(rates)
        return  router.viewController
    }
    
    func go(to destination : Destination) {
        switch destination {
        case .dismiss:
            viewController.dismiss(animated: true)
        default:
            break
        }
    }
}
