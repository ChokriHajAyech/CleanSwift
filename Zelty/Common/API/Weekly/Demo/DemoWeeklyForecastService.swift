import Foundation

class DemoWeeklyForecastService: DemoService, WeeklyForecastService {
    
    func getWeeklyForecast(city: String, completion: @escaping ServiceCompletionHandler) {
        let file = "Weekly"
        invokeService(file: file, type: WeeklyForecastResponse.self, completion: completion)
    }
}
