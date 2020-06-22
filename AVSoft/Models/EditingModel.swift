//
//  EditingViewModel.swift
//  AVSoft
//
//  Created by Роман Ковайкин on 17.06.2020.
//  Copyright © 2020 Роман Ковайкин. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import Firebase



@objcMembers class Person: Object{
    
    dynamic var firstName:String? = nil
    dynamic var secondName:String? = nil
    dynamic var telephoneNumber:String? = nil
    dynamic var email:String? = nil
    dynamic var photo: NSData? = nil
    dynamic var otherAttributes = List<otherAttributes>()
}


@objcMembers class otherAttributes:Object {
    dynamic var key:String? = nil
    dynamic var value:String? = nil
}
