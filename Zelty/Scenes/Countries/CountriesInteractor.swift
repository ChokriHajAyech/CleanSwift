
import Foundation

class CountriesInteractor: CountriesBusinessLogic, CountriesDataStore {
    
    var listCountries: [Country]?
    var worker: CountriesWorker? = CountriesWorker()
    var presenter: CountriesPresentationLogic?
    
    func fetchCountries(with request: CountriesModels.FetchCountries.Request) {
    
        worker?.listCountries(completion: { (countriesCodable, error) in
            var countriesTmp = [Country]()
            countriesCodable?.forEach({ countryCodable in
                
                let pngFlag = Conf.FlagcountriesAPI.host+countryCodable.alpha2Code+Conf.FlagcountriesAPI.path
                
                let country = Country(name: countryCodable.name, alpha2Code: countryCodable.alpha2Code, capital: countryCodable.capital, flag:pngFlag)
                
                countriesTmp.append(country)
            })

            self.listCountries = countriesTmp
            let response = CountriesModels.FetchCountries.Response(countriesArray: countriesTmp)
            self.presenter?.presentFetchedCountries(with: response)
        })
    }
    
    func searchCountry(with request: CountriesModels.FetchCountries.SearchRequest) {
       
        if let listCountries = self.listCountries, request.text.count == 0 {
            let response = CountriesModels.FetchCountries.Response(countriesArray: listCountries)
            self.presenter?.presentFetchedCountries(with: response)

            return
        }
        
        if let country = listCountries?.filter({($0.name.containsIgnoringCase(request.text) || $0.alpha2Code.containsIgnoringCase(request.text))}) {
            let response = CountriesModels.FetchCountries.Response(countriesArray: country)
            self.presenter?.presentSearchedCountries(with: response)
        }
    }
}
