struct Conf {
    static let brand = "Zelty"
    static let version = "1.0"
    static let build = "1"
    static let platform = "dev"
    static let cacheDiskCapacity = 10000000 * 10
    static let cacheMemoryCapacity = 512000 * 10
    
    struct OpenWeatherAPI {
        static let mode = "server"
        static let scheme = "https"
        static let host = "api.openweathermap.org"
        static let path = "/data/2.5"
        static let key = "aacc07b2d4eb4ae5ba11e929dcf55356"
        static let forecast = "/forecast"
        static let weather = "/weather"
    }
    
    struct RestcountriesAPI {
        static let mode = "server"
        static let scheme = "https"
        static let host = "restcountries.eu"
        static let path = "/rest/v2/all"
                        
    }
    
    struct FlagcountriesAPI {
           static let mode = "server"
           static let host = "https://www.countryflags.io/"
           static let path = "/shiny/64.png"
                           
       }
}
