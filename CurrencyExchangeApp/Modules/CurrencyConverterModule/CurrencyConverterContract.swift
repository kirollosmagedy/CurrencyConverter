//
//  CurrencyConverterContract.swift
//  CurrencyExchangeApp
//
//  Created by Kiro on 10/11/20.
//  Copyright © 2020 Kiro. All rights reserved.
//

import Foundation
import UIKit

protocol CurrencyConverterRouterProtocol: class {
    func go(to destination : Destination)
}

protocol CurrencyConverterViewModelProtocol: class {
    var currentCurrent : String { get }
    var currency: String { get }
    var value: Double { get }
    func goBack()
}

protocol CurrencyConverterViewControllerProtocol: UIViewController {
    
}
