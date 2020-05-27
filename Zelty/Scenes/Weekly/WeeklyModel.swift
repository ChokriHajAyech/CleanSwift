
import Foundation

enum WeeklyModels {
    
    enum FetchWeatherWeekly {
        
        struct Request {
             let text: String
        }
      
        struct Response {
            var weatherWeekly: WeatherWeekly
        }
        
        struct ViewModel {
           let list: [Item]
           struct Item {
               let date: String
               let main: String
               let weather: String
           }
        }
    }
}
