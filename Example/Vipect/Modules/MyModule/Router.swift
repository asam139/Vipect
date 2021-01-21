import Foundation

import VIPER

extension MyModule {
    
    class Router: VIPERRouter {
            
        let builder: Builder
        
        required init(builder: Builder) {
            self.builder = builder
        }
        
        func receive(navigation: Navigation, for view: View) {
            
        }
        
    }

}