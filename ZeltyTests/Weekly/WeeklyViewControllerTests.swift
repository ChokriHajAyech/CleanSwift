
@testable import Zelty
import XCTest

class WeeklyViewControllerTests: XCTestCase {
    
    // MARK: - Subject under test
    var sut: WeeklyViewController!
    var window: UIWindow!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupWeeklyViewController()
    }
    
    // MARK: - Test setup
    
    func setupWeeklyViewController() {
        sut = WeeklyViewController()
        sut.loadViewIfNeeded()
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    class TableViewSpy: UITableView {
        
        // MARK: Method call expectations
        
        var reloadDataCalled = false
        
        // MARK: Spied methods
        
        override func reloadData()
        {
            reloadDataCalled = true
        }
    }
    
    // MARK: - Tests
    
    func testFetchWeatherForWeeklyWhenViewDidLoad() {
        // Given
        let weeklyBusinessLogicMock = WeeklyBusinessLogicMock()
        sut.interactor = weeklyBusinessLogicMock
        sut.router?.dataStore?.city = "fr"
        loadView()
        
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssert(weeklyBusinessLogicMock.fetchWeatherForWeeklyWithCalled, "Should fetch Weekly right before the view didLoad")
    }
    
    func testShouldConfigureTableViewCellToDisplayContact() {

        // Given
        let tableView = sut.tableView
    
        let item1 = WeeklyModels.FetchWeatherWeekly.ViewModel.Item(date: "20 juin", main: "35", weather: "clear")
        let item2 = WeeklyModels.FetchWeatherWeekly.ViewModel.Item(date: "22 juin", main: "45", weather: "sky")
        let items = [item1, item2]
        let viewModel = WeeklyModels.FetchWeatherWeekly.ViewModel(list: items)
           sut.displayWeatherForWeeky(with: viewModel)
        
        // When
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView(tableView!, cellForRowAt: indexPath) as? WeeklyCell
        
        // Then
        XCTAssertEqual(cell?.dateLabel.text, "20 juin", "date incorrect")
          XCTAssertEqual(cell?.tempLabel.text, "35", "temperature incorrect")
          XCTAssertEqual(cell?.descriptionLabel.text, "clear", "weather status incorrect")
    }
    
}
