//
//  RegistrationViewModel.swift
//  AVSoft
//
//  Created by Роман Ковайкин on 16.06.2020.
//  Copyright © 2020 Роман Ковайкин. All rights reserved.
//

import Foundation
import Firebase
import UIKit

func createUser(email:String, password:String) -> Bool{
    Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
        if let error = error{
            print(error.localizedDescription)
            return
        }
        guard let uid = result?.user.uid else {
            print("uid error")
            return
        }
        let values = ["Email":email] as [String : Any]
        Database.database().reference().child(uid).updateChildValues(values) { (error, ref) in
            if let error = error{
                print("Failed to update data", error.localizedDescription)
                return
            }
        }
    }
    return true
}

