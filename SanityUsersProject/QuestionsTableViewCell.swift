
import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var questionLabel: UILabel!
  
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func update(with question: Question) {
        questionLabel.text = question.question
       
    }
}
