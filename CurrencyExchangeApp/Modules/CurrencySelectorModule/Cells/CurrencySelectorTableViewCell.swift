//
//  CurrencySelectorTableViewCell.swift
//  CurrencyExchangeApp
//
//  Created by Kiro on 10/11/20.
//  Copyright © 2020 Kiro. All rights reserved.
//

import UIKit
import RxSwift

class CurrencySelectorTableViewCell: UITableViewCell {
    var disposeBag = DisposeBag()
    @IBOutlet weak var flagLbl: UILabel!
    @IBOutlet weak var currencyCodeLbl: UILabel!
    
    override func prepareForReuse() {
        self.disposeBag = DisposeBag()
    }
}
