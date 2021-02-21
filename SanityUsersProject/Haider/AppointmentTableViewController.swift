//
//  AppointmentTableViewController.swift
//  Sanity
//
//  Created by Ahmad T on 6/8/19.
//  Copyright © 2019 Ahmad. All rights reserved.
//

import UIKit

class AppointmentTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.clear
        
        if let savedAppointments = Appointment.loadFromFile() {
            appointments = savedAppointments
        } else {
            appointments = Appointment.loadSampleAppointments() ?? []
        }
        
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(dismiss(fromGesture:)))
        tableView.addGestureRecognizer(gesture)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
    }
    
    @objc func dismiss(fromGesture gesture: UISwipeGestureRecognizer) {
        //Your dismiss code
        //Here you should implement your checks for the swipe gesture
        
    }
    
    
    var appointments = [Appointment]()
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appointments.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppointmentCell", for: indexPath) as! AppointmentTableViewCell
        
        let appointment = appointments[indexPath.row]
        
        cell.update(with: appointment)
        cell.showsReorderControl = true
        
        return cell
    }
    
    //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorCell", for: indexPath) as! AppointmentTableViewCell
    //
    //        let appointment = appointments[indexPath.row]
    //
    //        cell.update(with: appointment)
    //        cell.showsReorderControl = true
    //
    //        return cell
    //    }
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        let tableViewEditingMode = tableView.isEditing
        
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            appointments.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        Appointment.saveToFile(appointments: appointments)
    }
    
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedAppointment = appointments.remove(at: fromIndexPath.row)
        appointments.insert(movedAppointment, at: to.row)
        tableView.reloadData()
        Appointment.saveToFile(appointments: appointments)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "EditAppointment"{
            
            let indexPath = tableView.indexPathForSelectedRow!
            
            let appointment = appointments[indexPath.row]
            
            let navController = segue.destination as! UINavigationController
            
            let destinationVC = navController.topViewController as! AppointmentDetailsTableViewController
            
            destinationVC.appoint = appointment
            
        }
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if segue.identifier == "EditAppointment" {
//            let indexPath = tableView.indexPathForSelectedRow!
//            let appointment = appointments[indexPath.row]
//            let navController = segue.destination as! UINavigationController
//            let addEditAppointmentTableViewController = navController.topViewController as! AddEditAppointmentTableViewController
//
//            addEditAppointmentTableViewController.appointment = appointment
//        }
//    }
    
    // MARK: - Navigation
//    @IBAction func unwindToAppointmentTableView(segue: UIStoryboardSegue) {
//        guard segue.identifier == "saveUnwind" else { return }
//        let sourceViewController = segue.source as! AddEditAppointmentTableViewController
//        
//        if let appointment = sourceViewController.appointment {
//            if let selectedIndexPath = tableView.indexPathForSelectedRow {
//                appointments[selectedIndexPath.row] = appointment
//                tableView.reloadRows(at: [selectedIndexPath], with: .none)
//                print("1")
//            } else {
//                let newIndexPath = IndexPath(row: appointments.count, section: 0)
//                appointments.append(appointment)
//                tableView.insertRows(at: [newIndexPath], with: .automatic)
//                print("2")
//            }
//        } else {
//            print("3")
//        }
//        
//        Appointment.saveToFile(appointments: appointments)
//    }
    
    
    
}

