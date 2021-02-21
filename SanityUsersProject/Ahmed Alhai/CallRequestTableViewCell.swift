
import UIKit

class CallRequestTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var issueLabel: UILabel!
    @IBOutlet weak var dateOfRequestLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func update(with callRequest: CallRequest) {
        
        nameLabel.text = callRequest.userName
        issueLabel.text = callRequest.topic
        dateOfRequestLabel.text = callRequest.dateOfCallRequest.description
    }
}
