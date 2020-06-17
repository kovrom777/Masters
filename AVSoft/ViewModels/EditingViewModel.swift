//
//  EditingViewModel.swift
//  AVSoft
//
//  Created by Роман Ковайкин on 17.06.2020.
//  Copyright © 2020 Роман Ковайкин. All rights reserved.
//

import Foundation
import UIKit

class Person{
    var firstName:String = ""
    var secondName:String = ""
    var telephoneNumber:String = ""
    var email:String = "" // Подгрузить с БД
    var password:String = ""
    var photo:UIImage = #imageLiteral(resourceName: "DefaultPhoto")
    var otherAttributes: [String:Any] = [:]
    
    init(firstName:String, secondName:String, telephoneNumber:String, email:String, password:String) {
        self.firstName = firstName
        self.secondName = secondName
        self.telephoneNumber = telephoneNumber
        self.email = email
        self.password = password
    }
    
    func addNewAttributes (otherAttributes: [String:Any]){
        self.otherAttributes = otherAttributes
    }
    
    func updatePhoto (photo:UIImage){
        self.photo = photo
    }
    
}
