import Foundation

protocol WeeklyForecastService {
    func getWeeklyForecast(city:String, completion: @escaping ServiceCompletionHandler)
}
