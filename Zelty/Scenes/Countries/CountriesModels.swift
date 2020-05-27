
import Foundation

enum CountriesModels {
    
    enum FetchCountries {
        struct Request {}
        struct SearchRequest {
            let text: String
        }
        struct Response {
            var countriesArray: [Country]
        }
        struct ViewModel {
            struct Country {
                let name: String
                let alpha2Code: String
                let capital: String
                let flag: URL
            }
            var listCountry: [Country]
        }
    }
}
