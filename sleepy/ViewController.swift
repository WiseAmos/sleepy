//
//  ViewController.swift
//  sleepy
//
//  Created by Amos Goh En Jie on 8/11/19.
//  Copyright © 2019 Amos. All rights reserved.
//

import UIKit
import UserNotifications


class ViewController: UIViewController {
    @IBOutlet weak var send: UIButton!
    @IBOutlet weak var hour: UITextField!
    @IBOutlet weak var minute: UITextField!
    @IBOutlet weak var error: UILabel!
    

    
    override func viewDidLoad() {
          super.viewDidLoad()
         
        
       

        let center = UNUserNotificationCenter.current()

        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Yay!")
            } else {
                print("D'oh")
            }
        }
        
        
        send.layer.cornerRadius = 25
        
        // Do any additional setup after loading the view.
    }

 

    @IBAction func sends(_ sender: Any) {
    
        let hours: Int? = Int(hour.text!)
        let minutes: Int? = Int(minute.text!)

        
        
      
        if  hours! > 24 || minutes! > 60 || hours! == nil || minutes! == nil {
            
            error.text = "Sorry, the time you place is wrong please try again, thank you."
            
        }
        else {
            
            let center = UNUserNotificationCenter.current
                  
                  let content = UNMutableNotificationContent()
                  content.title = "GO TO SLEEP!"
                  content.body = "It is time for you to go sleep, goodnight :)"
                  content.sound = .default
                  
                  var date = DateComponents()
                  date.hour = hours
                  date.minute = minutes
                  let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
            
            
                  let request = UNNotificationRequest(identifier: "reminder", content: content, trigger: trigger )
                  center().add(request) { (error) in
                      if error != nil {
                          print("error = \(error?.localizedDescription ?? "error local nofication") ")
                      }
                  }
            
        }
       
        
        
    
    }
    

}


