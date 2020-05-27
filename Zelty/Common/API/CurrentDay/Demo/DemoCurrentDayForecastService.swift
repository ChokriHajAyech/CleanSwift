import Foundation

class DemoCurrentDayForecastService: DemoService, CurrentDayForecastService {
    
    func getCurrentDayForecast(city: String, completion: @escaping ServiceCompletionHandler) {
        let file = "CurrentDay"
        invokeService(file: file, type: WeeklyForecastResponse.self, completion: completion)
    }
}
