
import UIKit

class DoctorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var availabilityLabel: UILabel!
    
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func update(with doctor: Doctor) {
        
        userNameLabel.text = doctor.userName
        emailLabel.text = doctor.email
        if doctor.available == true {
            availabilityLabel.text = "Available"
        } else {
            availabilityLabel.text = "Busy"
        }
    }
}
