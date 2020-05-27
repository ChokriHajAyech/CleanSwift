
import Foundation

class CountriesWorker {
    
    var countriesService = ServiceFactory.shared.makeCountriesService()
    
    func listCountries(completion: @escaping ( _ countries: [CountryResponse]?, _ error: Error?) -> Void) {
        countriesService.getListCountries { (result, error) in
            completion(result as? [CountryResponse], error)
        }
    }
}
