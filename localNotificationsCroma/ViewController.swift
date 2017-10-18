//
//  ViewController.swift
//  localNotificationsCroma
//
//  Created by anil kumar srivastava on 10/6/17.
//  Copyright © 2017 AditiSrivastava. All rights reserved.
//

import UIKit

//4 - import the UserNotifications framework in the ViewController
import UserNotifications

//13 -
class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    @IBOutlet weak var result: UILabel!
    //6 - Create a button action
    @IBAction func getProblemBtnTapped(_ sender: Any) {
        
        //7 -
        let mathContent = UNMutableNotificationContent()
        mathContent.title = "Math Quiz!"
        mathContent.subtitle = "Do you remember high school algebra?"
        mathContent.body = "What is the equation for slope-intercept form?"
        mathContent.badge = 1
        mathContent.categoryIdentifier = "mathQuizCategory"
        
        //8 -
        let quizTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        
        //9 -
        let quizRequestIdentifier = "mathQuiz"
        let request = UNNotificationRequest(identifier: quizRequestIdentifier, content: mathContent, trigger: quizTrigger)
        
        //10 -
        UNUserNotificationCenter.current().add(request) { (error) in
            //11 -
            print(error as Any)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //12 -
        UNUserNotificationCenter.current().delegate = self
    }
    
    //MARK - UNNotification Delegate Methods
    
    //14 -
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        //15 -
        completionHandler([.alert, .sound])
    }
    
    //16 -
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        //17 -
        if response.actionIdentifier == "y = mx + b" {
            result.text = "That's the correct answer!"
        } else if response.actionIdentifier == "Ax + By = C" {
            result.text = "Sorry, that's the standard form equation."
        } else {
            result.text = "Keep trying!"
        }
    }
    
}

