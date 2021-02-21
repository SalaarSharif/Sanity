//
//  ScheduleTableViewController.swift
//  MobileProgrammingProject
//
//  Created by MobileProg on 6/18/19.
//  Copyright © 2019 MobileProg. All rights reserved.
//

import UIKit

class ScheduleTableViewController: UITableViewController {

    @IBOutlet weak var startTimeLabel: UILabel!
    
    @IBOutlet weak var endTimeLabel: UILabel!
    
    @IBOutlet weak var startTimeDatePicker: UIDatePicker!
    
    @IBOutlet weak var endTimeDatePicker: UIDatePicker!
    
    @IBOutlet weak var availableSwitch: UISwitch!
    
    let startTimeDatePickerCellIndexPath = IndexPath(row: 1, section: 0)
    let endTimeDatePickerCellIndexPath = IndexPath(row: 3, section: 0)
   
    var isStartTimeDatePickerShown : Bool = false {
        didSet{
            startTimeDatePicker.isHidden = !isStartTimeDatePickerShown
        }
    }
    var isEndTimeDatePickerShown : Bool = false {
        didSet{
            endTimeDatePicker.isHidden = !isEndTimeDatePickerShown
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       updateDateViews()
     //self.tableView.backgroundColor = UIColor.lightGray
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

  

    

    @IBAction func showStartTime(_ sender: Any) {
        updateDateViews()
    }
    
    @IBAction func showEndTime(_ sender: Any) {
        updateDateViews()
    }
    
  
    func updateDateViews()  {
       let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        startTimeLabel.text = dateFormatter.string(from: startTimeDatePicker.date)
        endTimeLabel.text = dateFormatter.string(from: endTimeDatePicker.date)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case startTimeDatePickerCellIndexPath:
            
            if isStartTimeDatePickerShown{
                return 216.0
            } else {
                return 0.0
            }
        case endTimeDatePickerCellIndexPath:
            
            if isEndTimeDatePickerShown{
                
                return 216.0
            } else {
               
                return 0.0
            }
            
        default:
          
            return 44.0
        }
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath {
        case [0,0]:

            if isStartTimeDatePickerShown{
                isStartTimeDatePickerShown = false

            } else if isEndTimeDatePickerShown{

                isEndTimeDatePickerShown = false
                isStartTimeDatePickerShown = true
            }else{

                isStartTimeDatePickerShown = true
            }

            tableView.beginUpdates()
            tableView.endUpdates()

        case [0,2]:
        print("2")
            if isEndTimeDatePickerShown{
                isEndTimeDatePickerShown = false
            } else if isStartTimeDatePickerShown{
                isEndTimeDatePickerShown = true
                isStartTimeDatePickerShown = false
            }else{
                isEndTimeDatePickerShown = true
            }

            tableView.beginUpdates()
            tableView.endUpdates()
            
        default:
            break
        }
    }
  
   
    
    @IBAction func availableSwitchChange(_ sender: Any) {
        if availableSwitch.isOn {
            startTimeDatePicker.isEnabled = true
            endTimeDatePicker.isEnabled = true
        } else {
            startTimeDatePicker.isEnabled = false
            endTimeDatePicker.isEnabled = false
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        
    }
    
    
}
