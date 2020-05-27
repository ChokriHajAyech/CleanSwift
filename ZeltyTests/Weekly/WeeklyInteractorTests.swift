
@testable import Zelty
import XCTest

class WeeklynteractorTests: XCTestCase {
    
    // MARK: - Subject under test
    var sut: WeeklyInteractor!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupWeeklyInteractor()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupWeeklyInteractor() {
        sut = WeeklyInteractor()
    }
    
    // MARK: - WeeklyBusinessLogic
    
    func testFetchWeatherForWeekly() {
        
        // Given
        let presenter = WeeklyPresentationLogicMock()
        let worker = WeeklyAPIMock()
        sut.presenter = presenter
        sut.worker = worker
        
        // When
        let request = WeeklyModels.FetchWeatherWeekly.Request(text: "France")
        sut.fetchWeatherForWeekly(with: request)
        
        // Then
        XCTAssertTrue(worker.weatherForWeeklyCityCompletionCalled, "fetchWeatherForWeekly() should ask WeeklyWorker to fetch weekly weather")
        
        // Then
        XCTAssertEqual(worker.weatherForWeeklyCityCompletionCallsCount, 1, "fetchWeatherForWeekly() should ask WeeklyWorker to fetch weekly weather")
    }
}
