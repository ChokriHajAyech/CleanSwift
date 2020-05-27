
import Foundation

struct Country {
    let name: String
    let alpha2Code: String
    let capital: String
    let flag: String
}

struct WeatherCurrentDay {
    let lon: Double
    let lat: Double
    let temperature: Double
    let humidity: Int
    let maxTemperature: Double
    let minTemperature: Double
}

struct WeatherWeekly {
    let list: [Item]
    struct Item {
        let date: Date
        let main: Double
        let weather: [String]
    }
}
