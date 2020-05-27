
import Foundation

class WeeklyPresenter: WeeklyPresentationLogic {
    
    var viewController:  WeeklyDisplayLogic?
    
    func presentWeatherForWeeky(with response: WeeklyModels.FetchWeatherWeekly.Response) {
        
        var weeklyVM = [WeeklyModels.FetchWeatherWeekly.ViewModel.Item]()
        response.weatherWeekly.list.forEach { (item) in
            
            let date =  dayFormatter.string(from: item.date) + " " +  monthFormatter.string(from: item.date)
            let main = String(format: "%.1f", item.main)
            let weather = item.weather.first ?? ""
            
            let itemVM = WeeklyModels.FetchWeatherWeekly.ViewModel.Item(date: date, main: main, weather: weather )
            weeklyVM.append(itemVM)
            
        }
    
        let viewModel = WeeklyModels.FetchWeatherWeekly.ViewModel(list: weeklyVM)
        viewController?.displayWeatherForWeeky(with: viewModel)
    }
    
}
