
import Foundation

class WeeklyInteractor: WeeklyBusinessLogic, WeeklyDataStore {
    
    var worker: WeeklyAPI?
    var presenter: WeeklyPresentationLogic?
    var city: String?
    
    func fetchWeatherForWeekly(with request: WeeklyModels.FetchWeatherWeekly.Request) {
        
        let city = request.text
        worker?.weatherForWeekly(city: city, completion: { (weeklyWeather, error) in
            
            var weeklyItems = [WeatherWeekly.Item]()
            weeklyWeather?.list.forEach({ (item) in
                var description = [String]()
                item.weather.forEach { (weather) in
                    description.append(weather.weatherDescription)
                }
                let item = WeatherWeekly.Item(date: item.date, main: item.main.temp, weather: description)
                weeklyItems.append(item)
            })
            
            let response =  WeeklyModels.FetchWeatherWeekly.Response(weatherWeekly: WeatherWeekly(list: weeklyItems))
            
            self.presenter?.presentWeatherForWeeky(with: response)
        })
    }
}
