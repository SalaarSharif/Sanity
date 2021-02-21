//
//  AppointmentDetailsTableViewController.swift
//  MobileProgrammingProject
//
//  Created by MobileProg on 6/19/19.
//  Copyright © 2019 MobileProg. All rights reserved.
//

import UIKit

class AppointmentDetailsTableViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var attendanceStatusLabel: UILabel!
    var appoint: Appointment?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    updateFields()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func updateFields()  {
        guard let appointment = appoint else { return  }
        nameTextField.text = appointment.patient.name
        dateTextField.text = appointment.appointmentDate.description
        locationTextField.text = appointment.doctor.location
    attendanceStatusLabel.text = appointment.status.description()
        attendanceStatusLabel.textColor = UIColor.black
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveSegue"{
            guard let destination = segue.destination as? AppointmentTableViewController else {return}
            //save into doctor
        }
    }
}


