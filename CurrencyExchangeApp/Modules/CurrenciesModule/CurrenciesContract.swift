//
//  CurrenciesContract.swift
//  CurrencyExchangeApp
//
//  Created by Kiro on 10/11/20.
//  Copyright © 2020 Kiro. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

protocol CurrenciesViewControllerProtocol: UIViewController {
    
}


protocol CurrenciesViewModelProtocol: class {
    func getLatestCurrencies(base: String)
    func goToCurrencySelector()
    func goToCurrenctCalcuator(currency: String, value: Double)
    var rates: BehaviorSubject<[String: Double]> { get }
    var errorSubject: PublishSubject<Error> { get }
    var currencyCode: BehaviorSubject<String> { get }
    var router: CurrenciesRouterProtocol! { get set }

}


protocol CurrenciesRouterProtocol: class {
    func go(to destination : Destination)
}

