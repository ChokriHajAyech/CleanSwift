
import UIKit

class WeeklyCell: UITableViewCell {
    static let cellId = "WeeklyCell"
    
    @IBOutlet weak var addNoteButton: UIButton!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    public var didTapOnAddNoteButton: (()-> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureTitle()
    }
    
    // MARK: - Configuration
    
    func configureTitle() {
        addNoteButton.addTarget(self, action: #selector(didTapOnButton), for: .touchUpInside)
    }
}

extension WeeklyCell {
    
    func bind(_ weekly: WeeklyModels.FetchWeatherWeekly.ViewModel.Item) {
        dateLabel.text = weekly.date
        descriptionLabel.text = weekly.weather
        tempLabel.text = weekly.main
    }
    
    @objc func didTapOnButton() {
        if let didTapOnAddNoteButton = didTapOnAddNoteButton {
            didTapOnAddNoteButton()
        }
    }
}
