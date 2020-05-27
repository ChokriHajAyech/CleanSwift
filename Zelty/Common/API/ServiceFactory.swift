import Foundation

class ServiceFactory {
    
    static let shared = ServiceFactory()
    static let modeDemo = "demo"
    static let modeCache = "cache"
    static let modeServer = "server"
    
    private init() {}
    
    func makeWeeklyForecastService() -> WeeklyForecastService {
        if Conf.OpenWeatherAPI.mode == ServiceFactory.modeDemo {
            return DemoWeeklyForecastService()
        } else if (Conf.OpenWeatherAPI.mode == ServiceFactory.modeCache) {
            return CacheWeeklyForecastService()
        }
        return ServerWeeklyForecastService()
    }
    
    func makeCurrentDayForecastService() -> CurrentDayForecastService {
        if Conf.OpenWeatherAPI.mode == ServiceFactory.modeDemo {
            return DemoCurrentDayForecastService()
        } else if (Conf.OpenWeatherAPI.mode == ServiceFactory.modeCache) {
            return CacheCurrentDayForecastService()
        }
        return ServerCurrentDayForecastService()
    }
    
    func makeCountriesService() -> CountriesService {
          if Conf.RestcountriesAPI.mode == ServiceFactory.modeDemo {
              return DemoCountriesService()
          } else if (Conf.RestcountriesAPI.mode == ServiceFactory.modeCache) {
              return CacheCountriesService()
          }
          return ServerCountriesService()
      }
}
