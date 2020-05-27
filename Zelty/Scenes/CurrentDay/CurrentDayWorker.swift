
import Foundation

class CurrentDayWorker {
    
    var currentDayService = ServiceFactory.shared.makeCurrentDayForecastService()
    
    func weatherForCurrentDay(city: String, completion: @escaping ( _ weather: CurrentWeatherForecastResponse?, _ error: Error?) -> Void) {
        
        currentDayService.getCurrentDayForecast(city: city) { (result, error) in
            completion(result as? CurrentWeatherForecastResponse, error)
        }
    }
}
