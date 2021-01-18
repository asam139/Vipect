//
//  UserSettings.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation

class UserSettings: ObservableObject {
    @Published var randomName = "random"
    @Published var score = 0
}
