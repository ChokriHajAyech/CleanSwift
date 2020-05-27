
import Foundation

class DemoCountriesService: DemoService, CountriesService {
    
    func getListCountries(_ completion: @escaping ServiceCompletionHandler) {
        let file = "Countries"
        invokeService(file: file, type: [CountryResponse].self, completion: completion)
    }
}
