//
//  CurrencySelectorContract.swift
//  CurrencyExchangeApp
//
//  Created by Kiro on 10/11/20.
//  Copyright © 2020 Kiro. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

protocol CurrencySelectorRouterProtcol: class {
    func go(to destination : Destination)
}

protocol CurrencySelectorViewModelProtcol: class {
    var rates: BehaviorSubject<[String]> { get }
    var selectedCountryCode: BehaviorSubject<String> { get }
   func dismiss()
}

protocol CurrencySelectorViewControllerProtcol: UIViewController {
}
