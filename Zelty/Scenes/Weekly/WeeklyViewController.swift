
import UIKit
import Foundation

class WeeklyViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    var interactor: WeeklyBusinessLogic?
    var router: (NSObjectProtocol & WeeklyRoutingLogic & WeeklyDataPassing)?
    
    private var viewModel: WeeklyModels.FetchWeatherWeekly.ViewModel?  {
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
        fetchWeatherWeekly()
    }
    
    // MARK: Configure TableView
    
    private func configureTableView() {
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        tableView.estimatedSectionHeaderHeight = 10
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView()
        let nib = UINib(nibName: WeeklyCell.cellId, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: WeeklyCell.cellId)
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
        let interactor = WeeklyInteractor()
        let presenter = WeeklyPresenter()
        let router = WeeklyRouter()
        let worker = WeeklyWorker()
        viewController.interactor = interactor
        presenter.viewController = viewController
        interactor.presenter = presenter
        interactor.worker = worker
        viewController.router = router
        router.dataStore = interactor
        router.viewController = viewController
    }
}

// MARK: CountriesDisplayLogic

extension WeeklyViewController: WeeklyDisplayLogic {
    func displayWeatherForWeeky(with viewModel: WeeklyModels.FetchWeatherWeekly.ViewModel) {
        self.viewModel = viewModel
    }
}
//
//// MARK: UITableViewDataSource
//
extension WeeklyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeeklyCell.cellId, for: indexPath) as! WeeklyCell
        let weekly = viewModel?.list[indexPath.row]
        cell.bind(weekly!)
        cell.didTapOnAddNoteButton = {
            self.addNote()
        }
        return cell
    }
}


extension WeeklyViewController {
    
    func fetchWeatherWeekly() {
        
        if let city = router?.dataStore?.city {
            let request = WeeklyModels.FetchWeatherWeekly.Request(text: city)
            interactor?.fetchWeatherForWeekly(with: request)
        }
    }
    
    func loadUI() {
        tableView.reloadData()
    }
    
    private func addNote(){
        
        let alertController = UIAlertController(title: "Note", message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Ajouter votre commentaire"
        }
        let saveAction = UIAlertAction(title: "Enregistrer", style: UIAlertAction.Style.default, handler: { alert -> Void in
            _ = alertController.textFields![0] as UITextField
        })
        let cancelAction = UIAlertAction(title: "Annuler", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
