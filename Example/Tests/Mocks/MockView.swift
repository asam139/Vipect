//
//  MockView.swift
//  Vipect_Tests
//
//  Created by Saul Moreno Abril on 2/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Vipect

class MockView: UserInterface {
    var deinitCalled: (() -> Void)?
    deinit { deinitCalled?() }
}
