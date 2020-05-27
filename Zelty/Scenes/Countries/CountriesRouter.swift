
import UIKit

class CountriesRouter: NSObject, CountriesRoutingLogic, CountriesDataPassing {
    
    var viewController: CountriesViewController?
    var dataStore: CountriesDataStore?
    
    func routeToCurrentDay(city: String) {
        
        let destinationVC = CurrentDayViewController()
        var destinationDS = destinationVC.router?.dataStore
        passDataToDetails(destination: &(destinationDS!), city: city)
        if let viewController = viewController {
            navigateToCurrentDay(source: viewController, destination: destinationVC)
        }
    }
    
    // MARK: Navigation
    
    func navigateToCurrentDay(source: CountriesViewController, destination: CurrentDayViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
       // MARK: Passing data
       
       func passDataToDetails(destination: inout CurrentDayDataStore, city: String) {

           destination.city = city
           
       }
       
}
