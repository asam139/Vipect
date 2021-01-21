//
//  AppModules.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

//MARK: - Application modules
enum AppModules: String, ViperModule {
    case home
    case second
    case tableOfContents
    case cool
    case simple
    case perfect
    case qrScanner = "QRScanner"

    var viewType: ViperViewType {
        switch self {
        case .cool, .perfect: return .swiftUI
        case .tableOfContents: return .code
        case .simple: return .code
        default: return .storyboard
        }
    }
}
