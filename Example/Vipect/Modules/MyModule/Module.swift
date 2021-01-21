import AppKit

import VIPER
        
public protocol Builder {
    
}

public enum MyModule {

    public func assemble(entities: Entities, builder: Builder) -> NSViewController {
        return VIPERModule<View, Interactor<Router>, Presenter, Router>.assemble(entities: entities, builder: builder)
    }

    public struct Entities {
        
        public init() {
            
        }
        
    }
    
    enum UserInteraction {
        
    }
    
    enum Navigation {
        
    }
        
    struct PresenterModel {
        
    }

    struct ViewModel {
        
    }

}