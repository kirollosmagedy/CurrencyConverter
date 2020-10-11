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
    
    static func executeRequest<T: BaseModel>(api: FixerApi) -> Observable<T> {
        return Observable<T>.create { (observer) -> Disposable in
            let provider = MoyaProvider<FixerApi>()
            provider.rx.request(api).asObservable().map(T.self).subscribe(onNext: { (response) in
                if response.success ?? false {
                    observer.onNext(response)
                } else {
                    observer.onError(FixerError.generalError)
                }
            }, onError: {
                error in
                observer.onError(error)
            })
            
           return  Disposables.create()
        }
       
    }
}

