
import Foundation

///sourcery: AutoMockable
protocol WeeklyDisplayLogic: class {
    func displayWeatherForWeeky(with viewModel: WeeklyModels.FetchWeatherWeekly.ViewModel)
}

///sourcery: AutoMockable
protocol WeeklyBusinessLogic: class {
    func fetchWeatherForWeekly(with request: WeeklyModels.FetchWeatherWeekly.Request)
}

///sourcery: AutoMockable
protocol WeeklyDataStore: class {
    var city: String? { get  set }
}

///sourcery: AutoMockable
protocol WeeklyPresentationLogic: class {
    func presentWeatherForWeeky(with response: WeeklyModels.FetchWeatherWeekly.Response)
}

///sourcery: AutoMockable
protocol WeeklyRoutingLogic {
}

///sourcery: AutoMockable
protocol WeeklyDataPassing {
    var dataStore: WeeklyDataStore? { get }
}

///sourcery: AutoMockable
protocol WeeklyAPI {
    func weatherForWeekly(city: String, completion: @escaping ( _ weather: WeeklyForecastResponse?, _ error: Error?) -> Void)
}
