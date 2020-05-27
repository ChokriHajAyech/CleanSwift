
import Foundation

class WeeklyRouter: NSObject, WeeklyRoutingLogic,  WeeklyDataPassing {
   
    var dataStore:  WeeklyDataStore?
    var viewController:  WeeklyViewController?
}
