//
//  CurrencySelectorViewController.swift
//  CurrencyExchangeApp
//
//  Created by Kiro on 10/11/20.
//  Copyright © 2020 Kiro. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CurrencySelectorViewController: UIViewController {

    @IBOutlet weak var currenciesTableView: UITableView! {
        didSet {
            registerCell()
        }
    }
    var viewModel: CurrencySelectorViewModel!
    let disposeBag = DisposeBag()
 
    override func viewDidAppear(_ animated: Bool) {
        setupBinding()
    }
    
    private func registerCell() {
        let nib = UINib(nibName: "CurrencySelectorTableViewCell", bundle: .main)
        currenciesTableView.register(nib, forCellReuseIdentifier: "\(CurrencySelectorTableViewCell.self)")
    }
    private func setupBinding() {
        viewModel.rates.bind(to: currenciesTableView.rx.items(cellIdentifier: "\(CurrencySelectorTableViewCell.self)", cellType: CurrencySelectorTableViewCell.self)) { index , item , cell in
            var countryCode = item
            countryCode.removeLast()
            cell.flagLbl.text = countryCode.flag()
            cell.currencyCodeLbl.text = item
            cell.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self](_) in
                self?.viewModel.selectedCountryCode.onNext(cell.currencyCodeLbl.text ?? "")
               self?.viewModel.dismiss()
            }).disposed(by: cell.disposeBag)
        }.disposed(by: disposeBag)
        
        
    }
}
