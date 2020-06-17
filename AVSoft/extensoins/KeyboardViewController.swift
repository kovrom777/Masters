//
//  KeyboardViewController.swift
//  AVSoft
//
//  Created by Роман Ковайкин on 16.06.2020.
//  Copyright © 2020 Роман Ковайкин. All rights reserved.
//

import UIKit

class KeyboardViewController: UIViewController {
    
   
    func registerForKeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    func kbWillShow(notification:Notification){
        let userInfo = notification.userInfo
        let kbFrameHeight = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= kbFrameHeight.height - 100
        }

    }
    
    @objc
    func kbWillHide(notification:Notification){
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

}

