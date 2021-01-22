//
//  AppDelegate.swift
//  Vipect
//
//  Created by Saul Moreno Abril on 12/22/2020.
//  Copyright (c) 2020 Saul Moreno Abril. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let myContainer = Container()
        let module = AppModules.tableOfContents.build(container: myContainer)

        module.router.show(inWindow: window, embedInNavController: true, makeKeyAndVisible: true)
        return true
    }
}

