//
//  CurrencyCell.swift
//  CurrencyExchangeApp
//
//  Created by Kiro on 10/10/20.
//  Copyright © 2020 Kiro. All rights reserved.
//

import UIKit
import RxSwift

class CurrencyCell: UITableViewCell {
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var flagLbl: UILabel!
    @IBOutlet weak var currencyLbl: UILabel!
    @IBOutlet weak var currencyValue: UILabel!
    
    override func prepareForReuse() {
        self.disposeBag = DisposeBag()
    }
    
}
