
import Foundation

class CurrentDayInteractor: CurrentDayBusinessLogic, CurrentDayDataStore {
    
    var worker: CurrentDayWorker? = CurrentDayWorker()
    var presenter: CurrentDayPresentationLogic?
    var city: String?
    
    func fetchWeatherForCurrentDay(with request: CurrentDayModels.FetchWeatherCurrentDay.Request) {
        let city = request.text
        worker?.weatherForCurrentDay(city: city, completion: { (currentWeather, error) in
            
            let temperature = currentWeather?.main.temperature ?? 0
            let maxTemperature = currentWeather?.main.maxTemperature ?? 0
            let minTemperature = currentWeather?.main.minTemperature ?? 0
            let humidity = currentWeather?.main.humidity ?? 0
            let lat = currentWeather?.coord.lat ?? 0
            let lon = currentWeather?.coord.lon ?? 0
            
            let weatherCurrentDay = WeatherCurrentDay(lon: lon, lat: lat, temperature: temperature, humidity: humidity, maxTemperature: maxTemperature, minTemperature: minTemperature)
            
            let response =  CurrentDayModels.FetchWeatherCurrentDay.Response(weatherCurrentDay: weatherCurrentDay)
            self.presenter?.presentWeatherForCurrentDay(with: response)
        })
    }
}
