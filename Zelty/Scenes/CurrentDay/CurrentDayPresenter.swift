
import Foundation

class CurrentDayPresenter: CurrentDayPresentationLogic {
    
    var viewController: CurrentDayDisplayLogic?
    
    func presentWeatherForCurrentDay(with response: CurrentDayModels.FetchWeatherCurrentDay.Response) {
        
        let temperature =  "☀️ Temperature: \(response.weatherCurrentDay.temperature)"
        let maxTemperature =  "📈 Max temperature: \(response.weatherCurrentDay.maxTemperature)"
        let minTemperature =  "📉 Min temperature: \(response.weatherCurrentDay.minTemperature)"
        let humidity = "💧 Humidity: \(response.weatherCurrentDay.humidity)"
        let lat = response.weatherCurrentDay.lat
        let lon = response.weatherCurrentDay.lon
        
        let viewModel = CurrentDayModels.FetchWeatherCurrentDay.ViewModel(lon: lon, lat: lat, temperature: temperature, humidity: humidity, maxTemperature: maxTemperature, minTemperature: minTemperature)
        viewController?.displayWeatherForCurrentDay(with: viewModel)
    }
    
}
