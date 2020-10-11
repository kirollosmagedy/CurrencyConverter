//
//  CurrenciesViewModel.swift
//  CurrencyExchangeApp
//
//  Created by Kiro on 10/10/20.
//  Copyright © 2020 Kiro. All rights reserved.
//

import Foundation
import RxSwift
import Action

class CurrenciesViewModel: CurrenciesViewModelProtocol {
    
    var rates = BehaviorSubject<[String: Double]>(value: [:])
    var errorSubject = PublishSubject<Error>()
    var currencyCode = BehaviorSubject<String>(value: "EUR")
    let disposeBag = DisposeBag()
    var router: CurrenciesRouterProtocol!
    func getLatestCurrencies(base: String) {
        let observable: Observable<CurrenciesBaseResponse> = BaseApiClient.executeRequest(api: .latest(base: base))
        observable.subscribe(onNext: { [weak self] (response) in
            self?.rates.onNext(response.rates ?? [:])
            }, onError: { [weak self] (error) in
                self?.errorSubject.onNext(error)
        }).disposed(by: disposeBag)
    }
    
    func goToCurrencySelector() {
        let keys = try? rates.value().map { (dic) in
            dic.key
        }
        router.go(to: .currencySelector(rates: keys ?? [], currencyBehaviorSubject: currencyCode))
    }
    func goToCurrenctCalcuator(currency: String, value: Double) {
        guard let val = try? self.currencyCode.value() else { return }
        router.go(to: .calculator(selectedCurrency: currency, factor: value, currentCurrent:val))
    }
}


