//
//  AppModules.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

////MARK: - Application modules
//enum AppModules: String, ViperModule {
//    case home
//
//    var viewType: ViperViewType {
//        switch self {
//        case .home: return .storyboard
//        }
//    }
//}

class HomeModule: ViperModule {
    static var viewType: ViperViewType = .storyboard
    
    static var viewName: String = "home"
    
    typealias I = HomeInteractor
    
    typealias V = HomeView
    
    typealias P = HomePresenter
    
    typealias R = HomeRouter
    

}
