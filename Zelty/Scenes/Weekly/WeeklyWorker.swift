
import Foundation

class WeeklyWorker: WeeklyAPI {
    
    var weeklyService = ServiceFactory.shared.makeWeeklyForecastService()
    
        func weatherForWeekly(city: String, completion: @escaping ( _ weather: WeeklyForecastResponse?, _ error: Error?) -> Void) {
            
            weeklyService.getWeeklyForecast(city: city) { (result, error) in
                completion(result as? WeeklyForecastResponse, error)
            }
        }
    }
