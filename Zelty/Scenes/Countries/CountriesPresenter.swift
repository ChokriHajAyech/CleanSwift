
import Foundation

class CountriesPresenter: CountriesPresentationLogic {
    
    var viewController: CountriesDisplayLogic?
    
    func presentFetchedCountries(with response: CountriesModels.FetchCountries.Response) {
        
        let viewModel = makeViewModel(response: response)
        viewController?.displayFetchedCountries(with: viewModel)
    }
    
    func presentSearchedCountries(with response: CountriesModels.FetchCountries.Response) {
        
        let viewModel = makeViewModel(response: response)
        viewController?.displaySearchedCountries(with: viewModel)
    }
    
    private func makeViewModel(response: CountriesModels.FetchCountries.Response) -> CountriesModels.FetchCountries.ViewModel {
        var countriesVM = [CountriesModels.FetchCountries.ViewModel.Country]()
        response.countriesArray.forEach { country in
            let countryVm = CountriesModels.FetchCountries.ViewModel.Country(name: country.name, alpha2Code: country.alpha2Code, capital: country.capital, flag: (URL(string: country.flag) ?? URL(string: ""))!)
            countriesVM.append(countryVm)
        }
        return CountriesModels.FetchCountries.ViewModel(listCountry: countriesVM)
    }
}
