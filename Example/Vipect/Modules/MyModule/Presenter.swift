import VIPER

extension MyModule {

    class Presenter: VIPERPresenter {
            
        static func map(input presenterModel: PresenterModel) -> ViewModel {
            return ViewModel()
        }
        
    }

}