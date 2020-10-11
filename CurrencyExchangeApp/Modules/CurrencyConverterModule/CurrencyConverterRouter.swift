//
//  CurrencyConverterRouter.swift
//  CurrencyExchangeApp
//
//  Created by Kiro on 10/11/20.
//  Copyright © 2020 Kiro. All rights reserved.
//

import Foundation
import UIKit

class CurrencyConverterRouter {
    
    weak var viewController: CurrencyConverterViewController!
    
    static func assemble(selectedCurrency: String, factor: Double, currentCurrent : String) -> UIViewController {
        let router = CurrencyConverterRouter()
        router.viewController = UIStoryboard(name: "\(CurrencyConverterViewController.self)", bundle: .main).instantiateViewController(identifier: "\(CurrencyConverterViewController.self)") as? CurrencyConverterViewController
        let viewModel = CurrencyConverterViewModel(currency: selectedCurrency , value: factor, currentCurrent: currentCurrent, router: router)
        router.viewController.viewModel = viewModel
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
