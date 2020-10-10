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

class CurrenciesViewModel {
    func getLatestCurrencies(base: String) -> Action<Void, CurrenciesBaseResponse>  {
        return Action { () -> Observable<CurrenciesBaseResponse> in
            return BaseApiClient.executeRequest(api: .latest(base: base))
        }
    }
}


