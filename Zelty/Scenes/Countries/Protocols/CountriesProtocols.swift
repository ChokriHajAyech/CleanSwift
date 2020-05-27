
import Foundation

///sourcery: AutoMockable
protocol CountriesDisplayLogic: class {
    func displayFetchedCountries(with viewModel: CountriesModels.FetchCountries.ViewModel)
    func displaySearchedCountries(with viewModel: CountriesModels.FetchCountries.ViewModel)
}

///sourcery: AutoMockable
protocol CountriesBusinessLogic: class {
    func fetchCountries(with request: CountriesModels.FetchCountries.Request)
    func searchCountry(with request: CountriesModels.FetchCountries.SearchRequest)
}

///sourcery: AutoMockable
protocol CountriesDataStore: class {
    var listCountries: [Country]? { get  set }
}

///sourcery: AutoMockable
protocol CountriesPresentationLogic: class {
    func presentFetchedCountries(with response: CountriesModels.FetchCountries.Response)
    func presentSearchedCountries(with response: CountriesModels.FetchCountries.Response)
}

///sourcery: AutoMockable
protocol CountriesRoutingLogic {
    func routeToCurrentDay(city: String)
}

///sourcery: AutoMockable
protocol CountriesDataPassing {
    var dataStore: CountriesDataStore? { get }
}
