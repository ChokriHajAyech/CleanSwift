import Foundation

class ServerWeeklyForecastService: ServerService, WeeklyForecastService {
    
    func getWeeklyForecast(city: String, completion: @escaping ServiceCompletionHandler) {
        let path = makeWeeklyForecastComponents(withCity: city).string
        invokeService(path: path!, method: "GET", type: WeeklyForecastResponse.self, completion: completion)
    }
    
    func makeWeeklyForecastComponents(withCity city: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = Conf.OpenWeatherAPI.scheme
        components.host = Conf.OpenWeatherAPI.host
        components.path = Conf.OpenWeatherAPI.path + Conf.OpenWeatherAPI.forecast
        
        components.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "mode", value: "json"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "APPID", value: Conf.OpenWeatherAPI.key)
        ]
        
        return components
    }
}
