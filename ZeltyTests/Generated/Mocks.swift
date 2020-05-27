// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

@testable import Zelty
import Zelty













class CountriesBusinessLogicMock: CountriesBusinessLogic {

    // MARK: - fetchCountries

    var fetchCountriesWithCallsCount = 0
    var fetchCountriesWithCalled: Bool {
        return fetchCountriesWithCallsCount > 0
    }
    var fetchCountriesWithReceivedRequest: CountriesModels.FetchCountries.Request?
    var fetchCountriesWithClosure: ((CountriesModels.FetchCountries.Request) -> Void)?

    func fetchCountries(with request: CountriesModels.FetchCountries.Request) {
        fetchCountriesWithCallsCount += 1
        fetchCountriesWithReceivedRequest = request
        fetchCountriesWithClosure?(request)
    }

    // MARK: - searchCountry

    var searchCountryWithCallsCount = 0
    var searchCountryWithCalled: Bool {
        return searchCountryWithCallsCount > 0
    }
    var searchCountryWithReceivedRequest: CountriesModels.FetchCountries.SearchRequest?
    var searchCountryWithClosure: ((CountriesModels.FetchCountries.SearchRequest) -> Void)?

    func searchCountry(with request: CountriesModels.FetchCountries.SearchRequest) {
        searchCountryWithCallsCount += 1
        searchCountryWithReceivedRequest = request
        searchCountryWithClosure?(request)
    }

}
class CountriesDataPassingMock: CountriesDataPassing {
    var dataStore: CountriesDataStore?

}
class CountriesDataStoreMock: CountriesDataStore {
    var listCountries: [Country]?

}
class CountriesDisplayLogicMock: CountriesDisplayLogic {

    // MARK: - displayFetchedCountries

    var displayFetchedCountriesWithCallsCount = 0
    var displayFetchedCountriesWithCalled: Bool {
        return displayFetchedCountriesWithCallsCount > 0
    }
    var displayFetchedCountriesWithReceivedViewModel: CountriesModels.FetchCountries.ViewModel?
    var displayFetchedCountriesWithClosure: ((CountriesModels.FetchCountries.ViewModel) -> Void)?

    func displayFetchedCountries(with viewModel: CountriesModels.FetchCountries.ViewModel) {
        displayFetchedCountriesWithCallsCount += 1
        displayFetchedCountriesWithReceivedViewModel = viewModel
        displayFetchedCountriesWithClosure?(viewModel)
    }

    // MARK: - displaySearchedCountries

    var displaySearchedCountriesWithCallsCount = 0
    var displaySearchedCountriesWithCalled: Bool {
        return displaySearchedCountriesWithCallsCount > 0
    }
    var displaySearchedCountriesWithReceivedViewModel: CountriesModels.FetchCountries.ViewModel?
    var displaySearchedCountriesWithClosure: ((CountriesModels.FetchCountries.ViewModel) -> Void)?

    func displaySearchedCountries(with viewModel: CountriesModels.FetchCountries.ViewModel) {
        displaySearchedCountriesWithCallsCount += 1
        displaySearchedCountriesWithReceivedViewModel = viewModel
        displaySearchedCountriesWithClosure?(viewModel)
    }

}
class CountriesPresentationLogicMock: CountriesPresentationLogic {

    // MARK: - presentFetchedCountries

    var presentFetchedCountriesWithCallsCount = 0
    var presentFetchedCountriesWithCalled: Bool {
        return presentFetchedCountriesWithCallsCount > 0
    }
    var presentFetchedCountriesWithReceivedResponse: CountriesModels.FetchCountries.Response?
    var presentFetchedCountriesWithClosure: ((CountriesModels.FetchCountries.Response) -> Void)?

    func presentFetchedCountries(with response: CountriesModels.FetchCountries.Response) {
        presentFetchedCountriesWithCallsCount += 1
        presentFetchedCountriesWithReceivedResponse = response
        presentFetchedCountriesWithClosure?(response)
    }

    // MARK: - presentSearchedCountries

    var presentSearchedCountriesWithCallsCount = 0
    var presentSearchedCountriesWithCalled: Bool {
        return presentSearchedCountriesWithCallsCount > 0
    }
    var presentSearchedCountriesWithReceivedResponse: CountriesModels.FetchCountries.Response?
    var presentSearchedCountriesWithClosure: ((CountriesModels.FetchCountries.Response) -> Void)?

    func presentSearchedCountries(with response: CountriesModels.FetchCountries.Response) {
        presentSearchedCountriesWithCallsCount += 1
        presentSearchedCountriesWithReceivedResponse = response
        presentSearchedCountriesWithClosure?(response)
    }

}
class CountriesRoutingLogicMock: CountriesRoutingLogic {

    // MARK: - routeToCurrentDay

    var routeToCurrentDayCityCallsCount = 0
    var routeToCurrentDayCityCalled: Bool {
        return routeToCurrentDayCityCallsCount > 0
    }
    var routeToCurrentDayCityReceivedCity: String?
    var routeToCurrentDayCityClosure: ((String) -> Void)?

    func routeToCurrentDay(city: String) {
        routeToCurrentDayCityCallsCount += 1
        routeToCurrentDayCityReceivedCity = city
        routeToCurrentDayCityClosure?(city)
    }

}
class CurrentDayBusinessLogicMock: CurrentDayBusinessLogic {

    // MARK: - fetchWeatherForCurrentDay

    var fetchWeatherForCurrentDayWithCallsCount = 0
    var fetchWeatherForCurrentDayWithCalled: Bool {
        return fetchWeatherForCurrentDayWithCallsCount > 0
    }
    var fetchWeatherForCurrentDayWithReceivedRequest: CurrentDayModels.FetchWeatherCurrentDay.Request?
    var fetchWeatherForCurrentDayWithClosure: ((CurrentDayModels.FetchWeatherCurrentDay.Request) -> Void)?

    func fetchWeatherForCurrentDay(with request: CurrentDayModels.FetchWeatherCurrentDay.Request) {
        fetchWeatherForCurrentDayWithCallsCount += 1
        fetchWeatherForCurrentDayWithReceivedRequest = request
        fetchWeatherForCurrentDayWithClosure?(request)
    }

}
class CurrentDayDataPassingMock: CurrentDayDataPassing {
    var dataStore: CurrentDayDataStore?

}
class CurrentDayDataStoreMock: CurrentDayDataStore {
    var city: String?

}
class CurrentDayDisplayLogicMock: CurrentDayDisplayLogic {

    // MARK: - displayWeatherForCurrentDay

    var displayWeatherForCurrentDayWithCallsCount = 0
    var displayWeatherForCurrentDayWithCalled: Bool {
        return displayWeatherForCurrentDayWithCallsCount > 0
    }
    var displayWeatherForCurrentDayWithReceivedViewModel: CurrentDayModels.FetchWeatherCurrentDay.ViewModel?
    var displayWeatherForCurrentDayWithClosure: ((CurrentDayModels.FetchWeatherCurrentDay.ViewModel) -> Void)?

    func displayWeatherForCurrentDay(with viewModel: CurrentDayModels.FetchWeatherCurrentDay.ViewModel) {
        displayWeatherForCurrentDayWithCallsCount += 1
        displayWeatherForCurrentDayWithReceivedViewModel = viewModel
        displayWeatherForCurrentDayWithClosure?(viewModel)
    }

}
class CurrentDayPresentationLogicMock: CurrentDayPresentationLogic {

    // MARK: - presentWeatherForCurrentDay

    var presentWeatherForCurrentDayWithCallsCount = 0
    var presentWeatherForCurrentDayWithCalled: Bool {
        return presentWeatherForCurrentDayWithCallsCount > 0
    }
    var presentWeatherForCurrentDayWithReceivedResponse: CurrentDayModels.FetchWeatherCurrentDay.Response?
    var presentWeatherForCurrentDayWithClosure: ((CurrentDayModels.FetchWeatherCurrentDay.Response) -> Void)?

    func presentWeatherForCurrentDay(with response: CurrentDayModels.FetchWeatherCurrentDay.Response) {
        presentWeatherForCurrentDayWithCallsCount += 1
        presentWeatherForCurrentDayWithReceivedResponse = response
        presentWeatherForCurrentDayWithClosure?(response)
    }

}
class CurrentDayRoutingLogicMock: CurrentDayRoutingLogic {

    // MARK: - routeToWeekly

    var routeToWeeklyCityCallsCount = 0
    var routeToWeeklyCityCalled: Bool {
        return routeToWeeklyCityCallsCount > 0
    }
    var routeToWeeklyCityReceivedCity: String?
    var routeToWeeklyCityClosure: ((String) -> Void)?

    func routeToWeekly(city: String) {
        routeToWeeklyCityCallsCount += 1
        routeToWeeklyCityReceivedCity = city
        routeToWeeklyCityClosure?(city)
    }

}
class WeeklyAPIMock: WeeklyAPI {

    // MARK: - weatherForWeekly

    var weatherForWeeklyCityCompletionCallsCount = 0
    var weatherForWeeklyCityCompletionCalled: Bool {
        return weatherForWeeklyCityCompletionCallsCount > 0
    }
    var weatherForWeeklyCityCompletionReceivedArguments: (city: String, completion: ( _ weather: WeeklyForecastResponse?, _ error: Error?) -> Void)?
    var weatherForWeeklyCityCompletionClosure: ((String, @escaping ( _ weather: WeeklyForecastResponse?, _ error: Error?) -> Void) -> Void)?

    func weatherForWeekly(city: String, completion: @escaping ( _ weather: WeeklyForecastResponse?, _ error: Error?) -> Void) {
        weatherForWeeklyCityCompletionCallsCount += 1
        weatherForWeeklyCityCompletionReceivedArguments = (city: city, completion: completion)
        weatherForWeeklyCityCompletionClosure?(city, completion)
    }

}
class WeeklyBusinessLogicMock: WeeklyBusinessLogic {

    // MARK: - fetchWeatherForWeekly

    var fetchWeatherForWeeklyWithCallsCount = 0
    var fetchWeatherForWeeklyWithCalled: Bool {
        return fetchWeatherForWeeklyWithCallsCount > 0
    }
    var fetchWeatherForWeeklyWithReceivedRequest: WeeklyModels.FetchWeatherWeekly.Request?
    var fetchWeatherForWeeklyWithClosure: ((WeeklyModels.FetchWeatherWeekly.Request) -> Void)?

    func fetchWeatherForWeekly(with request: WeeklyModels.FetchWeatherWeekly.Request) {
        fetchWeatherForWeeklyWithCallsCount += 1
        fetchWeatherForWeeklyWithReceivedRequest = request
        fetchWeatherForWeeklyWithClosure?(request)
    }

}
class WeeklyDataPassingMock: WeeklyDataPassing {
    var dataStore: WeeklyDataStore?

}
class WeeklyDataStoreMock: WeeklyDataStore {
    var city: String?

}
class WeeklyDisplayLogicMock: WeeklyDisplayLogic {

    // MARK: - displayWeatherForWeeky

    var displayWeatherForWeekyWithCallsCount = 0
    var displayWeatherForWeekyWithCalled: Bool {
        return displayWeatherForWeekyWithCallsCount > 0
    }
    var displayWeatherForWeekyWithReceivedViewModel: WeeklyModels.FetchWeatherWeekly.ViewModel?
    var displayWeatherForWeekyWithClosure: ((WeeklyModels.FetchWeatherWeekly.ViewModel) -> Void)?

    func displayWeatherForWeeky(with viewModel: WeeklyModels.FetchWeatherWeekly.ViewModel) {
        displayWeatherForWeekyWithCallsCount += 1
        displayWeatherForWeekyWithReceivedViewModel = viewModel
        displayWeatherForWeekyWithClosure?(viewModel)
    }

}
class WeeklyPresentationLogicMock: WeeklyPresentationLogic {

    // MARK: - presentWeatherForWeeky

    var presentWeatherForWeekyWithCallsCount = 0
    var presentWeatherForWeekyWithCalled: Bool {
        return presentWeatherForWeekyWithCallsCount > 0
    }
    var presentWeatherForWeekyWithReceivedResponse: WeeklyModels.FetchWeatherWeekly.Response?
    var presentWeatherForWeekyWithClosure: ((WeeklyModels.FetchWeatherWeekly.Response) -> Void)?

    func presentWeatherForWeeky(with response: WeeklyModels.FetchWeatherWeekly.Response) {
        presentWeatherForWeekyWithCallsCount += 1
        presentWeatherForWeekyWithReceivedResponse = response
        presentWeatherForWeekyWithClosure?(response)
    }

}
class WeeklyRoutingLogicMock: WeeklyRoutingLogic {

}
