//
//  CurrencyConverterViewController.swift
//  CurrencyExchangeApp
//
//  Created by Kiro on 10/11/20.
//  Copyright © 2020 Kiro. All rights reserved.
//

import UIKit
import RxSwift

class CurrencyConverterViewController: UIViewController, CurrencyConverterViewControllerProtocol {

    @IBOutlet weak var currencyInputTF: UITextField!
    @IBOutlet weak var currencyInputCodeLbl: UILabel!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var resultCodeLbl: UILabel!
    @IBOutlet weak var closeBtn: UIButton!
    
    var viewModel: CurrencyConverterViewModelProtocol!
    let disposeBag = DisposeBag()
    
    private var numbFormatter: NumberFormatter {
        let numbFormatter = NumberFormatter()
        numbFormatter.maximumFractionDigits = 3
        return numbFormatter
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currencyInputTF.resignFirstResponder()
    }
    override func viewDidLoad() {
        currencyInputCodeLbl.text = self.viewModel.currentCurrent
        currencyInputTF.text = "1"
        self.currencyInputTF.rx.text.subscribe(onNext: { [weak self] (input) in
            guard let self = self , let inputStr = input, let inputDouble = Double(inputStr) else { return }
            self.resultLbl.text =  self.numbFormatter.string(from: NSNumber(value: inputDouble * self.viewModel.value))
            self.resultCodeLbl.text = self.viewModel.currency
        }).disposed(by: disposeBag)
        
        closeBtn.rx.tap.subscribe(onNext: { [weak self] () in
            guard let self = self else  { return }
            self.viewModel.goBack()
        }).disposed(by: disposeBag)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        currencyInputTF.becomeFirstResponder()
    }
}
