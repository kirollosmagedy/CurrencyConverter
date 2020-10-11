//
//  ViewController.swift
//  CurrencyExchangeApp
//
//  Created by Kiro on 10/10/20.
//  Copyright © 2020 Kiro. All rights reserved.
//

import UIKit
import RxSwift
import RxGesture

class CurrenciesViewController: UIViewController {

    @IBOutlet weak var flagLbl: UILabel!
    @IBOutlet weak var CurrencyTitleLbl: UILabel!
    @IBOutlet weak var selectedCurrencyView: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var currencyTableView: UITableView! {
        didSet {
            registerCell()
        }
    }
    let disposeBag = DisposeBag()
    var viewModel = CurrenciesViewModel()
    
    private var numbFormatter: NumberFormatter {
        let numbFormatter = NumberFormatter()
        numbFormatter.numberStyle = .currency
        numbFormatter.maximumFractionDigits = 3
        numbFormatter.currencyCode = try? viewModel.currencyCode.value()
        return numbFormatter
    }
    
    override func viewDidLoad() {
        setupContent()
        viewModel.getLatestCurrencies(base: "EUR")
        viewModel.router = CurrenciesRouter(viewController: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        startLoading()
        setupBinding()
    }
    private func registerCell() {
        let nib = UINib(nibName: "CurrencyCell", bundle: .main)
        currencyTableView.register(nib, forCellReuseIdentifier: "\(CurrencyCell.self)")
    }
    private func setupContent() {
        flagLbl.text = "EU".flag()
        CurrencyTitleLbl.text = "EUR"
    }
    
    
    private func setupBinding() {
        viewModel.rates.skip(1).do(onNext: { [weak self] _ in
            self?.stopLoading()
            if let selectedCountryCode = try? self?.viewModel.currencyCode.value() , !selectedCountryCode.isEmpty {
                var countryCode = selectedCountryCode
                countryCode.removeLast()
                self?.flagLbl.text = countryCode.flag()
                self?.CurrencyTitleLbl.text = selectedCountryCode
            }
            
        }).bind(to: currencyTableView.rx.items(cellIdentifier: "\(CurrencyCell.self)", cellType: CurrencyCell.self)) {
            [weak self] index , item , cell in
            var countryCode = item.key
            countryCode.removeLast()
            self?.numbFormatter.currencyCode = try? self?.viewModel.currencyCode.value()
            cell.flagLbl.text = countryCode.flag()
            cell.currencyLbl.text = item.key
            cell.currencyValue.text = self?.numbFormatter.string(from: NSNumber(value: item.value))
        }.disposed(by: disposeBag)
        
        viewModel.currencyCode.subscribe(onNext: { [weak self] (currencyCode) in
            self?.viewModel.getLatestCurrencies(base: currencyCode)
        }).disposed(by: disposeBag)
        
        selectedCurrencyView.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self] (_) in
            self?.viewModel.goToCurrencySelector()
            
            }).disposed(by: disposeBag)
        
        self.viewModel.errorSubject.subscribe(onNext: { (error) in
            let alertView = UIAlertController()
            alertView.title = "Error"
            alertView.message = "Could not retrieve the data"
            let ok = UIAlertAction(title: "Ok", style: .destructive) { (action) in
                
            }
            alertView.addAction(ok)
            self.present(alertView, animated: true)
        }).disposed(by: disposeBag)
        
    }
    
    func startLoading() {
        loadingIndicator.startAnimating()
        currencyTableView.isHidden = true
    }
    
    func stopLoading() {
        loadingIndicator.stopAnimating()
        currencyTableView.isHidden = false
    }
}

