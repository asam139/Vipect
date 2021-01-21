import Combine

import VIPER

extension MyModule {

    class Interactor<Router>: VIPERInteractor {
        
        let presenter: CurrentValueSubject<PresenterModel, Never>
        let router = PassthroughSubject<Navigation, Never>()
        
        required init(entities: Entities) {
            presenter = .init(Self.generatePresenterModel())
        }
        
        private static func generatePresenterModel() -> PresenterModel {
            return PresenterModel()
        }
        
        func receive(userInteraction: UserInteraction) {
            
        }
        
    }

}