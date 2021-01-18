//
//  CoolPresenter.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 23/12/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import Vipect

// MARK: - CoolPresenter Class
final class CoolPresenter: Presenter {
    var _viewModel: UserSettings!

    override func bindLyfeCycle() {
        super.bindLyfeCycle()
        _view.lifeCycleObservable.subscribe(onNext: { value in
            switch value {
            case .viewDidDisappear:
                print("The swiftUI host has appeared!")
            default:
                return
            }
        }).disposed(by: disposeBag)
    }
}

// MARK: - CoolPresenter API
extension CoolPresenter: CoolPresenterApi {
    func settings() -> UserSettings {
        _viewModel = UserSettings()
        return _viewModel
    }
    
    func changeRandomName() {
        _viewModel.randomName = "Loading..."
        DispatchQueue.global(qos: .background).async { [weak self] in
            let url = URL(string: "https://www.random.org/strings/?num=1&len=10&upperalpha=on&loweralpha=on&unique=off&format=plain")!
            
            let name = try! String(contentsOf: url)
            DispatchQueue.main.async { [weak self] in
                self?._viewModel.randomName = name
            }
        }
    }

    func changeScore () {
        _viewModel.score += 1
    }
    
    func showAnotherModule() {
        print("Show another module")
        router.goToPerfect()
    }
}

// MARK: - Cool Viper Components
private extension CoolPresenter {
    var interactor: CoolInteractorApi {
        return _interactor as! CoolInteractorApi
    }
    var router: CoolRouterApi {
        return _router as! CoolRouterApi
    }
}
