//
//  SecondView.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import Vipect

//MARK: - Public Interface Protocol
protocol SecondViewInterface {
}

//MARK: Second View
final class SecondView: UserInterface {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Second Module"
    }
    
    @IBAction func closeButtonPressed() {
        presenter.close()
    }
}

//MARK: - Public interface
extension SecondView: SecondViewInterface {
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension SecondView {
    var presenter: SecondPresenter {
        return _presenter as! SecondPresenter
    }
}
