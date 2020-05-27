
import Foundation

class CurrentDayRouter: NSObject, CurrentDayRoutingLogic, CurrentDayDataPassing {
    
    var dataStore: CurrentDayDataStore?
    var viewController: CurrentDayViewController?
    
    func routeToWeekly(city: String) {
        
        let destinationVC = WeeklyViewController()
        var destinationDS = destinationVC.router?.dataStore
        passDataToDetails(destination: &(destinationDS!), city: city)
        if let viewController = viewController {
            navigateToWeekly(source: viewController, destination: destinationVC)
        }
    }
    
    // MARK: Navigation
    
    func navigateToWeekly(source: CurrentDayViewController, destination: WeeklyViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    // MARK: Passing data
    
    func passDataToDetails(destination: inout WeeklyDataStore, city: String) {
        
        destination.city = city
    }
}
