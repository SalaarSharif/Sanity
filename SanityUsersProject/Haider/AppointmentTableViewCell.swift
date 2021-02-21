
import UIKit

class AppointmentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var patientLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func update(with appointment: Appointment) {
        
        dateLabel.text = appointment.appointmentDate.description
        patientLabel.text = appointment.patient.name
        locationLabel.text = appointment.doctor.location
        statusLabel.text = appointment.status.description()
        
    }
}
