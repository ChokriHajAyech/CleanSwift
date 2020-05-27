
import UIKit
import MapKit
import CoreLocation

class CurrentDayViewController: UIViewController {
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    let locationManager = CLLocationManager()
    var router: (NSObjectProtocol & CurrentDayRoutingLogic & CurrentDayDataPassing)?
    var interactor:CurrentDayBusinessLogic?
    private var viewModel: CurrentDayModels.FetchWeatherCurrentDay.ViewModel?  {
        didSet {
            DispatchQueue.main.async {
                self.bind()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkAutorizationStatus()
        fetchWeatherForCurrentDay()
        mapView.delegate = self
    }
    
    // MARK: - Object lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup VIP
    
    private func setup() {
        
        let viewController = self
        let interactor = CurrentDayInteractor()
        let presenter = CurrentDayPresenter()
        let router = CurrentDayRouter()
        viewController.interactor = interactor
        presenter.viewController = viewController
        interactor.presenter = presenter
        viewController.router = router
        router.dataStore = interactor
        router.viewController = viewController
    }
}

extension CurrentDayViewController: CurrentDayDisplayLogic {
    
    func displayWeatherForCurrentDay(with viewModel: CurrentDayModels.FetchWeatherCurrentDay.ViewModel) {
        self.viewModel = viewModel
    }
}

extension CurrentDayViewController {
    
    func fetchWeatherForCurrentDay() {
        if let city = router?.dataStore?.city {
            let request = CurrentDayModels.FetchWeatherCurrentDay.Request(text: city)
            interactor?.fetchWeatherForCurrentDay(with: request)
        }
    }
    
    func bind()  {
        
        temperatureLabel.text = viewModel?.temperature
        maxTemperatureLabel.text = viewModel?.maxTemperature
        minTemperatureLabel.text = viewModel?.minTemperature
        humidityLabel.text = viewModel?.humidity
        countryLabel.text = router?.dataStore?.city
        
        let location = CLLocationCoordinate2D(latitude: viewModel?.lat ?? 0, longitude: viewModel?.lon ?? 0)
        
        let span = MKCoordinateSpan(latitudeDelta: 15, longitudeDelta: 15)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        //3
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = router?.dataStore?.city
        annotation.subtitle = router?.dataStore?.city
        mapView.addAnnotation(annotation)
        
    }
    
    @IBAction func weatherForWeek(_ sender: Any) {
        if let city =  router?.dataStore?.city {
            router?.routeToWeekly(city: city)
        }
    }
}

extension CurrentDayViewController: MKMapViewDelegate, CLLocationManagerDelegate {
    
    private func centerMapOnLocation(location: CLLocation) {
        let regionRadius : CLLocationDistance = 100
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func checkAutorizationStatus() {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        mapView.delegate = self
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
        if let coor = mapView.userLocation.location?.coordinate{
            mapView.setCenter(coor, animated: true)
        }
    }
}
