
import Foundation

class ServerCountriesService: ServerService, CountriesService {
    
    func getListCountries(_ completion: @escaping ServiceCompletionHandler) {
       
        let path = makeCountriesComponents().string
              invokeService(path: path!, method: "GET", type: [CountryResponse].self, completion: completion)
    }
  
    func makeCountriesComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = Conf.RestcountriesAPI.scheme
        components.host = Conf.RestcountriesAPI.host
        components.path = Conf.RestcountriesAPI.path
       
        return components
    }
}
