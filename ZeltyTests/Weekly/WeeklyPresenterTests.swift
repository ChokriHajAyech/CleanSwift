
@testable import Zelty
import XCTest

class WeeklyPresenterTests: XCTestCase {
    
    // MARK: - Subject under test
    var sut: WeeklyPresenter!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupWeeklyPresenter()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupWeeklyPresenter() {
        sut = WeeklyPresenter()
    }
    
    // MARK: - WeeklyBusinessLogic
    
    func testPresentWeatherForWeeky() {
        
        // Given
        let weeklyDisplayLogic = WeeklyDisplayLogicMock()
        sut.viewController = weeklyDisplayLogic
        
        // When
        let start = "2017-05-25"
        let dateFormat = "yyyy-MM-dd"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let date = dateFormatter.date(from: start)
        
        let item = WeatherWeekly.Item(date: date!, main: 27.9, weather:["clear sky"])
        var listItems = [WeatherWeekly.Item]()
        listItems.append(item)
        let weatherWeekly = WeatherWeekly(list: listItems)
        let response = WeeklyModels.FetchWeatherWeekly.Response(weatherWeekly: weatherWeekly)
        sut.presentWeatherForWeeky(with: response)
        
        // Then
        let viewModel = weeklyDisplayLogic.displayWeatherForWeekyWithReceivedViewModel
        let itemViewModel = viewModel!.list.first
        
        XCTAssertEqual(itemViewModel?.main, "27.9")
        XCTAssertEqual(itemViewModel?.weather, "clear sky")
        XCTAssertEqual(itemViewModel?.date, "25 May")

    }
}
