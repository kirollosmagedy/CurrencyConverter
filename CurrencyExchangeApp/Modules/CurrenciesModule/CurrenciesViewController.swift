//
//  ViewController.swift
//  CurrencyExchangeApp
//
//  Created by Kiro on 10/10/20.
//  Copyright © 2020 Kiro. All rights reserved.
//

import UIKit
import RxSwift
class CurrenciesViewController: UIViewController {

    @IBOutlet weak var flagLbl: UILabel!
    let disposeBag = DisposeBag()
    let viewModel = CurrenciesViewModel()
    override func viewDidLoad() {
         
        viewModel.getLatestCurrencies(base: "EUR").execute().subscribe(onNext: { (response) in
            print(response.rates)
         },onError: {
            error in
            print(error)
            }).disposed(by: disposeBag)
       
        
    }


}

