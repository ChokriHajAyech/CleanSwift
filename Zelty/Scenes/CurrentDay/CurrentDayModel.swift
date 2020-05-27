
import Foundation

enum CurrentDayModels {
    
    enum FetchWeatherCurrentDay {
        
        struct Request {
             let text: String
        }
      
        struct Response {
            var weatherCurrentDay: WeatherCurrentDay
        }
        
        struct ViewModel {
            let lon: Double
            let lat: Double
            let temperature: String
            let humidity: String
            let maxTemperature: String
            let minTemperature: String
        }
    }
}
