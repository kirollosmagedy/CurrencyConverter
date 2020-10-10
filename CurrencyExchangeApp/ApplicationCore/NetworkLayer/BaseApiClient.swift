//
//  BaseApiClient.swift
//  CurrencyExchangeApp
//
//  Created by Kiro on 10/10/20.
//  Copyright © 2020 Kiro. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class BaseApiClient {
    
    static func executeRequest<T: Codable>(api: FixerApi) -> Observable<T> {
        let provider = MoyaProvider<FixerApi>()
        return provider.rx.request(api).asObservable().map(T.self)
    }
}
