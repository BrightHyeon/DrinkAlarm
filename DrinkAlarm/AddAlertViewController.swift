//
//  AddAlertViewController.swift
//  DrinkAlarm
//
//  Created by HyeonSoo Kim on 2022/01/31.
//

import UIKit

class AddAlertViewController: UIViewController {
    //date정보를 클로저형태로 전달하기.
    var pickedDate: ((_ date: Date) -> Void)?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let editDate = editDate {
            self.datePicker.date = editDate
        }
    }
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var editDate: Date?
    var alerts: [Alert]?
    var indexPath: Int?
    
    @IBAction func tapDismiss(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapSaveButton(_ sender: UIBarButtonItem) {
        
        if let indexPath = indexPath {
            alerts?.remove(at: indexPath)
            UserDefaults.standard.set(try? PropertyListEncoder().encode(alerts), forKey: "alerts")
            print("정보 수정됐다~")
        }
        pickedDate?(datePicker.date)
        self.dismiss(animated: true, completion: nil)
    }
    
}
