import AppKit
import Combine

import VIPER
        
extension MyModule {

    class View: NSViewController, VIPERView {
        
        let interactor = PassthroughSubject<UserInteraction, Never>()
        private var viewModel: ViewModel
        
        required init(input viewModel: ViewModel) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            DispatchQueue.main.async { [unowned self] in
                self.receive(input: self.viewModel)
            }
        }
        
        func receive(input viewModel: ViewModel) {
            defer {
                self.viewModel = viewModel
            }
            guard isViewLoaded else { return }
        }
            
    }

}