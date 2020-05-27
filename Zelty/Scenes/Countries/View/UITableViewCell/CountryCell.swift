
import UIKit

class CountryCell: UITableViewCell {
    
    // MARK: UI Properties
    
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var countryCapitalLabel: UILabel!
    @IBOutlet weak var flasgCountryImageView: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    static let cellId = "CountryCell"
}

extension CountryCell {
    
    func bind(_ country: CountriesModels.FetchCountries.ViewModel.Country?) {
        if let name = country?.name {
            countryNameLabel.text = name
        }else {
            countryNameLabel.text = ""
        }
        
        if let capital = country?.capital {
            countryCapitalLabel.text = capital
        }else {
            countryCapitalLabel.text = ""
        }
        
        if let code = country?.alpha2Code {
            countryCodeLabel.text = code
        }else {
            countryCodeLabel.text = ""
        }
        
        DispatchQueue.main.async {
            self.flasgCountryImageView.image = nil
            
            if let url = country?.flag {
                self.flasgCountryImageView.loadImage(url: url) { (data) in
                    DispatchQueue.main.async {
                        self.flasgCountryImageView.image = UIImage(data: data!)
                    }
                }
            } else {
                self.flasgCountryImageView.image = UIImage(named: "default_thumb")
            }
        }
    }
}
