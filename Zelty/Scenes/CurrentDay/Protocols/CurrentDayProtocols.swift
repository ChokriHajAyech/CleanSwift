
import Foundation

///sourcery: AutoMockable
protocol CurrentDayDisplayLogic: class {
    func displayWeatherForCurrentDay(with viewModel: CurrentDayModels.FetchWeatherCurrentDay.ViewModel)
}

///sourcery: AutoMockable
protocol CurrentDayBusinessLogic: class {
    func fetchWeatherForCurrentDay(with request: CurrentDayModels.FetchWeatherCurrentDay.Request)
}

///sourcery: AutoMockable
protocol CurrentDayDataStore: class {
    var city: String? { get  set }
}

///sourcery: AutoMockable
protocol CurrentDayPresentationLogic: class {
    func presentWeatherForCurrentDay(with response: CurrentDayModels.FetchWeatherCurrentDay.Response)
}

///sourcery: AutoMockable
protocol CurrentDayRoutingLogic {
    func routeToWeekly(city: String)
}

///sourcery: AutoMockable
protocol CurrentDayDataPassing {
    var dataStore: CurrentDayDataStore? { get }
}
