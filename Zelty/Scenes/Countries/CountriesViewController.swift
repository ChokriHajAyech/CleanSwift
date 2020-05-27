
import UIKit
import Foundation

class CountriesViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    private var resultSearchController = UISearchController()
    var interactor: CountriesBusinessLogic?
    var router: (NSObjectProtocol & CountriesRoutingLogic & CountriesDataPassing)?
    private var viewModel: CountriesModels.FetchCountries.ViewModel?  {
        didSet {
            DispatchQueue.main.async {
                self.loadUI()
            }
        }
    }
    
    // MARK: - Object lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureTableView()
        configureSearchController()
        fetchCountries()
    }
    
    // MARK: Configure TableView
    
    private func configureTableView() {
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        tableView.estimatedSectionHeaderHeight = 10
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView()
        //        tableView.separatorStyle = .none
        let nib = UINib(nibName: CountryCell.cellId, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CountryCell.cellId)
    }
    
    // MARK: - Configure SearchController
    
    private func configureSearchController () {
        
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            controller.searchBar.placeholder = "Chercher un pays..."
            return controller
        })()
        
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = false
            navigationItem.searchController = resultSearchController
        } else {
            tableView.tableHeaderView = resultSearchController.searchBar
        }
    }
    
    // MARK: - Configure NavigationBar
    
    private func configureNavigationBar () {
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.topItem?.title = "Liste des pays"
    }
    
    // MARK: - Setup VIP
    
    private func setup() {
        
        let viewController = self
        let interactor = CountriesInteractor()
        let presenter = CountriesPresenter()
        let router = CountriesRouter()
        viewController.interactor = interactor
        presenter.viewController = viewController
        interactor.presenter = presenter
        viewController.router = router
        router.dataStore = interactor
        router.viewController = viewController
    }
}

// MARK: CountriesDisplayLogic

extension CountriesViewController: CountriesDisplayLogic {
    
    func displayFetchedCountries(with viewModel: CountriesModels.FetchCountries.ViewModel) {
        self.viewModel = viewModel
    }
    
    func displaySearchedCountries(with viewModel: CountriesModels.FetchCountries.ViewModel) {
        self.viewModel = viewModel
    }
}

// MARK: UITableViewDelegate

extension CountriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let capital = viewModel?.listCountry[indexPath.row].capital  else {
            return
        }
        router?.routeToCurrentDay(city: capital)
    }
}

// MARK: UITableViewDataSource

extension CountriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.listCountry.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.cellId, for: indexPath) as! CountryCell
        let country = viewModel?.listCountry[indexPath.row]
        cell.bind(country)
        return cell
    }
}

// MARK: UISearchResultsUpdating

extension CountriesViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text, !text.isEmpty else {
            searchData(for: "")
            return
        }
        searchData(for: text)
    }
}

// MARK: Event

extension CountriesViewController {
    
    func fetchCountries() {
        let request = CountriesModels.FetchCountries.Request()
        interactor?.fetchCountries(with: request)
    }
    
    func searchData(for text: String) {
        let request = CountriesModels.FetchCountries.SearchRequest(text: text)
        interactor?.searchCountry(with:request)
    }
    
    func loadUI() {
        tableView.reloadData()
    }
}
