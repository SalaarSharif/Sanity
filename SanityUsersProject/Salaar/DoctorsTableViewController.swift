//
//  DoctorTableViewController.swift
//  Sanity
//
//  Created by Ahmad T on 6/8/19.
//  Copyright © 2019 Ahmad. All rights reserved.
//

import UIKit

class DoctorTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        if let savedDoctors = Doctor.loadFromFile() {
            doctors = savedDoctors
        } else {
            doctors = Doctor.loadSampleDoctors()
        }
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
    }
    
    
    var doctors = [Doctor]()
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorCell", for: indexPath) as! DoctorTableViewCell
        
        let doctor = doctors[indexPath.row]
        
        cell.update(with: doctor)
        cell.showsReorderControl = true
        
        return cell
    }
    
    //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorCell", for: indexPath) as! DoctorTableViewCell
    //
    //        let doctor = doctors[indexPath.row]
    //
    //        cell.update(with: doctor)
    //        cell.showsReorderControl = true
    //
    //        return cell
    //    }
    
    
   
    
    @IBAction func appointmentBtn(_ sender: UIButton) {
        print("button clicked")
        let seekerAppointment = SeekerAppointment(name: "Ahmady", location: "Building 36", dateOfSeekerAppointment: Date())
        if var appointment = SeekerAppointment.loadFromFile() {
            appointment.append(seekerAppointment)
            SeekerAppointment.saveToFile(requests: [seekerAppointment])
            print("Success")
        }
    }
    
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedDoctor = doctors.remove(at: fromIndexPath.row)
        doctors.insert(movedDoctor, at: to.row)
        tableView.reloadData()
        Doctor.saveToFile(doctors: doctors)
    }
    
}

